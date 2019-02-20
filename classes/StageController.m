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

        % An object of the DSC_GUI_APP class or the DSC_CUI_APP class which
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
        AutosavePeriod = 60

        StartTemp
        RampUpRate
        EndTemp
        HoldTime

        TargetTemp

    end

    properties (Dependent)
        NumberOfStages
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
        MINIMUM_ACCEPTABLE_ERROR = 2
    end

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

        function startTemp = getStartTemp(obj)
            %getStartTemp
            %   Return the currently stored value of the start temp
            startTemp = obj.StartTemp;
        end

        function rampUpRate = getRampUpRate(obj)
            %getRampUpRate
            %   Return the currently stored value of the ramp up rate
            rampUpRate = obj.RampUpRate;
        end

        function endTemp = getEndTemp(obj)
            %getEndTemp
            %   Return the currently stored value of the end temp
            endTemp = obj.EndTemp;
        end

        function holdTime = getHoldTime(obj)
            %getHoldTime
            %   Return the currently stored value of the hold time
            holdTime = obj.HoldTime;
        end

        function targetTemp = getTargetTemp(obj)
            %getTargetTemp
            %   Return the currently stored value of the target temp
            targetTemp = obj.TargetTemp;
        end

        function numberOfStages = get.NumberOfStages(obj)
            %get.NumberOfStages
            %   Return the number of stages listed in the
            %   TemperatureControlStaging array
            numberOfStages = size(obj.TemperatureControlStaging, 1);
        end

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

        function addStage(obj, newStageNumber, newStartTemp, newRampUpRate, newEndTemp, newHoldTime)
            %addStage
            %   Add a new stage to the temperature control staging array

            if newStageNumber <= obj.NumberOfStages
                % Shift the rows below the new stage down by one row
                obj.TemperatureControlStaging((newStageNumber + 1):(obj.NumberOfStages + 1), 2:5)...
                    = obj.TemperatureControlStaging(newStageNumber:obj.NumberOfStages, 2:5);

                obj.TemperatureControlStaging((obj.NumberOfStages + 1), 1) = (obj.NumberOfStages + 1);

            end

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

        function liveData = createLiveData(obj)
            %createLiveData
            %   Create a new DSCData object used for storing the live
            %   experiment data and return its handle

            % Create the DSCData object
            obj.liveData = DSCData();

            % Return the handle to the DSCData object
            liveData = obj.liveData;
        end

        function daqBox = startDAQBox(obj)
            %startDAQBox
            %   Create a new DAQBox object and return its handle

            % Create the DAQBox object
            obj.daqBox = DAQBox;

            % Return the handle to the DAQBox object
            daqBox = obj.daqBox;
        end

        function waitForTrigger(obj)
            %waitForTrigger
            %   Wait for the trigger to be stopped

            obj.daqBox.waitForTrigger();
        end

        function stopTrigger(obj)
            %stopTrigger
            %   Stop the trigger

            obj.daqBox.stopTrigger();
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
                    obj.startDAQBox();
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


                % Measure and record the start time of the experiment
                obj.liveData.ExpStartSerialDate...
                    = obj.daqBox.getCurrentSerialDate;

                % Initialize the EstimatedStageDuration to an empty array
                obj.EstimatedStageDuration = [];

                if obj.UseAppUI
                    % Refresh the clocks with the new values
                    obj.app.refreshOperationClock();

                end


                % Start the autosave Timer
                obj.startAutosaveTimer();


                % Iterate through each given control staging cycle
                for stageCounter = 1:obj.NumberOfStages

                    % Force the loop to end if requested by the user
                    if obj.ForceStop
                        obj.stopTrigger();
                        continue

                    else
                        % Reset the ForceSkipStage controller
                        obj.ForceSkipStage = false;

                        % Force the loop to skip to the next iteration if the
                        % user requested to skip the stage
                        if obj.ForceSkipStage
                            obj.stopTrigger();
                            continue
                        end
                    end


                    % Take an initial reading of the temperatures and power
                    [latestSerialDate, latestTemp_Ref, latestTemp_Samp,...
                        latestCurrent_Ref, latestCurrent_Samp]...
                        = obj.daqBox.takeMeasurement();

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


                    % Read and store the temperature control parameters for the
                    % current stage
                    obj.StartTemp = obj.TemperatureControlStaging(stageCounter, 2);
                    obj.RampUpRate = obj.TemperatureControlStaging(stageCounter, 3);
                    obj.EndTemp = obj.TemperatureControlStaging(stageCounter, 4);
                    obj.HoldTime = obj.TemperatureControlStaging(stageCounter, 5);


                    if obj.StartTemp > latestTemp_Ref || obj.StartTemp > latestTemp_Samp
                        % Heat the samples until they reach the Start temp if
                        % the Start Temp is great than the Current Temp

                        if obj.UseAppUI
                            % Refresh the staging info displayed on the UI
                            obj.app.refreshStagingInfo(stageCounter, 'Heating to Start Temp');
                        end

                    else
                        % Allow the samples to cool if the Start Temp is less
                        % than the Current Temp

                        if obj.UseAppUI
                            % Refresh the staging info displayed on the UI
                            obj.app.refreshStagingInfo(stageCounter, 'Cooling to Start Temp');
                        end

                    end

                    % Set the target temp to the start temp
                    obj.TargetTemp = obj.StartTemp;

                    % Measure the start time of the current stage
                    latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

                    % Record the latest stage serial date
                    obj.liveData.LatestStageSerialDate = latestStageSerialDate;

                    % Start single target heating
                    obj.daqBox.startSingleTargetHeating(obj)

                    % Wait for trigger to be stopped
                    obj.waitForTrigger();


                    % Force the loop to skip to the next iteration if the user
                    % requested to skip the stage
                    if obj.ForceSkipStage
                        obj.stopTrigger();
                        continue
                    end

                    if obj.UseAppUI
                        % Refresh the clocks with the new values
                        obj.app.refreshOperationClock();
                    end


                    if obj.EndTemp > obj.StartTemp
                        if obj.RampUpRate > 0
                            % Run the Ramp Up loop if the End Temp is greater
                            % than the Start Temp and the Ramp Up Rate is a
                            % positive, non-zero value

                            % Estimate the total duration for the current stage
                            obj.EstimatedStageDuration...
                                = obj.HoldTime...
                                + ((obj.EndTemp - obj.StartTemp)...
                                / (obj.RampUpRate / 60));

                            if obj.UseAppUI
                                % Refresh the staging info displayed on the UI
                                obj.app.refreshStagingInfo(stageCounter, 'Ramping up to End Temp');

                            end

                            % Initialize the TargetTemp to zero
                            obj.TargetTemp = 0;

                            % Measure the start time of the current stage
                            latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

                            % Record the latest stage serial date
                            obj.liveData.LatestStageSerialDate = latestStageSerialDate;

                            % Start ramp up heating
                            obj.daqBox.startRampUpHeating(obj)

                        else
                            % Heat the samples until they reach the End Temp if
                            % the End Temp is greater than the Start Temp and
                            % the Ramp Up Rate is a negative or zero value

                            if obj.UseAppUI
                                % Refresh the staging info displayed on the UI
                                obj.app.refreshStagingInfo(stageCounter, 'Heating to End Temp');

                            end

                            % Set the target temp to the start temp
                            obj.TargetTemp = obj.EndTemp;

                            % Measure the start time of the current stage
                            latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

                            % Record the latest stage serial date
                            obj.liveData.LatestStageSerialDate = latestStageSerialDate;

                            % Start single target heating
                            obj.daqBox.startRampUpHeating(obj)

                        end

                    elseif obj.EndTemp < obj.StartTemp
                        if obj.RampUpRate < 0
                            % Run the Ramp Up loop if the End Temp is less than
                            % the Start Temp and the Ramp Up Rate is a
                            % negative, non-zero value

                            % Estimate the total duration for the current stage
                            obj.EstimatedStageDuration...
                                = obj.HoldTime...
                                + ((obj.StartTemp - obj.EndTemp)...
                                / (-obj.RampUpRate / 60));

                            if obj.UseAppUI
                                % Refresh the staging info displayed on the UI
                                obj.app.refreshStagingInfo(stageCounter, 'Ramping down to End Temp');

                            end

                            % Initialize the TargetTemp to zero
                            obj.TargetTemp = 0;

                            % Measure the start time of the current stage
                            latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

                            % Record the latest stage serial date
                            obj.liveData.LatestStageSerialDate = latestStageSerialDate;

                            % Start ramp up heating
                            obj.daqBox.startRampUpHeating(obj)

                        else
                            % Allow the samples to cool if the End Temp is less
                            % than the Start Temp and the Ramp Up Rate is a
                            % positive or zero value

                            if obj.UseAppUI
                                % Refresh the staging info displayed on the UI
                                obj.app.refreshStagingInfo(stageCounter, 'Cooling to End Temp');

                            end

                            % Set the target temp to the start temp
                            obj.TargetTemp = obj.StartTemp;

                            % Measure the start time of the current stage
                            latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

                            % Record the latest stage serial date
                            obj.liveData.LatestStageSerialDate = latestStageSerialDate;

                            % Start single target heating
                            obj.daqBox.startSingleTargetHeating(obj)

                        end

                    else
                        % Proceed to the holdTemp function if the End Temp is
                        % equal to the Start Temp

                    end

                    % Wait for trigger to be stopped
                    obj.waitForTrigger();


                    % Force the loop to skip to the next iteration if the user
                    % requested to skip the stage
                    if obj.ForceSkipStage
                        obj.stopTrigger();
                        continue
                    end



                    if obj.UseAppUI
                        % Refresh the clocks with the new values
                        obj.app.refreshOperationClock();

                    end


                    % Run the Hold Temp Loop if there is a specified HoldTime
                    % value
                    if obj.HoldTime > 0
                        % Run the Hold Temp loop if a valid HoldTime value is
                        % given

                        % Estimate the total duration for the current stage
                        obj.EstimatedStageDuration  = obj.HoldTime;

                        if obj.UseAppUI
                            % Refresh the staging info displayed on the UI
                            obj.app.refreshStagingInfo(stageCounter, 'Holding at End Temp');

                        end

                        % Set the target temp to the start temp
                        obj.TargetTemp = obj.EndTemp;

                        % Measure the start time of the current stage
                        latestStageSerialDate = obj.daqBox.getCurrentSerialDate();

                        % Record the latest stage serial date
                        obj.liveData.LatestStageSerialDate = latestStageSerialDate;

                        % Start single target heating
                        obj.daqBox.startHoldTempHeating(obj)

                    end

                    % Wait for trigger to be stopped
                    obj.waitForTrigger();


                    % Force the loop to skip to the next iteration if the user
                    % requested to skip the stage
                    if obj.ForceSkipStage
                        obj.stopTrigger();
                        continue
                    end

                    if obj.UseAppUI
                        % Refresh the clocks with the new values
                        obj.app.refreshOperationClock();

                    end
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
                    % Stop the DAQ Box trigger
                    obj.stopTrigger();
                catch
                    warning('Could not stop trigger')
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

            obj.ForceSkipStage = true;
            obj.ForceStop = true;

            obj.stopTrigger();

        end

        function forceSkipStage(obj)
            %forceSkipStage
            %   Force the experiment staging to skip the current stage
            warning('Force skip stage attempted')

            obj.ForceSkipStage = true;

            obj.stopTrigger();

        end

        function singleTargetHeating(obj, varargin)
            %singleTargetHeating
            %   Dynamically controls the power output in order to heat the
            %   samples until they reach the target temperature

            % Force the function to end if requested by the user
            if obj.ForceStop
                disp('Force stop attempted')
                obj.stopTrigger();
                return
            end

            % Force the function to end if the user requested to skip the
            % stage
            if obj.ForceSkipStage
                obj.stopTrigger();
                return
            end

            % Run the live data analysis
            obj.experimentLiveDataAnalysis();

            % Refresh the display
            drawnow limitrate nocallbacks

            % Compare the sample temperatures to the target temperature
            if (abs(obj.liveData.LatestTempError_Ref) < obj.MINIMUM_ACCEPTABLE_ERROR)...
                    && (abs(obj.liveData.LatestTempError_Samp) < obj.MINIMUM_ACCEPTABLE_ERROR)
                obj.stopTrigger();
                return
            end
        end

        function rampUpHeating(obj, varargin)
            % Experiment loop that dynamically controls the power output in
            % order to make the sample temperatures equal to the target
            % temperature, while also ramping up the target temperature
            % over time at a given rate.

            % Force the function to end if requested by the user
            if obj.ForceStop
                obj.stopTrigger();
                return
            end

            % Force the function to end if the user requested to skip the
            % stage
            if obj.ForceSkipStage
                obj.stopTrigger();
                return
            end


            % Calculate the new Target Temp
            if obj.EndTemp > obj.StartTemp
                if obj.TargetTemp < obj.EndTemp
                    obj.TargetTemp = obj.StartTemp...
                        + (obj.RampUpRate / 60)...
                        * date2sec(obj.daqBox.getCurrentSerialDate()...
                        - obj.liveData.LatestStageSerialDate);
                else
                    obj.TargetTemp = obj.EndTemp;
                end

            elseif obj.EndTemp < obj.StartTemp
                if obj.TargetTemp > obj.EndTemp
                    obj.TargetTemp = obj.StartTemp...
                        + (obj.RampUpRate / 60)...
                        * date2sec(obj.daqBox.getCurrentSerialDate()...
                        - obj.liveData.LatestStageSerialDate);
                else
                    obj.TargetTemp = obj.EndTemp;
                end
            end

            % Run the live data analysis
            obj.experimentLiveDataAnalysis();

            % Refresh the display
            drawnow limitrate nocallbacks

            % Compare the sample temperatures to the end temperature
            if (obj.TargetTemp == obj.EndTemp)...
                    && (abs(obj.liveData.LatestTempError_Ref) < obj.MINIMUM_ACCEPTABLE_ERROR) ...
                    && (abs(obj.liveData.LatestTempError_Samp) < obj.MINIMUM_ACCEPTABLE_ERROR)
                obj.stopTrigger();
                return
            end
        end

        function holdTempHeating(obj, varargin)
            % Experiment loop that dynamically controls the power output in
            % order to make the hold the sample temperatures at the target
            % temperature over the duration of the given hold time

            % Force the function to end if requested by the user
            if obj.ForceStop
                obj.stopTrigger();
                return
            end

            % Force the function to end if the user requested to skip the
            % stage
            if obj.ForceSkipStage
                obj.stopTrigger();
                return
            end

            % Run the live data analysis
            obj.experimentLiveDataAnalysis();

            % Refresh the display
            drawnow limitrate nocallbacks

            elapsedStageTime...
                = date2sec(obj.daqBox.getCurrentSerialDate()...
                - obj.liveData.LatestStageSerialDate);

            if elapsedStageTime > obj.HoldTime
                obj.stopTrigger();
                return
            end
        end

        function experimentLiveDataAnalysis(obj)
            %experimentLiveDataAnalysis

            if obj.UseAppUI
                % Refresh the clocks with the new values
                obj.app.refreshOperationClock();

            end
            disp('TargetTemp:')
            disp(obj.TargetTemp)


            % Store the latest Target Temp in the DSCData object
            obj.liveData.LatestTargetTemp = obj.TargetTemp;


            % Take the temperature and current readings
            [latestSerialDate, latestTemp_Ref, latestTemp_Samp,...
                latestCurrent_Ref, latestCurrent_Samp]...
                = obj.daqBox.takeMeasurement();

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


            % Have the DSCData object calculate and store the heat flow
            % rate
            obj.liveData.calculateLatestHeatFlow(obj.daqBox.HEATING_COIL_VOLTAGE);

            if obj.UseAppUI
                obj.app.refreshOperationGauges(obj.TargetTemp,...
                    latestTemp_Ref, latestTemp_Samp,...
                    latestCurrent_Ref, latestCurrent_Samp);

            end


            % Run the PID controller algorithm
            [newDutyCycle_Ref, newDutyCycle_Samp]...
                = obj.daqBox.runPIDAlgorithm(obj.liveData);

            % Store the latest PWM duty cycle values in the DSCData object
            obj.liveData.LatestPWMDutyCycle_Ref = newDutyCycle_Ref;
            obj.liveData.LatestPWMDutyCycle_Samp = newDutyCycle_Samp;


            % Refresh the PWM duty cycle values of pulse generators using
            % the newly calculated values
            obj.daqBox.updatePWMDutyCycle(newDutyCycle_Ref, newDutyCycle_Samp);


            if obj.UseAppUI
                % Refresh the clocks with the new values
                obj.app.refreshOperationClock();

                % Refresh the data plots
                obj.app.refreshOperationPlots();
            end
        end
    end

    methods (Access = private)
        function startAutosaveTimer(obj)
            %startAutosaveTimer
            %   Put description here

            % Create a new timer object for performing the autosave
            obj.AutosaveTimer = timer(...
                'ExecutionMode', obj.AutosaveTimerExecutionMode, ...
                'Period', obj.AutosavePeriod, ...
                'TimerFcn', {@autosaveTimerFcn, obj});

            % Start the timer object
            start(obj.AutosaveTimer)

        end

        function stopAutosaveTimer(obj)
            %stopAutosaveTimer
            %   Put description here

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

        function performAutosave(obj)
            %performAutosave
            %   Save a backup of the app, daqBox, and liveData objects as a
            %   .mat file
            
            % Try to autosave the DAQBox object
            try
                % Assign the current DAQBox object to a temporary variable
                daqBox = obj.daqBox;
                % Save the temporary variable to a .mat file
                save('./autosave/autosave_daqBox.mat', 'daqBox')

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
                obj.performAutosave();
            catch
                warning('Failed to save before StageController object was deleted.')
            end
        end
    end
end

%--------------------------------------------------------------------------
% The following functions are the TimerFcn callback functions for the
% autosave timer object, which is used automatically save backups of the
% app, daqBox, and liveData objects at regular invertervals

function autosaveTimerFcn(~, ~, stageController)
%autosaveTimerFcn
%   The TimerFcn callback for performing an autosave
stageController.performAutosave();
end
