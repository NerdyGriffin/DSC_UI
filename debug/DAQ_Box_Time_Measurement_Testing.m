% DSC_UI: UI and control systems for prototype DSC system
%     Copyright (C) 2019  Christian Kunis
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
%
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program. If not, see <https://www.gnu.org/licenses/>.
%
%     You may contact the author at ckunis.contact@gmail.com

%% DSC_Testing_Script.m
%Author: Christian Kunis (10/10/18)
clc
clear

%%

% Update the search path
updatepath()

%% Symbolic Constants

KELVIN_CONVERSION_FACTOR = 273;

PID_K_P = 0.010;
PID_K_I = 0.000;
PID_K_D = 0.000;

%% Define Configuration Parameters

InputSession = []; % The session for reading temperature and power data

OutputSession = []; % The session for controlling the power output to the heating coils


MaxTempLimit = 150; % The maximum allowable temperature in degrees Celsius

Interp1Type = 'spline'; % Controller variable to control which type of interpolation is used on the Differential plots


% Request the starting temp, ramp up rate, and ending temp from the user
%StartTemp = input('Enter the desired starting temperature of the samples: ');
%RampUpRate = input('Enter the desired ramp up rate: ');
%EndTemp = input('Enter the desired ending temperature for the samples: ');
%HoldTime = input('Enter the desired hold time once the end temp is reached: ');
StartTemp = 20;
RampUpRate = 20;
EndTemp = 100;
HoldTime = 100;

DataIndex = 0; % A counter used for assigning experiment data to the correct indices of the output arrays


ElapsedTime = 0; % The current elapsed time since the experiment started

% Array for the time (in seconds) at which each reading is taken
TimeData = [];


CurrentStage_ElapsedTime = 0; % The current elapsed time since the current stage started
CurrentStage_EstimatedTimeRemaining = 0; % The estimated time remaining until the current control stage will end


StubTemp = 20; % A temperature value used for simulating temperature data when stubs are enabled
StubPower = 0; % A power value used for simulating power data when stubs are enabled


TargetTempData = []; % Array of temp target values, used for temperature control error analysis


% Arrays for the measured temperatures from each reading
CelsiusTempData_Reference = [];
CelsiusTempData_TestSample = [];

% Arrays for the measured temperatures from each reading
KelvinTempData_Reference = [];
KelvinTempData_TestSample = [];


% Arrays for the error (difference) comparing the measured temperatures and the target temperature from each reading
TempError_Reference = [];
TempError_TestSample = [];


% Arrays for the PIDOut values calculated by the calculatePID function
PIDOutData_Reference = [];
PIDOutData_TestSample = [];

% Arrays for the measured power outputs from each reading
PowerData_Reference = [];
PowerData_TestSample = [];


% Arrays for the calculated HeatFlowRate values from each reading
HeatFlowRateData_Reference = [];
HeatFlowRateData_TestSample = [];
HeatFlowRateData_Differential = [];
HeatFlowRateData_Zero = [];


% Array for storing all of the data in columns to allow for sorting
AllData = [];

XAxisData = 'Time';

TemperatureUnits = 'Celsius';

TempSensorSelection = 'Thermocouple';

TempCalibrationOffset_Reference = 14;
TempCalibrationOffset_TestSample = 11;
PowerCalibrationOffset_Reference = 0;
PowerCalibrationOffset_TestSample = 0;


%% Initialize the DAQ Box sessions
% Handled by the DAQBox class
daqBox = DAQBox;

%%

% Make a figure windows and axes for the debug plots
UIAxesTemperature = axes(figure());
UIAxesPIDOut = axes(figure());
% UIAxesPower = axes(figure());


% UIAxesDifferential = axes(figure());

% UIAxesSamples = axes(figure());

% Start the ExperimentTimer for recording the ElapsedTime
ExperimentTimer = tic;

PIDOutControl = 10;

%% Take initial reading
[DaqBoxExpStartDate, LatestTemp_Ref, LatestTemp_Samp,...
    LatestCurrent_Ref, LatestCurrent_Samp]...
    = daqBox.getSingleScanData()

% Compare this date with the Matlab one
MatlabExpStartDate = datenum(datetime)

fprintf("DAQBox: %f\n", DaqBoxExpStartDate)
fprintf("MATLAB: %f\n", MatlabExpStartDate)
fprintf("Diff:   %f\n", DaqBoxExpStartDate - MatlabExpStartDate)
disp()

%% Run the Ramp Up loop

% Estimate the total duration for the current stage
EstimatedStageDuration = HoldTime...
    + ((EndTemp - StartTemp) / (RampUpRate / 60));

% Start the stage timer
StageTimer = tic;

% Initialize the TargetTemp to zero to allow the TargetTemp to be
% calculated within the loop
TargetTemp = 0;

HeatingLoopController = true;
while HeatingLoopController
    
    % Increase the data index value at the start of each iteration
    DataIndex = DataIndex + 1;
    
    
    
    % Record the current elapsed time since starting the experiment
    ElapsedTime = toc(ExperimentTimer);
    
    % Add the current ElapsedTime value to the TimeData array
    TimeData(DataIndex) = ElapsedTime;
    
    % Record the current elapsed time since starting the current stage
    ElapsedStageTime = toc(StageTimer);
    
    
    
    % Calculate the current Target Temp
    if EndTemp > StartTemp
        if TargetTemp < EndTemp
            TargetTemp = StartTemp + (RampUpRate / 60) * ElapsedStageTime;
        else
            TargetTemp = EndTemp;
        end
        
    elseif EndTemp < StartTemp
        if TargetTemp > EndTemp
            TargetTemp = StartTemp + (RampUpRate / 60) * ElapsedStageTime;
        else
            TargetTemp = EndTemp;
        end
        
    end
    
    % Add the current Target Temp to the TargetTempData array
    TargetTempData(DataIndex) = TargetTemp;
    
    
    
    % Take the temperature and power readings
    [LatestTemp_Ref, LatestTemp_Samp,...
        LatestCurrent_Ref, LatestCurrent_Samp,...
        timeStamps, triggerTime]...
        = takeMeasurements(InputSession, TempSensorSelection,...
        TempCalibrationOffset_Reference, TempCalibrationOffset_TestSample,...
        PowerCalibrationOffset_Reference, PowerCalibrationOffset_TestSample,...
        StubTemp, StubPower);
    
    
    
    % Add the current temperature readings to the TempData arrays
    CelsiusTempData_Reference(DataIndex) = LatestTemp_Ref;
    CelsiusTempData_TestSample(DataIndex) = LatestTemp_Samp;
    KelvinTempData_Reference(DataIndex) = LatestTemp_Ref...
        + KELVIN_CONVERSION_FACTOR;
    KelvinTempData_TestSample(DataIndex) = LatestTemp_Samp...
        + KELVIN_CONVERSION_FACTOR;
    
    
    
    % Calculate and store the difference between CurrentTemp and TargetTemp
    CurrentTempError_Reference = LatestTemp_Ref - TargetTemp;
    CurrentTempError_TestSample = LatestTemp_Samp - TargetTemp;
    
    % Add the current error values to the TempError arrays
    TempError_Reference(DataIndex) = CurrentTempError_Reference;
    TempError_TestSample(DataIndex) = CurrentTempError_TestSample;
    
    
    
    % Add the current power readings to the PowerData arrays
    PowerData_Reference(DataIndex) = LatestCurrent_Ref;
    PowerData_TestSample(DataIndex) = LatestCurrent_Samp;
    
    
    
    % % Calculate the heat flow rate
    % HeatFlowRate_Reference = LatestCurrent_Reference / SampleMass_Reference;
    % HeatFlowRate_TestSample = LatestCurrent_Samp / SampleMass_TestSample;
    % HeatFlowRate_Differential = HeatFlowRate_TestSample - HeatFlowRate_Reference;
    
    % Use the temperatures instead of heatflow for debug purposes
    HeatFlowRate_Reference = LatestTemp_Ref;
    HeatFlowRate_TestSample = LatestTemp_Samp;
    
    % Add the HeatFlowRate values to the HeatFlowRateData arrays to
    % indicate power off/cooling state
    HeatFlowRateData_Reference(DataIndex) = HeatFlowRate_Reference;
    HeatFlowRateData_TestSample(DataIndex) = HeatFlowRate_TestSample;
    HeatFlowRateData_Differential(DataIndex)...
        = HeatFlowRate_TestSample - HeatFlowRate_Reference;
    
    
    
    % Perform the PID calculations for the reference sample
    [PIDOut_Reference] = calculatePID(TimeData, TempError_Reference,...
        PID_K_P, PID_K_I, PID_K_D);
    
    % Perform the PID calculations for the test sample
    [PIDOut_TestSample] = calculatePID(TimeData, TempError_TestSample,...
        PID_K_P, PID_K_I, PID_K_D);
    
    % Bounds checking for the reference sample temperature
    if LatestTemp_Ref > MaxTempLimit
        % Set the output ports to 0 (OFF) if the CurrentTemp exceeds the
        % MaxTempLimit
        PIDOut_Reference = -1e9;
        
    end
    
    % Bounds checking for the test sample temperature
    if LatestTemp_Samp > MaxTempLimit
        % Set the output ports to 0 (OFF) if the CurrentTemp exceeds the
        % MaxTempLimit
        PIDOut_TestSample = -1e9;
        
    end
    
    % Add the current PIDOut values to the PIDOutData arrays
    PIDOutData_Reference(DataIndex) = PIDOut_Reference;
    PIDOutData_TestSample(DataIndex) = PIDOut_TestSample;
    
    
    
    %Adjust the output for both the Reference and the TestSample according
    %to the PIDOut calculated
    setPWMDutyCycle(OutputSession, PIDOutControl,...
        PIDOut_Reference, PIDOut_TestSample)
    
    
    
    % Record the current elapsed time since starting the experiment
    ElapsedTime = toc(ExperimentTimer);
    
    % Record the current elapsed time since starting the current stage
    ElapsedStageTime = toc(StageTimer);
    
    
    
    % Combine the data arrays as columns of the AllData array for easy sorting
    AllData = combineDataArrays(TimeData, TargetTempData,...
        CelsiusTempData_Reference, CelsiusTempData_TestSample,...
        KelvinTempData_Reference, KelvinTempData_TestSample,...
        TempError_Reference, TempError_TestSample,...
        PowerData_Reference, PowerData_TestSample,...
        HeatFlowRateData_Reference, HeatFlowRateData_TestSample,...
        HeatFlowRateData_Differential,...
        PIDOutData_Reference, PIDOutData_TestSample);
    
    
    
    %     % Redraw the data plots
    %     plotData(UIAxesDifferential, UIAxesSamples,...
    %        AllData, XAxisData, TemperatureUnits, Interp1Type)
    %     xlabel(UIAxesDifferential, 'Temperature (C)')
    %     ylabel(UIAxesDifferential, 'Heat Flow (Differential)')
    %     xlabel(UIAxesSamples, 'Temperature (C)')
    %     ylabel(UIAxesSamples, 'Heat Flow')
    
    
    % Plots for debugging
    plot(UIAxesTemperature,...
        TimeData, TargetTempData,...
        TimeData, CelsiusTempData_Reference,...
        TimeData, CelsiusTempData_TestSample);
    legend(UIAxesTemperature, 'Target Temp', 'Reference Samp Temp', 'Test Sample Temp', 'Location', 'best')
    xlabel(UIAxesTemperature, 'Time (s)')
    ylabel(UIAxesTemperature, 'Temperature (C)')
    
    plot(UIAxesPIDOut,...
        TimeData, PIDOutData_Reference,...
        TimeData, PIDOutData_TestSample)
    legend(UIAxesPIDOut, 'Reference Samp PID', 'Test Sample PID', 'Location', 'best')
    xlabel(UIAxesPIDOut, 'Time (s)')
    ylabel(UIAxesPIDOut, 'PID Out Value')
    
    %     plot(UIAxesPower,...
    %         TimeData, PowerData_Reference,...
    %         TimeData, PowerData_TestSample)
    %     legend(UIAxesPower, 'Reference Samp Power', 'Test Sample Power', 'Location', 'best')
    %     xlabel(UIAxesPower, 'Time (s)')
    %     ylabel(UIAxesPower, 'Power (raw input values)')
    %
    
    
    % Compare the sample temperatures to the end temperature
    if TargetTemp == EndTemp
        if abs(CurrentTempError_Reference) < 1 && abs(CurrentTempError_TestSample) < 1
            HeatingLoopController = false;
            
        end
        
    end
    
end

function setupSingleTarget(latestTemp_Ref, latestTemp_Samp)
%setupSingleTarget
%   Initialize the appropriate variables for single target heating
%   then start the heating

% Set the target temp to the start temp
obj.TargetTemp = obj.StartTemp;

% Measure the start time of the current stage
latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

% Record the latest stage serial date
obj.liveData.LatestStageSerialDate = latestStageSerialDate;

% Start single target heating
startHeating();

end

function startHeating()
try
    if isvalid(daqBox.lh_DataAvailable)
        delete(daqBox.lh_DataAvailable)
    end
catch ME
    warning('Failed to delete listener')
    % Force the experiment to stop in the event of an error
    % stageController.forceStop();
    rethrow(ME)
end

daqBox.lh_DataAvailable = addlistener(daqBox.InputSession,...
    'DataAvailable', @singleTargetDataFcn);

daqBox.InputSession.startBackground();
end

function singleTargetDataFcn(src, event)
%singleTargetDataFcn
%   Dynamically controls the power output in order to heat the
%   samples until they reach the target temperature

% Run the live data analysis
obj.experimentLiveDataAnalysis(event);

% Force the function to end if requested by the user
if obj.ForceStop
    obj.stopDAQ();
    return
end

% Force the function to end if the user requested to skip the
% stage
if obj.ForceSkipStage
    obj.stopDAQ();
    return
end


% Compare the sample temperatures to the target temperature
if (abs(obj.liveData.LatestTempError_Ref) < obj.MINIMUM_ACCEPTABLE_ERROR)...
        && (abs(obj.liveData.LatestTempError_Samp) < obj.MINIMUM_ACCEPTABLE_ERROR)
    obj.stopDAQ();
    return
end
end