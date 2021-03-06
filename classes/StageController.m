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

classdef StageController < handle
    %StageController
    %   Controller class for managing the temperature control and staging
    %   procedure during live experiments
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        UseAppUI
        
        TemperatureControlStaging(:,5) = [] % Array of configuration values for temperature control cycles defined by the user
        
        StagingSaveStatus logical = false % Status of whether the current staging table has been saved to a file
        
        % An object of the DSC_GUI_APP class or the DSC_CLI_APP class which
        % provides the user iterface
        app
        
        % An object of the DAQBox class which represents the DAQ Box and
        % provides support for inputs and outputs
        daqBox DAQBox
        
        % An object of the DSCData class which is responsible to storing
        % and maintaining data while an experiment is running
        liveData DSCData
        
        EstimatedStageDuration {mustBeNonnegative} = 0
        
        ExperimentInProgress = false % Status of whether the system is currently running measurements
        
        RefreshCounter = 0;
        TargetCounter = 0;
        
        % Controller variable to indicate if a running experiment should be
        % stopped before the end of the experiment
        ForceStop logical = false
        
        % Controller variable to indicate if an experiment control stage
        % should be stopped before the end of the stage
        ForceSkipStage logical = false
        
    end
    
    properties (Access = private)
        % A MATLAB timer object that is used to perform an autosave of the
        % experiment objects at regular intervals
        AutosaveTimer timer
        
        AutosaveTimerExecutionMode = 'fixedRate'
        
        % The time in seconds between executions of the autosave function
        AutosavePeriod = 120
        
        StageCounter
        
        TargetTemp
        
    end
    
    properties (Dependent)
        MaxTempLimit
        
        NumberOfStages
        
        StartTemp
        RampUpRate
        EndTemp
        HoldTime
        
    end
    
    properties (Constant)
        % the file path to load the default staging file
        DEFAULT_STAGING_LOAD_PATH = './staging/defaultStaging.stage';
        
        % the file path to save a new staging file
        DEFAULT_STAGING_SAVE_PATH = './staging/newStaging.stage';
        
        % The minimum acceptable error between the sample temperatures and
        % the target temperature. The error for both samples must be less
        % than this value before the stage controller will continue to the
        % next stage. Units: [\Delta degrees C]
        MINIMUM_ACCEPTABLE_ERROR = 1.5
        
        % The number of the consecutive samples within the
        % MINIMUM_ACCEPTABLE_ERROR that are required before the program
        % considers the target to be satisfied
        TARGET_COUNTER_THRESHOLD = 1000;
        
        % The number of new samples to wait before attempting to refresh
        % the plots
        REFRESH_COUNTER_THRESHOLD = 20;
    end
    
    % Class Constructor
    methods
        function obj = StageController(app, TemperatureControlStaging)
            %StageController Construct an instance of this class
            %   Detailed explanation goes here
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            if nargin > 0
                obj.app = app;
                obj.UseAppUI = true;
                if nargin > 1
                    obj.TemperatureControlStaging = TemperatureControlStaging;
                else
                    obj.loadStagingFile('default');
                end
            else
                delete(obj.app)
                obj.UseAppUI = false;
                obj.loadStagingFile('default');
            end
        end
    end
    
    % Dependant Properties Accessor Methods
    methods
        function maxTempLimit = get.MaxTempLimit(obj)
            %get.MaxTempLimit
            %   Return the maximum temperature allowed for the samples
            if isempty(obj.daqBox) || ~isvalid(obj.daqBox)
                maxTempLimit = 300;
            else
                maxTempLimit = obj.daqBox.MaxTempLimit;
            end
        end
        
        function numberOfStages = get.NumberOfStages(obj)
            %get.NumberOfStages
            %   Return the number of stages listed in the
            %   TemperatureControlStaging array
            numberOfStages = size(obj.TemperatureControlStaging, 1);
        end
        
        function startTemp = get.StartTemp(obj)
            %get.StartTemp
            %   Return the currently stored value of the start temp
            startTemp = obj.TemperatureControlStaging(obj.StageCounter, 2);
        end
        
        function rampUpRate = get.RampUpRate(obj)
            %get.RampUpRate
            %   Return the currently stored value of the ramp up rate
            rampUpRate = obj.TemperatureControlStaging(obj.StageCounter, 3);
        end
        
        function endTemp = get.EndTemp(obj)
            %get.EndTemp
            %   Return the currently stored value of the end temp
            endTemp = obj.TemperatureControlStaging(obj.StageCounter, 4);
        end
        
        function holdTime = get.HoldTime(obj)
            %get.HoldTime
            %   Return the currently stored value of the hold time
            holdTime = obj.TemperatureControlStaging(obj.StageCounter, 5);
        end
    end
    
    % Private Properties Accessor Methods
    methods
        function targetTemp = getTargetTemp(obj)
            %getTargetTemp
            %   Return the currently stored value of the target temp
            targetTemp = obj.TargetTemp;
        end
        
        function startTemp = getStartTemp(obj, stageNumber)
            %getStartTemp
            %   Return the currently stored value of the start temp for a
            %   given stage number
            startTemp = obj.TemperatureControlStaging(stageNumber, 2);
        end
        
        function rampUpRate = getRampUpRate(obj, stageNumber)
            %getRampUpRate
            %   Return the currently stored value of the ramp up rate for a
            %   given stage number
            rampUpRate = obj.TemperatureControlStaging(stageNumber, 3);
        end
        
        function endTemp = getEndTemp(obj, stageNumber)
            %getEndTemp
            %   Return the currently stored value of the end temp for a
            %   given stage number
            endTemp = obj.TemperatureControlStaging(stageNumber, 4);
        end
        
        function holdTime = getHoldTime(obj, stageNumber)
            %getHoldTime
            %   Return the currently stored value of the hold time for a
            %   given stage number
            holdTime = obj.TemperatureControlStaging(stageNumber, 5);
        end
    end
    
    % Stage File Load/Save Methods
    methods
        function loadStagingFile(obj, loadPreset, varargin)
            %loadStagingFile
            %   Read the DSC temperature control staging parameters from a
            %   selected staging file and store them in the
            %   TemperatureControlStaging array
            
            switch loadPreset
                case 'default'
                    stagingFileName = obj.DEFAULT_STAGING_LOAD_PATH;
                    
                otherwise
                    % Prompt the user to select a file
                    [stagingFileName, stagingFilePath] = uigetfile('*.stage');
            end
            
            switch stagingFileName
                case 0
                    % Cancel the read operation and return an empty array
                    % if the user closes the file selection window
                    obj.TemperatureControlStaging = [];
                    
                case obj.DEFAULT_STAGING_LOAD_PATH
                    % Read the staging parameters from the default_DSC
                    % Staging.stage file
                    obj.TemperatureControlStaging = xlsread(stagingFileName);
                    
                otherwise
                    % Concatinate the file name and path name to get the
                    % full file path
                    stagingFullPath = fullfile(stagingFilePath, stagingFileName);
                    
                    % Read the values from the selected .stage file
                    obj.TemperatureControlStaging = xlsread(stagingFullPath);
            end
        end
        
        function stagingSaveStatus = saveStagingFile(obj)
            %saveStagingFile
            %   Save the temperature control staging for a DSC experiement
            %   to a .stage file
            
            % Prompt the user to select a file
            [stagingFileName, stagingFilePath] = uiputfile(...
                '*.stage', 'Save Staging File', obj.DEFAULT_STAGING_SAVE_PATH);
            
            switch stagingFileName
                case 0
                    % Cancel the save operation if the user closes the file
                    % selection window
                    stagingSaveStatus = false;
                    return
                    
                otherwise
                    % Concatinate the file name and path name to get the
                    % full file path
                    stagingFullPath = fullfile(stagingFilePath, stagingFileName);
                    
                    % Create a row cell array of column headers
                    columnHeaders = {'Stage #',...
                        'Start Temp (*C)',...
                        'Ramp Up Rate (C/min)',...
                        'End Temp (*C)',...
                        'Hold Time (sec)'};
                    
                    % Convert the StagingArray to a cell array
                    stagingCellArray = num2cell(obj.TemperatureControlStaging);
                    
                    % Join the cell arrays to add the column headers to the
                    % respective staging parameters
                    outputCellArray = [columnHeaders;...
                        stagingCellArray];
                    
                    % Write the data to the desired .stage file
                    stagingSaveStatus = xlswrite(stagingFullPath, outputCellArray);
            end
        end
    end
    
    % Staging Table Mutator Methods
    methods
        function addStage(obj, newStageNumber, newStartTemp, newRampUpRate, newEndTemp, newHoldTime)
            %addStage
            %   Add a new stage to the temperature control staging array
            
            if newStageNumber <= obj.NumberOfStages
                % Shift the rows below the new stage down by one row
                obj.TemperatureControlStaging((newStageNumber + 1):(obj.NumberOfStages + 1), 2:5)...
                    = obj.TemperatureControlStaging(newStageNumber:obj.NumberOfStages, 2:5);
                
                obj.TemperatureControlStaging((obj.NumberOfStages + 1), 1) = (obj.NumberOfStages + 1);
                
            elseif newStageNumber > obj.NumberOfStages + 1
                % Set the new stage to be below the last row
                newStageNumber = obj.NumberOfStages + 1;
                
            end
            
            [newStartTemp, newRampUpRate, newEndTemp, newHoldTime]...
                = obj.checkStageBounds(newStartTemp, newRampUpRate, newEndTemp, newHoldTime);
            
            % Insert the new stage parameters at the given stage number
            obj.TemperatureControlStaging(newStageNumber, 1) = newStageNumber;
            obj.TemperatureControlStaging(newStageNumber, 2) = newStartTemp;
            obj.TemperatureControlStaging(newStageNumber, 3) = newRampUpRate;
            obj.TemperatureControlStaging(newStageNumber, 4) = newEndTemp;
            obj.TemperatureControlStaging(newStageNumber, 5) = newHoldTime;
            
            if obj.UseAppUI
                % Refresh the values displayed in the staging table
                obj.app.refreshStagingTable();
                
            end
        end
        
        function editStage(obj, stageNumber, newStartTemp, newRampUpRate, newEndTemp, newHoldTime)
            %editStage
            %   Edit an existing stage in the temperature control staging
            %   array
            
            [newStartTemp, newRampUpRate, newEndTemp, newHoldTime]...
                = obj.checkStageBounds(newStartTemp, newRampUpRate, newEndTemp, newHoldTime);
            
            % Insert the new stage parameters at the given stage number
            obj.TemperatureControlStaging(stageNumber, 1) = stageNumber;
            obj.TemperatureControlStaging(stageNumber, 2) = newStartTemp;
            obj.TemperatureControlStaging(stageNumber, 3) = newRampUpRate;
            obj.TemperatureControlStaging(stageNumber, 4) = newEndTemp;
            obj.TemperatureControlStaging(stageNumber, 5) = newHoldTime;
            
            if obj.UseAppUI
                % Refresh the values displayed in the staging table
                obj.app.refreshStagingTable();
                
            end
        end
        
        function removeStage(obj, stageNumber)
            %removeStage
            %   Remove a stage from the temperature control staging array
            
            % Remove the row of the given stage
            obj.TemperatureControlStaging(stageNumber,:) = [];
            
            % Correct the stage numbers of the remaining rows
            for i = 1:obj.NumberOfStages
                obj.TemperatureControlStaging(i,1) = i;
            end
            
            if obj.UseAppUI
                % Refresh the values displayed in the staging table
                obj.app.refreshStagingTable;
                
            end
        end
    end
    
    % Experimental Procedure Methods
    methods
        function liveData = createLiveData(obj)
            %createLiveData
            %   Create a new DSCData object used for storing the live
            %   experiment data and return its handle
            
            % Create the DSCData object
            obj.liveData = DSCData();
            
            % Return the handle to the DSCData object
            liveData = obj.liveData;
        end
        
        function daqBox = initializeDAQBox(obj)
            %initializeDAQBox
            %   Create a new DAQBox object and return its handle
            
            % Create the DAQBox object
            obj.daqBox = DAQBox;
            
            % Return the handle to the DAQBox object
            daqBox = obj.daqBox;
        end
        
        function waitForDAQ(obj)
            %waitForDAQ
            %   Wait for the backgroud data acquisition to be stopped
            
            obj.daqBox.waitForDAQ();
        end
        
        function stopDAQ(obj)
            %stopDAQ
            %   Stop the background data aquisition
            
            obj.daqBox.stopDAQ();
        end
        
        function stopPWM(obj)
            %stopPWM
            %   Stop the PWM output to the heaters
            
            obj.daqBox.stopPWM();
        end
        
        function runExperimentStaging(obj)
            % Run the DSC experiment staging loops
            
            try
                % Set the ExperimentInProgress to true to activate the
                % appropriate UI settings
                obj.ExperimentInProgress = true;
                
                if obj.UseAppUI
                    % Refresh the UI for the new ExperimentInProgress
                    obj.app.refreshMaintenanceUI();
                    obj.app.refreshOperationUI();
                    
                end
                
                if obj.UseAppUI
                    % Attempt to import DAQBox object from app
                    try
                        obj.daqBox = obj.app.daqBox;
                    catch
                        error('Error: DAQBox object does not exist')
                    end
                else
                    % Create a DAQBox object if app UI is not being used
                    obj.initializeDAQBox();
                end
                
                % Attempt to import DSCData object from app is one does not
                % already exist
                if obj.UseAppUI
                    % Attempt to import DSCData object from app
                    try
                        obj.liveData = obj.app.liveData;
                    catch
                        try
                            % Attempt to pass this DSCData object to the app
                            obj.app.liveData = obj.createLiveData();
                        catch
                            error('Failed to pass live data to the app')
                        end
                    end
                else
                    % Create a DSCData object if app UI is not being used
                    obj.createLiveData();
                end
                
                % Attempt to pass DSCData object to the DAQBox object
                try
                    obj.daqBox.liveData = obj.liveData;
                catch
                    error('Failed to pass live data to the DAQBox object')
                end
                
                
                % Measure and record the start time of the experiment
                expStartSerialDate = obj.daqBox.getCurrentSerialDate;
                obj.liveData.ExpStartSerialDate = expStartSerialDate;
                
                % Initialize the EstimatedStageDuration to an empty array
                obj.EstimatedStageDuration = [];
                
                if obj.UseAppUI
                    % Refresh the clocks with the new values
                    obj.app.refreshOperationClock(expStartSerialDate);
                    
                end
                
                
                % Start the autosave Timer
                obj.startAutosaveTimer();
                
                
                disp('Experiment started')
                
                % Iterate through each given control staging cycle
                for stageCounter = 1:obj.NumberOfStages
                    
                    % Force the loop to end if requested by the user
                    if obj.ForceStop
                        obj.stopDAQ();
                        continue
                        
                    else
                        % Reset the ForceSkipStage controller
                        obj.ForceSkipStage = false;
                        
                        % Force the loop to skip to the next iteration if the
                        % user requested to skip the stage
                        if obj.ForceSkipStage
                            obj.stopDAQ();
                            continue
                        end
                    end
                    
                    
                    % Take an initial reading of the temperatures and power
                    [latestSerialDate, latestTemp_Ref, latestTemp_Samp,...
                        latestCurrent_Ref, latestCurrent_Samp]...
                        = obj.daqBox.getSingleScanData();
                    
                    % Initialize the TargetTemp to zero
                    obj.TargetTemp = 0;
                    
                    if obj.UseAppUI
                        % Refresh the clocks with the new values
                        obj.app.refreshOperationClock(latestSerialDate);
                        
                        % Refresh the Live Data gauges
                        obj.app.refreshOperationGauges(obj.TargetTemp,...
                            latestTemp_Ref, latestTemp_Samp,...
                            latestCurrent_Ref, latestCurrent_Samp);
                        
                    end
                    
                    
                    % Set the private StageCounter property
                    obj.StageCounter = stageCounter;
                    
                    
                    % Heat the samples to the specified start temperature
                    obj.setupSingleTarget(latestTemp_Ref, latestTemp_Samp);
                    
                    % Wait for background data acquisition to be stopped
                    obj.waitForDAQ();
                    
                    
                    % Force the loop to skip to the next iteration if the user
                    % requested to skip the stage
                    if obj.ForceSkipStage
                        obj.stopDAQ();
                        continue
                    end
                    
                    % Ramp up the temperature from the start temperature to the
                    % end temperature at the given ramp up rate
                    obj.setupRampUp();
                    
                    % Wait for background data acquisition to be stopped
                    obj.waitForDAQ();
                    
                    
                    % Force the loop to skip to the next iteration if the user
                    % requested to skip the stage
                    if obj.ForceSkipStage
                        obj.stopDAQ();
                        continue
                    end
                    
                    % Hold the samples at a constant end temperature for the
                    % duration specified by HoldTime
                    obj.setupHoldTemp
                    
                    % Wait for background data acquisition to be stopped
                    obj.waitForDAQ();
                    
                    
                    % Force the loop to skip to the next iteration if the user
                    % requested to skip the stage
                    if obj.ForceSkipStage
                        obj.stopDAQ();
                        continue
                    end
                end
                
                % Stop the background input measurement and the PWM output
                try
                    obj.stopDAQ();
                catch ME
                    warning('Failed to stop background input measurement at end of experiment')
                end
                try
                    obj.stopPWM();
                catch ME
                    warning('Failed to stop PWM output at end of experiment')
                end
                
                
                % Reset the ForceSkipStage controller
                obj.ForceSkipStage = false;
                
                if obj.ForceStop
                    msgbox('Experiment procedure has been successfully stopped')
                    obj.ForceStop = false;
                else
                    msgbox('Experiment Procedure Complete')
                end
                
                obj.ExperimentInProgress = false;
                
                % Stop the autosave timer
                obj.stopAutosaveTimer();
                
                if obj.UseAppUI
                    obj.app.DataSaveStatus = false;
                    
                    % Refresh the UI on the Operation Tab
                    obj.app.refreshOperationUI();
                    
                    % Refresh the clock
                    obj.app.refreshOperationClock();
                    
                    % Refresh the data plots on the Operation Tab
                    obj.app.refreshOperationPlots();
                    
                    % Refresh the UI on the Maintenance Tab
                    obj.app.refreshMaintenanceUI();
                    
                end
                
            catch ME
                obj.ExperimentInProgress = false;
                
                try
                    % Stop the background data acquisition
                    obj.stopDAQ();
                catch
                    warning('Could not stop background data acquisition')
                end
                
                try
                    % Stop the autosave timer
                    obj.stopAutosaveTimer();
                catch
                    warning('Could not stop autosave timer')
                end
                
                try
                    if obj.UseAppUI
                        obj.app.DataSaveStatus = false;
                        
                        % Refresh the UI on the Operation Tab
                        obj.app.refreshOperationUI();
                        
                        % Refresh the clock
                        obj.app.refreshOperationClock();
                        
                        % Refresh the data plots on the Operation Tab
                        obj.app.refreshOperationPlots();
                        
                        % Refresh the UI on the Maintenance Tab
                        obj.app.refreshMaintenanceUI();
                        
                    end
                catch
                end
                
                rethrow(ME)
                
            end
        end
        
        function forceStop(obj)
            %forceStop
            %   Force the experiment staging to stop
            warning('Force stop command received')
            
            obj.ForceSkipStage = true;
            obj.ForceStop = true;
            
            obj.stopDAQ();
            obj.stopPWM();
            
        end
        
        function forceSkipStage(obj)
            %forceSkipStage
            %   Force the experiment staging to skip the current stage
            warning('Force skip stage command received')
            
            obj.ForceSkipStage = true;
            
            obj.stopDAQ();
            
        end
        
        function calibrationDataFcn(obj, dqInput, event)
            % Calibration loop that simply refreshes the calibration tab
            % with the measurment data
            
            % Take the temperature and current readings
            [latestSerialDate, latestTemp_Ref, latestTemp_Samp,...
                latestCurrent_Ref, latestCurrent_Samp]...
                = obj.daqBox.getBackgroundData();
            
            if isempty(latestSerialDate)
                error('latestSerialDate is empty')
            elseif isempty(latestTemp_Ref)
                error('latestTemp_Ref is empty')
            elseif isempty(latestTemp_Samp)
                error('latestTemp_Samp is empty')
            elseif isempty(latestCurrent_Ref)
                error('latestCurrent_Ref is empty')
            elseif isempty(latestCurrent_Samp)
                error('latestCurrent_Samp is empty')
            end
            
            obj.app.refreshCalibrationUI(latestTemp_Ref, latestTemp_Samp,...
                latestCurrent_Ref, latestCurrent_Samp);
            
            % Force the function to end if requested by the user
            if obj.ForceStop
                obj.stopDAQ();
                return
            end
        end
        
        function singleTargetDataFcn(obj, dqInput, event)
            %singleTargetDataFcn
            %   Dynamically controls the power output in order to heat the
            %   samples until they reach the target temperature
            
            % Run the live data analysis
            obj.experimentLiveDataAnalysis();
            
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
                if obj.TargetCounter < obj.TARGET_COUNTER_THRESHOLD
                    obj.TargetCounter = obj.TargetCounter + 1;
                else
                    obj.TargetCounter = 0;
                    obj.stopDAQ();
                    obj.TargetCounter = 0;
                    return
                end
            else
                obj.TargetCounter = 0;
            end
        end
        
        function rampUpDataFcn(obj, dqInput, event)
            % Experiment {loop} that dynamically controls the power output in
            % order to make the sample temperatures equal to the target
            % temperature, while also ramping up the target temperature
            % over time at a given rate.
            
            % Run the live data analysis
            obj.experimentLiveDataAnalysis();
            
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
            
            
            % Calculate the new Target Temp
            if obj.EndTemp > obj.StartTemp
                if obj.TargetTemp < obj.EndTemp
                    obj.TargetTemp = obj.StartTemp...
                        + (obj.RampUpRate / 60)...
                        * date2sec(obj.liveData.LatestSerialDate...
                        - obj.liveData.LatestStageSerialDate);
                else
                    obj.TargetTemp = obj.EndTemp;
                end
                
            elseif obj.EndTemp < obj.StartTemp
                if obj.TargetTemp > obj.EndTemp
                    obj.TargetTemp = obj.StartTemp...
                        + (obj.RampUpRate / 60)...
                        * date2sec(obj.liveData.LatestSerialDate...
                        - obj.liveData.LatestStageSerialDate);
                else
                    obj.TargetTemp = obj.EndTemp;
                end
            end
            
            % Compare the sample temperatures to the end temperature
            if (obj.TargetTemp == obj.EndTemp)...
                    && (abs(obj.liveData.LatestTempError_Ref) < obj.MINIMUM_ACCEPTABLE_ERROR) ...
                    && (abs(obj.liveData.LatestTempError_Samp) < obj.MINIMUM_ACCEPTABLE_ERROR)
                if obj.TargetCounter < obj.TARGET_COUNTER_THRESHOLD
                    obj.TargetCounter = obj.TargetCounter + 1;
                else
                    obj.TargetCounter = 0;
                    obj.stopDAQ();
                    obj.TargetCounter = 0;
                    return
                end
            else
                obj.TargetCounter = 0;
            end
        end
        
        function holdTempDataFcn(obj, dqInput, event)
            % Experiment loop that dynamically controls the power output in
            % order to make the hold the sample temperatures at the target
            % temperature over the duration of the given hold time
            
            % Run the live data analysis
            obj.experimentLiveDataAnalysis();
            
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
            
            
            elapsedStageTime...
                = date2sec(obj.liveData.LatestSerialDate...
                - obj.liveData.LatestStageSerialDate);
            
            if elapsedStageTime > obj.HoldTime
                obj.stopDAQ();
                return
            end
        end
        
        function experimentLiveDataAnalysis(obj)
            %experimentLiveDataAnalysis
            
            % Store the latest Target Temp in the DSCData object
            obj.liveData.LatestTargetTemp = obj.TargetTemp;
            
            % TODO DEBUG ================
            %debug_latestSerialDate = datenum(datetime);
            % TODO DEBUG ================
            
            % Take the temperature and current readings
            [latestSerialDate, latestTemp_Ref, latestTemp_Samp,...
                latestCurrent_Ref, latestCurrent_Samp]...
                = obj.daqBox.getBackgroundData();
            
            if isempty(latestSerialDate)
                error('latestSerialDate is empty')
            elseif isempty(latestTemp_Ref)
                error('latestTemp_Ref is empty')
            elseif isempty(latestTemp_Samp)
                error('latestTemp_Samp is empty')
            elseif isempty(latestCurrent_Ref)
                error('latestCurrent_Ref is empty')
            elseif isempty(latestCurrent_Samp)
                error('latestCurrent_Samp is empty')
            end
            
            % TODO DEBUG ================
            %home
            %fprintf("============ DEBUG ============\n")
            %fprintf("---- Serial date format -------\n")
            %fprintf("DAQBox: %10.10f\n", latestSerialDate)
            %fprintf("MATLAB: %10.10f\n", debug_latestSerialDate)
            %fprintf("Diff:   %10.10f\n", latestSerialDate - debug_latestSerialDate)
            %fprintf("Diff in sec: %f\n", date2sec(abs(latestSerialDate - debug_latestSerialDate)))
            %formatOut = 'yyyy-mm-dd HH:MM:SS.FFF';
            %fprintf("---- Date String format -------\n")
            %fprintf("DAQBox: %s\n", datestr(latestSerialDate, formatOut))
            %fprintf("MATLAB: %s\n", datestr(debug_latestSerialDate, formatOut))
            %fprintf("\n")
            % TODO DEBUG ================
            
            % Store the current elapsed time value in the DSCData object
            obj.liveData.LatestSerialDate = latestSerialDate;
            
            % Store the latest temperature readings in the DSCData object
            obj.liveData.LatestTemp_Ref = latestTemp_Ref;
            obj.liveData.LatestTemp_Samp = latestTemp_Samp;
            
            
            % Calculate the difference between latestTemp and TargetTemp
            latestTempError_Ref = latestTemp_Ref - obj.TargetTemp;
            latestTempError_Samp = latestTemp_Samp - obj.TargetTemp;
            
            % Store the latest current error values in the DSCData object
            obj.liveData.LatestTempError_Ref = latestTempError_Ref;
            obj.liveData.LatestTempError_Samp = latestTempError_Samp;
            
            
            % Store the latest current readings in the DSCData object
            obj.liveData.LatestCurrent_Ref = latestCurrent_Ref;
            obj.liveData.LatestCurrent_Samp = latestCurrent_Samp;
            
            
            % Run the PID controller algorithm
            [newDutyCycle_Ref, newDutyCycle_Samp]...
                = obj.daqBox.runPIDAlgorithm(obj.liveData);
            
            % Store the latest PWM duty cycle values in the DSCData object
            obj.liveData.LatestPWMDutyCycle_Ref = newDutyCycle_Ref;
            obj.liveData.LatestPWMDutyCycle_Samp = newDutyCycle_Samp;
            
            
            % Have the DSCData object calculate and store the heat flow
            % rate
            obj.liveData.calculateLatestHeatFlow(...
                obj.daqBox.HEATING_COIL_VOLTAGE);
            
            if obj.UseAppUI
                obj.app.refreshOperationGauges(obj.TargetTemp,...
                    latestTemp_Ref, latestTemp_Samp,...
                    latestCurrent_Ref, latestCurrent_Samp);
                
            end
            
            
            if obj.UseAppUI
                % Refresh the clocks with the new values
                obj.app.refreshOperationClock(latestSerialDate);
                
                if obj.RefreshCounter < obj.REFRESH_COUNTER_THRESHOLD
                    obj.RefreshCounter = obj.RefreshCounter + 1;
                else
                    % Refresh the data plots
                    obj.app.refreshOperationPlots();
                    obj.RefreshCounter = 0;
                end
            end
        end
    end
    
    methods (Access = private)
        function [startTemp, rampUpRate, endTemp, holdTime]...
                = checkStageBounds(obj, startTemp, rampUpRate, endTemp, holdTime)
            %checkStageBounds
            %   Check the stage parameters and correct invalid values
            
            % Check that the start temp does not exceed the max temperature limit
            if startTemp > obj.MaxTempLimit
                startTemp = obj.MaxTempLimit;
                warndlg(sprintf(['The Start Temp has been set equal to the Max Temp Limit of %g *C to avoid potential equipment damages.\n'...
                    'In order to allow temperatures higher than %g *C, please edit the Max Temp Limit value from the Maintenance Tab.'],...
                    obj.MaxTempLimit, obj.MaxTempLimit))
                
            end
            
            % Check that the end temp does not exceed the max temperature limit
            if endTemp > obj.MaxTempLimit
                endTemp = obj.MaxTempLimit;
                warndlg(sprintf(['The End Temp has been set equal to the Max Temp Limit of %g *C to avoid potential equipment damages.\n'...
                    'In order to allow temperatures higher than %g *C, please edit the Max Temp Limit value from the Maintenance Tab.'],...
                    obj.MaxTempLimit, obj.MaxTempLimit))
                
            end
            
            % Check whether the ramp up rate agrees with the start temp and end temp
            if startTemp == endTemp
                rampUpRate = 0;
                msgbox({'the Ramp Up Rate has been set to 0 C/min';...
                    'because the End Temp is equal to the Start Temp'})
                
            elseif endTemp > startTemp
                if rampUpRate == 0
                    rampUpRate = 1;
                    msgbox({'the Ramp Up Rate has been set to 1 C/min because it cannot be 0 C/min';...
                        'if the End Temp is greater than the Start Temp'})
                    
                elseif rampUpRate < 0
                    rampUpRate = -rampUpRate;
                    msgbox({'the Ramp Up Rate has been made positive';...
                        'because the End Temp is greater than the Start Temp'})
                end
                
            elseif endTemp < startTemp
                if rampUpRate == 0
                    rampUpRate = -1;
                    msgbox({'the Ramp Up Rate has been set to -1 C/min because it cannot be 0 C/min';...
                        'if the End Temp is less than the Start Temp'})
                    
                elseif rampUpRate > 0
                    rampUpRate = -rampUpRate;
                    msgbox({'the Ramp Up Rate has been made negative';...
                        'because the End Temp is less than the Start Temp'})
                    
                end
                
            end
            
            % Check whether the hold time is a positive value
            if holdTime < 0
                holdTime = 0;
                msgbox('the Hold Time has been made zero because it was negative')
                
            end
        end
        
        function setupSingleTarget(obj, latestTemp_Ref, latestTemp_Samp)
            %setupSingleTarget
            %   Initialize the appropriate variables for single target heating
            %   then start the heating
            
            if (obj.StartTemp > latestTemp_Ref) || (obj.StartTemp > latestTemp_Samp)
                % Heat the samples until they reach the Start temp if
                % the Start Temp is great than the Current Temp
                
                if obj.UseAppUI
                    % Refresh the staging info displayed on the UI
                    obj.app.refreshStagingInfo(obj.StageCounter, 'Heating to Start Temp');
                end
                
            else
                % Allow the samples to cool if the Start Temp is less
                % than the Current Temp
                
                if obj.UseAppUI
                    % Refresh the staging info displayed on the UI
                    obj.app.refreshStagingInfo(obj.StageCounter, 'Cooling to Start Temp');
                end
                
            end
            
            % Clear the estimated duration for the current stage
            obj.EstimatedStageDuration  = [];
            
            % Set the target temp to the start temp
            obj.TargetTemp = obj.StartTemp;
            
            % Measure the start time of the current stage
            latestStageSerialDate = obj.daqBox.getCurrentSerialDate();
            
            % Record the latest stage serial date
            obj.liveData.LatestStageSerialDate = latestStageSerialDate;
            
            % Start single target heating
            obj.daqBox.startHeating(obj, 'singleTarget');
            
        end
        
        function setupRampUp(obj)
            %setupRampUp
            %   Initialize the appropriate variables for ramp up heating
            %   then start the heating
            
            if obj.EndTemp == obj.StartTemp
                % Proceed to the holdTemp function if the End Temp is
                % equal to the Start Temp
                
                % i.e. Do nothing
            else
                if obj.RampUpRate == 0
                    if obj.EndTemp > obj.StartTemp
                        displayInfo = 'Heating to End Temp';
                    else
                        displayInfo = 'Cooling to End Temp';
                    end
                    
                    % Set the target temp to the end temp
                    obj.TargetTemp = obj.EndTemp;
                    
                else
                    % Estimate the total duration for the current stage
                    obj.EstimatedStageDuration...
                        = obj.HoldTime...
                        + (abs(obj.EndTemp - obj.StartTemp)...
                        / (abs(obj.RampUpRate) / 60));
                    
                    if obj.EndTemp > obj.StartTemp
                        displayInfo = 'Ramping up the End Temp';
                    else
                        displayInfo = 'Ramping down to End Temp';
                    end
                    
                    % Initialize the TargetTemp to zero
                    obj.TargetTemp = 0;
                end
                
                if obj.UseAppUI
                    % Refresh the staging info displayed on the UI
                    obj.app.refreshStagingInfo(obj.StageCounter, displayInfo);
                end
                
                % Measure the start time of the current stage
                latestStageSerialDate = obj.daqBox.getCurrentSerialDate();
                
                % Record the latest stage serial date
                obj.liveData.LatestStageSerialDate = latestStageSerialDate;
                
                if obj.RampUpRate == 0
                    % Start single target heating
                    obj.daqBox.startHeating(obj, 'singleTarget');
                else
                    % Start ramp up heating
                    obj.daqBox.startHeating(obj, 'rampUp');
                end
            end
        end
        
        function setupHoldTemp(obj)
            %setupHoldTemp
            %   Initialize the appropriate variables for holding the samples at
            %   the end temperature for a given amount of time,
            %   then start the heating
            
            % Run the Hold Temp Loop if there is a specified HoldTime
            % value
            if obj.HoldTime > 0
                % Run the Hold Temp loop if a valid HoldTime value is
                % given
                
                % Estimate the total duration for the current stage
                obj.EstimatedStageDuration  = obj.HoldTime;
                
                if obj.UseAppUI
                    % Refresh the staging info displayed on the UI
                    obj.app.refreshStagingInfo(obj.StageCounter, 'Holding at End Temp');
                    
                end
                
                % Set the target temp to the start temp
                obj.TargetTemp = obj.EndTemp;
                
                % Measure the start time of the current stage
                latestStageSerialDate = obj.daqBox.getCurrentSerialDate();
                
                % Record the latest stage serial date
                obj.liveData.LatestStageSerialDate = latestStageSerialDate;
                
                % Start single target heating
                obj.daqBox.startHeating(obj, 'holdTemp');
                
            end
        end
        
        function startAutosaveTimer(obj)
            %startAutosaveTimer
            %   TODO: Put description here
            
            % Create a new timer object for performing the autosave
            obj.AutosaveTimer = timer(...
                'ExecutionMode', obj.AutosaveTimerExecutionMode, ...
                'Period', obj.AutosavePeriod, ...
                'TimerFcn', @obj.performAutosave);
            
            if ~exist('./autosave', 'dir')
                mkdir('./autosave')
            end
            
            pause(0.1);
            
            % Start the timer object
            start(obj.AutosaveTimer)
            
        end
        
        function stopAutosaveTimer(obj)
            %stopAutosaveTimer
            %   TODO: Put description here
            
            % Stop the trigger timer object
            for i=1:10 % Retry up to 10 times if timer fails to stop
                try
                    stop(obj.AutosaveTimer)
                    delete(obj.AutosaveTimer)
                    break
                catch ME
                    if isvalid(obj.AutosaveTimer)
                        if isequal(obj.AutosaveTimer.Running, 'on')
                            rethrow(ME)
                        end
                    end
                end
            end
        end
        
        function performAutosave(obj, src, event)
            %performAutosave
            %   Save a backup of the app, daqBox, and liveData objects as a
            %   .mat file
            
            % Try to autosave the DAQBox object
            try
                % Assign the current DAQBox object to a temporary variable
                %daqBox = obj.daqBox;
                % Save the temporary variable to a .mat file
                %save('./autosave/autosave_daqBox.mat', 'daqBox')
                
            catch ME
                % If an autosave error occurs while an experiment is running,
                % rethrow the error
                if obj.ExperimentInProgress
                    rethrow(ME)
                end
            end
            
            % Try to autosave the DSCData object
            try
                % Assign the current DSCData object to a temporary variable
                liveData = obj.liveData;
                
                % Save the temporary variable to a .mat file
                save('./autosave/autosave_liveData.mat', 'liveData')
                
            catch ME
                % If an autosave error occurs while an experiment is running,
                % rethrow the error
                if obj.ExperimentInProgress
                    rethrow(ME)
                end
            end
        end
        
        function delete(obj)
            %Object Destructor Method
            % This is run automatically when an object of this class is deleted
            
            % Attempt to stop the experiment if it is running
            if obj.ExperimentInProgress
                obj.forceStop();
            end
            
            try
                % Stop the autosave timer
                obj.stopAutosaveTimer();
            catch
                warning('Failed to stop autosave timer before StageController object was deleted.')
            end
            
            % Attempt to perform an autosave before deleting the object
            try
                obj.performAutosave([],[]);
            catch
                warning('Failed to save before StageController object was deleted.')
            end
        end
    end
end
