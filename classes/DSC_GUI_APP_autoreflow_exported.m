classdef DSC_GUI_APP_autoreflow_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        GridLayout                      matlab.ui.container.GridLayout
        LeftPanel                       matlab.ui.container.Panel
        GridLayout2                     matlab.ui.container.GridLayout
        ClearDataButton                 matlab.ui.control.Button
        SaveDataToFileButton            matlab.ui.control.Button
        StartExperimentButton           matlab.ui.control.Button
        StopExperimentButton            matlab.ui.control.Button
        InitializeDAQBoxButton          matlab.ui.control.Button
        SkipCurrentStageButton          matlab.ui.control.Button
        ReferenceSampleLiveDataPanel    matlab.ui.container.Panel
        GridLayout22                    matlab.ui.container.GridLayout
        ReferenceCurrentEditField       matlab.ui.control.NumericEditField
        ReferenceTemperatureEditField   matlab.ui.control.NumericEditField
        ReferenceCurrentGaugeLabel      matlab.ui.control.Label
        ReferenceTemperatureGaugeLabel  matlab.ui.control.Label
        TestSampleLiveDataPanel         matlab.ui.container.Panel
        GridLayout23                    matlab.ui.container.GridLayout
        TestSampleCurrentEditField      matlab.ui.control.NumericEditField
        TestSampleTemperatureEditField  matlab.ui.control.NumericEditField
        TestSampleCurrentGaugeLabel     matlab.ui.control.Label
        TestSampleTemperatureGaugeLabel  matlab.ui.control.Label
        TargetTemperatureLiveDataPanel  matlab.ui.container.Panel
        GridLayout24                    matlab.ui.container.GridLayout
        TargetTemperatureEditField      matlab.ui.control.NumericEditField
        TargetTemperatureGaugeLabel     matlab.ui.control.Label
        CurrentStageClocksPanel         matlab.ui.container.Panel
        GridLayout20                    matlab.ui.container.GridLayout
        ElapsedTimeStage0Label          matlab.ui.control.Label
        CurrentStage_ElapsedTimeEditField  matlab.ui.control.EditField
        EstimatedTimeRemainingLabel     matlab.ui.control.Label
        CurrentStage_EstimatedTimeRemainingEditField  matlab.ui.control.EditField
        ExperimentClockPanel            matlab.ui.container.Panel
        GridLayout21                    matlab.ui.container.GridLayout
        TotalTimeLabel                  matlab.ui.control.Label
        ElapsedTimeEditField            matlab.ui.control.EditField
        ReferenceSamplePropertiesPanel  matlab.ui.container.Panel
        ReferenceSampleMassgramsSpinnerLabel  matlab.ui.control.Label
        ReferenceSampleMassgramsSpinner  matlab.ui.control.Spinner
        ReferenceSpecificHeatJgKSpinner_2Label  matlab.ui.control.Label
        ReferenceSpecificHeatJgKSpinner  matlab.ui.control.Spinner
        ReferenceSampleMaterialEditFieldLabel  matlab.ui.control.Label
        ReferenceSampleMaterialEditField  matlab.ui.control.EditField
        TestSamplePropertiesPanel       matlab.ui.container.Panel
        TestSampleMassgramsSpinnerLabel  matlab.ui.control.Label
        TestSampleMassgramsSpinner      matlab.ui.control.Spinner
        TestSampleMaterialEditFieldLabel  matlab.ui.control.Label
        TestSampleMaterialEditField     matlab.ui.control.EditField
        RightPanel                      matlab.ui.container.Panel
        GridLayout18                    matlab.ui.container.GridLayout
        TabGroup                        matlab.ui.container.TabGroup
        OperationTab                    matlab.ui.container.Tab
        GridLayout3                     matlab.ui.container.GridLayout
        UIAxesSamples                   matlab.ui.control.UIAxes
        UIAxesDifferential              matlab.ui.control.UIAxes
        ExperimentStagingConfigurationPanel  matlab.ui.container.Panel
        GridLayout13                    matlab.ui.container.GridLayout
        AddaStageButton                 matlab.ui.control.Button
        EditaStageButton                matlab.ui.control.Button
        TempControlStagingUITable       matlab.ui.control.Table
        RemoveaStageButton              matlab.ui.control.Button
        CurrentStageLabel               matlab.ui.control.Label
        CurrentStageEditField           matlab.ui.control.NumericEditField
        CurrentModeLabel                matlab.ui.control.Label
        CurrentModeEditField            matlab.ui.control.EditField
        XAxisDataPanel                  matlab.ui.container.Panel
        GridLayout14                    matlab.ui.container.GridLayout
        XAxisDataSwitch                 matlab.ui.control.Switch
        LoadStagingFileButton           matlab.ui.control.Button
        SaveStagingFileButton           matlab.ui.control.Button
        AddaStagePanel                  matlab.ui.container.Panel
        GridLayout15                    matlab.ui.container.GridLayout
        StageNumberDropDownLabel        matlab.ui.control.Label
        StageNumberDropDown             matlab.ui.control.DropDown
        StartTempEditFieldLabel         matlab.ui.control.Label
        StartTempEditField              matlab.ui.control.NumericEditField
        RampUpRateCminEditFieldLabel    matlab.ui.control.Label
        RampUpRateCminEditField         matlab.ui.control.NumericEditField
        EndTempEditFieldLabel           matlab.ui.control.Label
        EndTempEditField                matlab.ui.control.NumericEditField
        HoldTimeEditFieldLabel          matlab.ui.control.Label
        HoldTimeEditField               matlab.ui.control.NumericEditField
        AddStageButton                  matlab.ui.control.Button
        CancelButton                    matlab.ui.control.Button
        EditaStagePanel                 matlab.ui.container.Panel
        GridLayout16                    matlab.ui.container.GridLayout
        StageNumberDropDown_2Label      matlab.ui.control.Label
        StageNumberDropDown_2           matlab.ui.control.DropDown
        StartTempEditField_2Label       matlab.ui.control.Label
        StartTempEditField_2            matlab.ui.control.NumericEditField
        RampUpRateCminEditField_2Label  matlab.ui.control.Label
        RampUpRateCminEditField_2       matlab.ui.control.NumericEditField
        EndTempEditField_2Label         matlab.ui.control.Label
        EndTempEditField_2              matlab.ui.control.NumericEditField
        HoldTimeEditField_2Label        matlab.ui.control.Label
        HoldTimeEditField_2             matlab.ui.control.NumericEditField
        ApplyChangesButton              matlab.ui.control.Button
        CancelButton_2                  matlab.ui.control.Button
        RemoveaStagePanel               matlab.ui.container.Panel
        GridLayout17                    matlab.ui.container.GridLayout
        StageNumberDropDown_3Label      matlab.ui.control.Label
        StageNumberDropDown_3           matlab.ui.control.DropDown
        StartTempEditField_3Label       matlab.ui.control.Label
        StartTempEditField_3            matlab.ui.control.NumericEditField
        RampUpRateCminEditField_3Label  matlab.ui.control.Label
        RampUpRateCminEditField_3       matlab.ui.control.NumericEditField
        EndTempEditField_3Label         matlab.ui.control.Label
        EndTempEditField_3              matlab.ui.control.NumericEditField
        HoldTimeEditField_3Label        matlab.ui.control.Label
        HoldTimeEditField_3             matlab.ui.control.NumericEditField
        RemoveStageButton               matlab.ui.control.Button
        CancelButton_3                  matlab.ui.control.Button
        HeatFlowUnitsPanel              matlab.ui.container.Panel
        GridLayout25                    matlab.ui.container.GridLayout
        HeatFlowUnitsSwitch             matlab.ui.control.Switch
        LiveTemperatureDataTab          matlab.ui.container.Tab
        GridLayout4                     matlab.ui.container.GridLayout
        UIAxesTemperatures              matlab.ui.control.UIAxes
        AnalysisTab                     matlab.ui.container.Tab
        GridLayout5                     matlab.ui.container.GridLayout
        UIAxesDataAnalysis              matlab.ui.control.UIAxes
        ImportDataFromOperationButton   matlab.ui.control.Button
        ImportDataFromMATFileButton     matlab.ui.control.Button
        DataSetOpttionsPanel            matlab.ui.container.Panel
        DifferentialCheckBox            matlab.ui.control.CheckBox
        ReferenceSampleCheckBox         matlab.ui.control.CheckBox
        TargetTempCheckBox              matlab.ui.control.CheckBox
        TestSampleCheckBox              matlab.ui.control.CheckBox
        XAxisDataButtonGroup            matlab.ui.container.ButtonGroup
        TimesecButton                   matlab.ui.control.RadioButton
        TemperatureCButton_X            matlab.ui.control.RadioButton
        TemperatureKButton_X            matlab.ui.control.RadioButton
        YAxisDataButtonGroup            matlab.ui.container.ButtonGroup
        HeatFlowRateWgButton            matlab.ui.control.RadioButton
        TemperatureCButton_Y            matlab.ui.control.RadioButton
        TemperatureKButton_Y            matlab.ui.control.RadioButton
        TemperatureErrorButton          matlab.ui.control.RadioButton
        TempErrorInstructionsTextArea   matlab.ui.control.TextArea
        RefreshPlotButton               matlab.ui.control.Button
        DataLoadingTextArea             matlab.ui.control.TextArea
        SaveAnalysisDataToExcelFileButton  matlab.ui.control.Button
        ImportDataFromExcelFileButton   matlab.ui.control.Button
        SaveAnalysisDataToMATFileButton  matlab.ui.control.Button
        MaintenanceTab                  matlab.ui.container.Tab
        GridLayout6                     matlab.ui.container.GridLayout
        LoadConfigFileButton            matlab.ui.control.Button
        LoadDefaultConfigButton         matlab.ui.control.Button
        DAQBoxConfigurationPanel        matlab.ui.container.Panel
        GridLayout10                    matlab.ui.container.GridLayout
        InitializeDAQBoxButton_2        matlab.ui.control.Button
        DAQBoxStatusLabel               matlab.ui.control.Label
        DAQStatusLamp                   matlab.ui.control.Lamp
        TemperatureControlsPanel        matlab.ui.container.Panel
        GridLayout11                    matlab.ui.container.GridLayout
        MaxTempLimitCelsiusLabel        matlab.ui.control.Label
        MaxTempLimitCelsiusSpinner      matlab.ui.control.Spinner
        SensorCalibrationPanel          matlab.ui.container.Panel
        GridLayout9                     matlab.ui.container.GridLayout
        TakeMeasurementButton           matlab.ui.control.Button
        CalibrationSamplePanel          matlab.ui.container.Panel
        CalibrationSampleCelsiusEditFieldLabel  matlab.ui.control.Label
        CalibrationSampleCelsiusEditField  matlab.ui.control.NumericEditField
        CalibrationSampleKelvinEditFieldLabel  matlab.ui.control.Label
        CalibrationSampleKelvinEditField  matlab.ui.control.NumericEditField
        CalibrationActualTempPanel      matlab.ui.container.Panel
        CalibrationSampleKelvinEditFieldLabel_2  matlab.ui.control.Label
        CalibrationActualTempEditField  matlab.ui.control.NumericEditField
        CalibrationActualLabel          matlab.ui.control.Label
        OffsetdeltaKLabel               matlab.ui.control.Label
        ActualTempOffsetEditField       matlab.ui.control.NumericEditField
        CalibrationDataPanel            matlab.ui.container.Panel
        GridLayout7                     matlab.ui.container.GridLayout
        CalibrationDataUITable          matlab.ui.control.Table
        RemoveLatestEntryButton         matlab.ui.control.Button
        ClearCalibrationDataButton      matlab.ui.control.Button
        AddtoCalibrationDataButton      matlab.ui.control.Button
        CalibrationOffsetPanel          matlab.ui.container.Panel
        GridLayout19                    matlab.ui.container.GridLayout
        SaveCalibrationOffsetButton     matlab.ui.control.Button
        CalibrationOffsetLabel          matlab.ui.control.Label
        CalibrationOffsetEditField      matlab.ui.control.NumericEditField
        AutoCalibrateButton             matlab.ui.control.Button
        SaveConfigToFileButton          matlab.ui.control.Button
        ApplyConfigChangesButton        matlab.ui.control.Button
        SystemStatusLamp                matlab.ui.control.Lamp
        PIDGainConstantsPanel           matlab.ui.container.Panel
        GridLayout12                    matlab.ui.container.GridLayout
        KpproportionalgainSpinnerLabel  matlab.ui.control.Label
        KpproportionalgainSpinner       matlab.ui.control.Spinner
        KiintegralgainSpinnerLabel      matlab.ui.control.Label
        KiintegralgainSpinner           matlab.ui.control.Spinner
        KdderivativegainSpinnerLabel    matlab.ui.control.Label
        KdderivativegainSpinner         matlab.ui.control.Spinner
        SavedCalibrationOffsetsPanel    matlab.ui.container.Panel
        GridLayout8                     matlab.ui.container.GridLayout
        ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel  matlab.ui.control.Label
        ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField  matlab.ui.control.NumericEditField
        TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel  matlab.ui.control.Label
        TestSampleTemperatureCalibrationOffsetdeltaKEditField  matlab.ui.control.NumericEditField
        ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel  matlab.ui.control.Label
        ReferenceSampleCurrentCalibrationOffsetdeltaAEditField  matlab.ui.control.NumericEditField
        TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel  matlab.ui.control.Label
        TestSampleCurrentCalibrationOffsetdeltaAEditField  matlab.ui.control.NumericEditField
        SelectSensortoCalibrateButtonGroup  matlab.ui.container.ButtonGroup
        TemperatureReferenceSampleButton  matlab.ui.control.ToggleButton
        TemperatureTestSampleButton     matlab.ui.control.ToggleButton
        CurrentReferenceSampleButton    matlab.ui.control.ToggleButton
        CurrentTestSampleButton         matlab.ui.control.ToggleButton
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    %   DSC: UI and control systems for prototype DSC system
    %       Copyright (C) 2019  Christian Kunis
    %
    %       This program is free software: you can redistribute it and/or modify
    %       it under the terms of the GNU General Public License as published by
    %       the Free Software Foundation, either version 3 of the License, or
    %       (at your option) any later version.
    %
    %       This program is distributed in the hope that it will be useful,
    %       but WITHOUT ANY WARRANTY; without even the implied warranty of
    %       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %       GNU General Public License for more details.
    %
    %       You should have received a copy of the GNU General Public License
    %       along with this program. If not, see <https://www.gnu.org/licenses/>.
    %
    %       You may contact the author at ckunis.contact@gmail.com
    
    properties (Access = private)
        % Nothing to see here
    end
    
    properties (Access = public)
        stageController StageController % An object of the StageController class which is responsible for managing the temperature control and staging procedure during live experiments
        
        daqBox DAQBox % An object of the DAQBox class which represents the DAQ Box and provides support for inputs and outputs
        
        liveData DSCData % An object of the DSCData class which is responsible to storing and maintaining data while an experiment is running
        
        analysisData DSCData % An object of the DSCData class which is responsible to storing and maintaining data that is being utilized by the Analysis Tab
        
        
        
        % System Status Variables ________________________________________________________________________________________________________________________________
        
        SetupSemaphore Semaphore % Semaphore to prevent redundant DAQ Box setup when it is currently in progress
        
        ExperimentSemaphore Semaphore % Used to lock out functionality of the experiment controls when the experiment startup is currently in progress
        
        SkipStageSemaphore Semaphore
        
        StopExperimentSemaphore Semaphore
        
        RecalcSemaphore Semaphore
        
        SystemConfigStatus = false % Status of whether the system is fully configured
        
        StagingSaveStatus = false % Status of whether the temperature control staging table have been saved to a file
        
        DataSaveStatus = true % Status of whether the current data on the Operation Tab has been saved to a file
        
        AnalysisDataSaveStatus = true % Status of whether the current data on the Analysis Tab has been saved to a file
        
        
        
        % Temperature Calibration Variables ________________________________________________________________________________________________________________________________
        
        PreviousCalibrationSelection
        
        CalibrationSelectionChanged = true
        
        Calibration_Measured = 0 % The temperature measured during the calibration procedure
        Calibration_Actual = 0 % The temperature entered by the user during the calibration procedure
        Calibration_Offset = 0 % The offset calculated from the CalibrationTemp_Actual and the CalibrationTemp_Measured
        
        CalibrationData_Measured = []
        CalibrationData_Actual = []
        CalibrationData_Offset = []
        
        CalibrationData = []
        
        
        
        
        % Operation Tab Variables ________________________________________________________________________________________________________________________________
        
        DifferentialLine
        ZeroLine
        
        RefSampleLine
        TestSampleLine
        
        TargetTempLine
        RefTempLine
        SampTempLine
        
        XAxisUnits = 'Temp'
        
        TemperatureUnits = 'Celsius'
        
    end
    
    methods (Access = public)
        
        function initializeDAQBox(app)
            app.InitializeDAQBoxButton_2.Enable = 'off';
            app.InitializeDAQBoxButton.Enable = 'off';
            
            % Prevent this function from running more than once at a time
            app.SetupSemaphore.wait();
            app.SetupSemaphore.lock();
            
            if app.SystemConfigStatus
                return
                
            else
                % Change the button text to reflect the current opertation
                app.InitializeDAQBoxButton_2.Text = 'Initializing . . .';
                app.InitializeDAQBoxButton.Text = 'Initializing . . .';
                drawnow nocallbacks
                
                % Create the DAQBox object
                app.daqBox = app.stageController.initializeDAQBox();
                
                % Change the state of the status indicator variables
                app.SystemConfigStatus = true;
                
                % Refrech the UI display
                app.refreshOperationUI();
                app.refreshStagingTable();
                app.refreshMaintenanceUI();
                
                if app.daqBox.UseDAQHardware
                    % Set the button text back to normal
                    app.InitializeDAQBoxButton_2.Text = 'Initialize DAQ Box';
                    app.InitializeDAQBoxButton.Text = 'Initialize DAQ Box';
                else
                    app.InitializeDAQBoxButton_2.Text = 'Simulated DAQ Box';
                    app.InitializeDAQBoxButton.Text = 'Simulated DAQ Box';
                end
                drawnow nocallbacks
                
                app.SetupSemaphore.release();
                
            end
            drawnow
        end
        
        function startExperiment(app)
            app.StartExperimentButton.Enable = 'off';
            drawnow nocallbacks
            
            % Prevent this function from running more than once at a time
            app.ExperimentSemaphore.wait();
            app.ExperimentSemaphore.lock();
            
            if app.stageController.ExperimentInProgress
                return
                
            else
                if isempty(app.daqBox) || ~isvalid(app.daqBox)
                    app.SystemConfigStatus = false;
                    
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
                    
                    warndlg('The DAQ Box Session must be start before running the measurement procedure.')
                    
                    app.ExperimentSemaphore.release();
                    
                else
                    app.SystemConfigStatus = true;
                    
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
                    
                    switch app.TabGroup.SelectedTab
                        case {app.AnalysisTab, app.MaintenanceTab}
                            app.TabGroup.SelectedTab = app.OperationTab;
                    end
                    
                    app.ExperimentSemaphore.release();
                    
                    % Have the stage controller start the experiment
                    app.stageController.runExperimentStaging();
                    
                end
            end
            drawnow
        end
        
        function skipCurrentStage(app)
            % Prevent this function from running more than once at a time
            app.SkipCurrentStageButton.Enable = 'off';
            
            app.SkipStageSemaphore.wait();
            app.SkipStageSemaphore.lock();
            
            if app.stageController.ExperimentInProgress
                app.stageController.forceSkipStage();
            end
            
            app.SkipStageSemaphore.release();
            
            app.refreshOperationUI();
        end
        
        function stopExperiment(app)
            % Prevent this function from running more than once at a time
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                app.StopExperimentSemaphore.wait();
                app.StopExperimentSemaphore.lock();
            end
            
            if app.stageController.ExperimentInProgress
                app.stageController.forceStop();
            end
            
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                app.StopExperimentSemaphore.release();
            end
            
            app.refreshOperationUI();
        end
        
        function stopPWM(app)
            % Prevent this function from running more than once at a time
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                app.SetupSemaphore.wait();
                app.SetupSemaphore.lock();
            end
            
            % Stop the PWM outputs
            if ~isempty(app.daqBox) && isvalid(app.daqBox)
                app.daqBox.stopPWM();
            end
            
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                app.SetupSemaphore.release();
            end
            
            app.refreshOperationUI();
        end
        
        function refreshOperationUI(app)
            % Update the enable state of the UI buttons
            drawnow nocallbacks
            
            % Disable the "Start Experiment" button if the system is not fully configured
            if isempty(app.daqBox) || ~isvalid(app.daqBox)...
                    || isempty(app.stageController) || ~isvalid(app.stageController)
                
                app.StartExperimentButton.Enable = 'off';
                
            else
                app.StartExperimentButton.Enable = 'on';
                
            end
            
            % Enable or disable selective buttons on the Operation Tab depending on whether the experiment procedure is currently running
            if app.stageController.ExperimentInProgress
                if app.stageController.ForceStop
                    app.StopExperimentButton.Enable = 'off';
                else
                    app.StopExperimentButton.Enable = 'on';
                end
                
                if app.stageController.ForceSkipStage
                    app.SkipCurrentStageButton.Enable = 'off';
                else
                    app.SkipCurrentStageButton.Enable = 'on';
                end
                app.StartExperimentButton.Enable = 'off';
                app.SaveDataToFileButton.Enable = 'off';
                app.ClearDataButton.Enable = 'off';
                
                app.SaveStagingFileButton.Enable = 'off';
                app.AddaStageButton.Enable = 'off';
                app.EditaStageButton.Enable = 'off';
                app.RemoveaStageButton.Enable = 'off';
                
                app.ReferenceSampleMassgramsSpinner.Enable = 'off';
                app.TestSampleMassgramsSpinner.Enable = 'off';
                
            else
                app.StopExperimentButton.Enable = 'off';
                app.SkipCurrentStageButton.Enable = 'off';
                
                if app.liveData.DataLength > 0
                    app.SaveDataToFileButton.Enable = 'on';
                    app.ClearDataButton.Enable = 'on';
                else
                    app.SaveDataToFileButton.Enable = 'off';
                    app.ClearDataButton.Enable = 'off';
                end
                
                if app.stageController.NumberOfStages < 1
                    app.SaveStagingFileButton.Enable = 'off';
                else
                    app.SaveStagingFileButton.Enable = 'on';
                end
                app.AddaStageButton.Enable = 'on';
                app.EditaStageButton.Enable = 'on';
                app.RemoveaStageButton.Enable = 'on';
                
                app.ReferenceSampleMassgramsSpinner.Enable = 'on';
                app.TestSampleMassgramsSpinner.Enable = 'on';
                
            end
            
            drawnow
        end
        
        function refreshStagingInfo(app, stageCounter, currentModeText)
            drawnow nocallbacks
            
            % Update the stage counter to indicate the current stage
            app.CurrentStageEditField.Value = stageCounter;
            
            % Update the mode display to indicate the current mode of the stage
            app.CurrentModeEditField.Value = currentModeText;
            
            % Update stage clock text
            app.ElapsedTimeStage0Label.Text = sprintf('Elapsed Time\n(Stage %d):', stageCounter);
            
            drawnow
        end
        
        function refreshStagingTable(app)
            drawnow nocallbacks
            
            % Update the values displayed in the staging table
            app.TempControlStagingUITable.Data = app.stageController.TemperatureControlStaging;
            
            if app.stageController.NumberOfStages < 1
                app.SaveStagingFileButton.Enable = 'off';
            else
                app.SaveStagingFileButton.Enable = 'on';
            end
            
            drawnow
        end
        
        function refreshOperationClock(app, givenSerialDate, varargin)
            drawnow limitrate nocallbacks
            
            if nargin > 1
                currentSerialDate = givenSerialDate;
            else
                try
                    currentSerialDate = app.liveData.LatestSerialDate;
                catch
                    currentSerialDate = app.daqBox.getCurrentSerialDate;
                end
            end
            
            elapsedSerialDate = currentSerialDate - app.liveData.ExpStartSerialDate;
            app.ElapsedTimeEditField.Value = datestr(elapsedSerialDate, 'dd - HH:MM:SS.FFF');
            
            try
                elapsedStageSerialDate = currentSerialDate - app.liveData.LatestStageSerialDate;
                app.CurrentStage_ElapsedTimeEditField.Value...
                    = datestr(elapsedStageSerialDate, 'dd - HH:MM:SS.FFF');
            catch
                app.CurrentStage_ElapsedTimeEditField.Value = 'NaN';
            end
            
            try
                estimatedTimeRemainingSerialDate...
                    = sec2date(app.stageController.EstimatedStageDuration) - elapsedStageSerialDate;
                app.CurrentStage_EstimatedTimeRemainingEditField.Value...
                    = datestr(estimatedTimeRemainingSerialDate, 'dd - HH:MM:SS.FFF');
            catch
                app.CurrentStage_EstimatedTimeRemainingEditField.Value = 'NaN';
            end
            
            drawnow limitrate
        end
        
        function refreshOperationUnits(app)
            drawnow nocallbacks
            
            switch app.TemperatureUnits
                case 'Celsius'
                    app.StartTempEditFieldLabel.Text = 'Start Temp (*C)';
                    app.RampUpRateCminEditFieldLabel.Text = 'Ramp Up Rate (C/min)';
                    app.EndTempEditFieldLabel.Text = 'End Temp (*C)';
                    
                    app.StartTempEditField_2Label.Text = 'Start Temp (*C)';
                    app.RampUpRateCminEditField_2Label.Text = 'Ramp Up Rate (C/min)';
                    app.EndTempEditField_2Label.Text = 'End Temp (*C)';
                    
                    app.StartTempEditField_3Label.Text = 'Start Temp (*C)';
                    app.RampUpRateCminEditField_3Label.Text = 'Ramp Up Rate (C/min)';
                    app.EndTempEditField_3Label.Text = 'End Temp (*C)';
                    
                    app.ReferenceTemperatureGaugeLabel.Text = 'Temperature (*C)';
                    app.TestSampleTemperatureGaugeLabel.Text = 'Temperature (*C)';
                    
                    switch app.XAxisUnits
                        case 'Time'
                            title(app.UIAxesSamples, 'Sample Heat Flow vs. Time')
                            title(app.UIAxesDifferential, 'Differential Heat Flow vs. Time')
                            
                            xlabel(app.UIAxesSamples, 'Time (sec)')
                            xlabel(app.UIAxesDifferential, 'Time (sec)')
                            
                        case 'Temp'
                            title(app.UIAxesSamples, 'Sample Heat Flow vs. Temperature')
                            title(app.UIAxesDifferential, 'Differential Heat Flow vs. Temperature')
                            
                            xlabel(app.UIAxesSamples, 'Temperature (\circC)')
                            xlabel(app.UIAxesDifferential, 'Temperature (\circC)')
                    end
                    
                case 'Kelvin'
                    app.StartTempEditFieldLabel.Text = 'Start Temp (K)';
                    app.RampUpRateCminEditFieldLabel.Text = 'Ramp Up Rate (K/min)';
                    app.EndTempEditFieldLabel.Text = 'End Temp (K)';
                    
                    app.StartTempEditField_2Label.Text = 'Start Temp (K)';
                    app.RampUpRateCminEditField_2Label.Text = 'Ramp Up Rate (K/min)';
                    app.EndTempEditField_2Label.Text = 'End Temp (K)';
                    
                    app.StartTempEditField_3Label.Text = 'Start Temp (K)';
                    app.RampUpRateCminEditField_3Label.Text = 'Ramp Up Rate (K/min)';
                    app.EndTempEditField_3Label.Text = 'End Temp (K)';
                    
                    app.ReferenceTemperatureGaugeLabel.Text = 'Temperature (K)';
                    app.TestSampleTemperatureGaugeLabel.Text = 'Temperature (K)';
                    
                    switch app.XAxisUnits
                        case 'Time'
                            title(app.UIAxesSamples, 'Sample Heat Flow vs. Time')
                            title(app.UIAxesDifferential, 'Differential Heat Flow vs. Time')
                            
                            xlabel(app.UIAxesSamples, 'Time (sec)')
                            xlabel(app.UIAxesDifferential, 'Time (sec)')
                            
                        case 'Temp'
                            title(app.UIAxesSamples, 'Sample Heat Flow vs. Temperature')
                            title(app.UIAxesDifferential, 'Differential Heat Flow vs. Temperature')
                            
                            xlabel(app.UIAxesSamples, 'Temperature (K)')
                            xlabel(app.UIAxesDifferential, 'Temperature (K)')
                    end
            end
            
            try
                app.refreshOperationPlots()
            catch ME
                % do nothing if refreshOperationPlots() fails due to no
                % data
                rethrow(ME)
            end
            
            drawnow
        end
        
        function refreshOperationGauges(app, targetTemp, temp_Ref, temp_Samp, current_Ref, current_Samp)
            drawnow limitrate nocallbacks
            
            switch app.TemperatureUnits
                case 'Celsius'
                    app.TargetTemperatureEditField.Value = targetTemp;
                    
                case 'Kelvin'
                    app.TargetTemperatureEditField.Value = cel2kel(targetTemp);
            end
            
            switch app.TemperatureUnits
                case 'Celsius'
                    app.ReferenceTemperatureEditField.Value = temp_Ref;
                    
                case 'Kelvin'
                    app.ReferenceTemperatureEditField.Value = cel2kel(temp_Ref);
            end
            
            switch app.TemperatureUnits
                case 'Celsius'
                    app.TestSampleTemperatureEditField.Value = temp_Samp;
                    
                case 'Kelvin'
                    app.TestSampleTemperatureEditField.Value = cel2kel(temp_Samp);
            end
            
            app.ReferenceCurrentEditField.Value = current_Ref;
            
            app.TestSampleCurrentEditField.Value = current_Samp;
            
            drawnow limitrate
        end
        
        function refreshOperationPlots(app)
            drawnow limitrate nocallbacks
            
            clearpoints(app.DifferentialLine)
            clearpoints(app.ZeroLine)
            clearpoints(app.RefSampleLine)
            clearpoints(app.TestSampleLine)
            %clearpoints(app.TargetTempLine)
            %clearpoints(app.RefTempLine)
            %clearpoints(app.SampTempLine)
            
            % Update the plots
            switch app.XAxisUnits
                case 'Time'
                    % Plot the data as Heat Flow Rate vs. Time
                    addpoints(app.DifferentialLine,...
                        app.liveData.TimeData,...
                        app.liveData.HeatFlowData_Diff)
                    
                    addpoints(app.ZeroLine, app.liveData.TimeDataRange, [0, 0])
                    
                    addpoints(app.RefSampleLine,...
                        app.liveData.TimeData,...
                        app.liveData.HeatFlowData_Ref)
                    
                    addpoints(app.TestSampleLine,...
                        app.liveData.TimeData,...
                        app.liveData.HeatFlowData_Samp)
                    
                case 'Temp'
                    switch app.TemperatureUnits
                        case 'Celsius'
                            % Plot the data as Heat Flow Rate vs. Temperature
                            addpoints(app.DifferentialLine,...
                                app.liveData.TempData_Interpolated,...
                                app.liveData.HeatFlowData_Diff_Interpolated)
                            
                            addpoints(app.ZeroLine, app.liveData.TempDataRange, [0, 0])
                            
                            addpoints(app.RefSampleLine,...
                                app.liveData.TempData_Ref,...
                                app.liveData.HeatFlowData_Ref)
                            
                            addpoints(app.TestSampleLine,...
                                app.liveData.TempData_Samp,...
                                app.liveData.HeatFlowData_Samp)
                            
                        case 'Kelvin'
                            % Plot the data as Heat Flow Rate vs. Temperature
                            addpoints(app.DifferentialLine,...
                                cel2kel(app.liveData.TempData_Interpolated),...
                                app.liveData.HeatFlowData_Diff_Interpolated)
                            
                            addpoints(app.ZeroLine, cel2kel(app.liveData.TempDataRange), [0, 0])
                            
                            addpoints(app.RefSampleLine,...
                                cel2kel(app.liveData.TempData_Ref),...
                                app.liveData.HeatFlowData_Ref)
                            
                            addpoints(app.TestSampleLine,...
                                cel2kel(app.liveData.TempData_Samp),...
                                app.liveData.HeatFlowData_Samp)
                    end
            end
            
            if app.stageController.ExperimentInProgress
                % Plot the Temperature vs. Time data for the Live Temperature Tab
                addpoints(app.TargetTempLine,...
                    app.liveData.LatestTime,...
                    app.liveData.LatestTargetTemp)
                addpoints(app.RefTempLine,...
                    app.liveData.LatestTime,...
                    app.liveData.LatestTemp_Ref)
                addpoints(app.SampTempLine,...
                    app.liveData.LatestTime,...
                    app.liveData.LatestTemp_Samp)
            end
            
            
            legend(app.UIAxesSamples, 'Location', 'best')
            legend(app.UIAxesTemperatures, 'Location', 'southeastoutside')
            
            drawnow limitrate
        end
        
        function dataLoadStatus = loadMATFileToAnalysis(app)
            %   Load data from a .mat file for analysis
            
            % Prompt the user to select a file
            [dataFileName, dataFilePath] = uigetfile('*.mat');
            
            switch dataFileName
                case 0
                    % Cancel the read operation and return an empty array
                    % if the user closes the file selection window
                    dataLoadStatus = false;
                    return
                    
                otherwise
                    % Create fully-formed filename as a string
                    dataFullPath = fullfile(dataFilePath, dataFileName);
                    
                    % Load the .mat files into a temporary struct variable
                    S = load(dataFullPath);
                    
                    % Get the DSCData object from the temporary struct and store it in the analysisData variable
                    if isfield(S, 'dscData')
                        app.analysisData = S.dscData;
                    elseif isfield(S, 'liveData')
                        app.analysisData = S.liveData;
                    elseif isfield(S, 'analysisData')
                        app.analysisData = S.analysisData;
                    elseif isfield(S, 'obj')
                        if isa(S(1), 'DSCData')
                            app.analysisData = S.obj;
                        else
                            warning('The selected .mat file does not contain a DSCData object')
                            dataLoadStatus = false;
                            return
                        end
                    end
            end
        end
        
        function refreshAnalysisUI(app)
            % Update the sample properties displayed on the Analysis Tab
            drawnow nocallbacks
            if app.analysisData.DataLength > 0
                % Enable the UI once data have been loaded
                app.ReferenceSampleMaterialEditField.Value = app.analysisData.ReferenceSampleData.Material;
                app.ReferenceSampleMassgramsSpinner.Value = app.analysisData.ReferenceSampleData.Mass;
                app.ReferenceSpecificHeatJgKSpinner.Value = app.analysisData.ReferenceSampleData.SpecificHeat;
                
                app.TestSampleMaterialEditField.Value = app.analysisData.TestSampleData.Material;
                app.TestSampleMassgramsSpinner.Value = app.analysisData.TestSampleData.Mass;
                
                app.SaveAnalysisDataToExcelFileButton.Enable = 'on';
                
                app.DifferentialCheckBox.Enable = 'on';
                app.ReferenceSampleCheckBox.Enable = 'on';
                app.TestSampleCheckBox.Enable = 'on';
                app.TargetTempCheckBox.Enable = 'on';
                
                app.TimesecButton.Enable = 'on';
                app.TemperatureCButton_X.Enable = 'on';
                app.TemperatureKButton_X.Enable = 'on';
                
                app.HeatFlowRateWgButton.Enable = 'on';
                app.TemperatureCButton_Y.Enable = 'on';
                app.TemperatureKButton_Y.Enable = 'on';
                app.TemperatureErrorButton.Enable = 'on';
                
                app.RefreshPlotButton.Enable = 'on';
                
                app.ReferenceSampleMaterialEditField.Enable = 'on';
                app.ReferenceSampleMassgramsSpinner.Enable = 'on';
                app.ReferenceSpecificHeatJgKSpinner.Enable = 'off';
                
                app.TestSampleMaterialEditField.Enable = 'on';
                app.TestSampleMassgramsSpinner.Enable = 'on';
                
                
                if app.DifferentialCheckBox.Value
                    app.HeatFlowRateWgButton.Enable = 'on';
                    app.TemperatureErrorButton.Enable = 'off';
                    
                elseif app.TargetTempCheckBox.Value
                    app.HeatFlowRateWgButton.Enable = 'off';
                    app.TemperatureErrorButton.Enable = 'off';
                    app.XAxisDataButtonGroup.SelectedObject = app.TimesecButton;
                    
                elseif app.ReferenceSampleCheckBox.Value || app.TestSampleCheckBox.Value
                    app.HeatFlowRateWgButton.Enable = 'on';
                    app.TemperatureErrorButton.Enable = 'on';
                    
                end
                
                app.refreshAnalysisPlot()
                
            else
                % Disable the analysis data controls if data has not been loaded into the analysis tab
                app.SaveAnalysisDataToExcelFileButton.Enable = 'off';
                
                app.DifferentialCheckBox.Enable = 'off';
                app.ReferenceSampleCheckBox.Enable = 'off';
                app.TestSampleCheckBox.Enable = 'off';
                app.TargetTempCheckBox.Enable = 'off';
                
                app.TimesecButton.Enable = 'off';
                app.TemperatureCButton_X.Enable = 'off';
                app.TemperatureKButton_X.Enable = 'off';
                
                app.HeatFlowRateWgButton.Enable = 'off';
                app.TemperatureCButton_Y.Enable = 'off';
                app.TemperatureKButton_Y.Enable = 'off';
                app.TemperatureErrorButton.Enable = 'off';
                
                app.RefreshPlotButton.Enable = 'off';
                
                app.ReferenceSampleMaterialEditField.Enable = 'off';
                app.ReferenceSampleMassgramsSpinner.Enable = 'off';
                app.ReferenceSpecificHeatJgKSpinner.Enable = 'off';
                
                app.TestSampleMaterialEditField.Enable = 'off';
                app.TestSampleMassgramsSpinner.Enable = 'off';
                
            end
            
            drawnow
        end
        
        function refreshAnalysisPlot(app)
            drawnow nocallbacks
            
            % Clear the previous plot so that the new plot may be drawn
            cla(app.UIAxesDataAnalysis)
            
            % Turn on "hold" for the analysis plot
            hold(app.UIAxesDataAnalysis, 'on')
            
            switch app.XAxisDataButtonGroup.SelectedObject
                case app.TimesecButton
                    app.TemperatureCButton_Y.Enable = 'on';
                    app.TemperatureKButton_Y.Enable = 'on';
                    
                    switch app.YAxisDataButtonGroup.SelectedObject
                        case app.HeatFlowRateWgButton
                            app.TemperatureCButton_X.Enable = 'on';
                            app.TemperatureKButton_X.Enable = 'on';
                            title(app.UIAxesDataAnalysis, 'Heat Flow Rate vs. Time')
                            xlabel(app.UIAxesDataAnalysis, 'Time (sec)')
                            ylabel(app.UIAxesDataAnalysis, 'Heat Flow Rate (W/g)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.DifferentialCheckBox.Value
                                    % Plot the Differential data as Heat Flow Rate vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.HeatFlowData_Diff,...
                                        'DisplayName', 'Differential');
                                    if ~isequal(0, abs(diff(app.analysisData.TimeDataRange)))
                                        line(app.UIAxesDataAnalysis, app.analysisData.TimeDataRange, [0, 0],...
                                            'LineStyle', ':', 'DisplayName', 'Zero');
                                    end
                                end
                                
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Heat Flow Rate vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.HeatFlowData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Heat Flow Rate vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.HeatFlowData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                            end
                            
                        case app.TemperatureCButton_Y
                            app.TemperatureCButton_X.Enable = 'off';
                            app.TemperatureKButton_X.Enable = 'off';
                            title(app.UIAxesDataAnalysis, 'Temperature vs. Time')
                            xlabel(app.UIAxesDataAnalysis, 'Time (sec)')
                            ylabel(app.UIAxesDataAnalysis, 'Temperature (\circC)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.DifferentialCheckBox.Value
                                    % Plot the Differential data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, (app.analysisData.TempData_Samp - app.analysisData.TempData_Ref),...
                                        'DisplayName', 'Differential');
                                    if ~isequal(0, abs(diff(app.analysisData.TimeDataRange)))
                                        line(app.UIAxesDataAnalysis, app.analysisData.TimeDataRange, [0, 0],...
                                            'LineStyle', ':', 'DisplayName', 'Zero');
                                    end
                                end
                                
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.TempData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.TempData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                                
                                if app.TargetTempCheckBox.Value
                                    % Plot the Target Temp data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.TargetTempData,...
                                        'LineStyle', ':', 'DisplayName', 'Target Temp');
                                    
                                end
                            end
                            
                        case app.TemperatureKButton_Y
                            app.TemperatureCButton_X.Enable = 'off';
                            app.TemperatureKButton_X.Enable = 'off';
                            title(app.UIAxesDataAnalysis, 'Temperature vs. Time')
                            xlabel(app.UIAxesDataAnalysis, 'Time (sec)')
                            ylabel(app.UIAxesDataAnalysis, 'Temperature (K)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.DifferentialCheckBox.Value
                                    % Plot the Differential data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, (cel2kel(app.analysisData.TempData_Samp) - cel2kel(app.analysisData.TempData_Ref)),...
                                        'DisplayName', 'Differential');
                                    if ~isequal(0, abs(diff(app.analysisData.TimeDataRange)))
                                        line(app.UIAxesDataAnalysis, app.analysisData.TimeDataRange, [0, 0],...
                                            'LineStyle', ':', 'DisplayName', 'Zero');
                                    end
                                end
                                
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, cel2kel(app.analysisData.TempData_Ref),...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, cel2kel(app.analysisData.TempData_Samp),...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                                
                                if app.TargetTempCheckBox.Value
                                    % Plot the Target Temp data as Temperature vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, (app.analysisData.TargetTempData + app.KELVIN_CONVERSION_FACTOR),...
                                        'LineStyle', ':', 'DisplayName', 'Target Temp');
                                    
                                end
                            end
                            
                        case app.TemperatureErrorButton
                            app.TemperatureCButton_X.Enable = 'on';
                            app.TemperatureKButton_X.Enable = 'on';
                            title(app.UIAxesDataAnalysis, 'Temperature Error vs. Time')
                            xlabel(app.UIAxesDataAnalysis, 'Time (sec)')
                            ylabel(app.UIAxesDataAnalysis, 'Difference Between Measured and Target Temperature (\Delta\circC)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Temperature Error vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.TempErrorData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Temperature Error vs. Time
                                    line(app.UIAxesDataAnalysis, app.analysisData.TimeData, app.analysisData.PWMDutyCycleData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                            end
                    end
                    
                case app.TemperatureCButton_X
                    app.TemperatureCButton_Y.Enable = 'off';
                    app.TemperatureKButton_Y.Enable = 'off';
                    
                    switch app.YAxisDataButtonGroup.SelectedObject
                        case app.TemperatureErrorButton
                            title(app.UIAxesDataAnalysis, 'Temperature Error vs. Target Temperature')
                            xlabel(app.UIAxesDataAnalysis, 'Target Temperature (\circC)')
                            ylabel(app.UIAxesDataAnalysis, 'Difference Between Measured and Target Temperature (\Delta\circC)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Temperature Error vs. Target Temperature
                                    line(app.UIAxesDataAnalysis, app.analysisData.TargetTempData, app.analysisData.TempErrorData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Temperature Error vs. Target Temperature
                                    line(app.UIAxesDataAnalysis, app.analysisDat.TargetTempData, app.analysisData.TempErrorData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                            end
                            
                        otherwise
                            app.YAxisDataButtonGroup.SelectedObject = app.HeatFlowRateWgButton;
                            title(app.UIAxesDataAnalysis, 'Heat Flow Rate vs. Temperature')
                            xlabel(app.UIAxesDataAnalysis, 'Temperature (\circC)')
                            ylabel(app.UIAxesDataAnalysis, 'Heat Flow Rate (W/g)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.DifferentialCheckBox.Value
                                    % Plot the Differential data as Heat Flow Rate vs. Temperature
                                    line(app.UIAxesDataAnalysis, app.analysisData.TempData_Interpolated, app.analysisData.HeatFlowData_Diff_Interpolated,...
                                        'DisplayName', 'Differential');
                                    if ~isequal(0, abs(diff(app.analysisData.TempDataRange)))
                                        line(app.UIAxesDataAnalysis, app.analysisData.TempDataRange, [0, 0],...
                                            'LineStyle', ':', 'DisplayName', 'Zero');
                                    end
                                end
                                
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Heat Flow Rate vs. Temperature
                                    line(app.UIAxesDataAnalysis, app.analysisData.TempData_Ref, app.analysisData.HeatFlowData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Heat Flow Rate vs. Temperature
                                    line(app.UIAxesDataAnalysis, app.analysisData.TempData_Samp, app.analysisData.HeatFlowData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                            end
                    end
                    
                case app.TemperatureKButton_X
                    app.TemperatureCButton_Y.Enable = 'off';
                    app.TemperatureKButton_Y.Enable = 'off';
                    
                    switch app.YAxisDataButtonGroup.SelectedObject
                        case app.TemperatureErrorButton
                            title(app.UIAxesDataAnalysis, 'Temperature Error vs. Target Temperature')
                            xlabel(app.UIAxesDataAnalysis, 'Target Temperature (K)')
                            ylabel(app.UIAxesDataAnalysis, 'Difference Between Measured and Target Temperature (\Delta\circC)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Temperature Error vs. Target Temperature
                                    line(app.UIAxesDataAnalysis, cel2kel(app.analysisData.TargetTempData), app.analysisData.TempErrorData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Temperature Error vs. Target Temperature
                                    line(app.UIAxesDataAnalysis, cel2kel(app.analysisData.TargetTempData), app.analysisData.TempErrorData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                            end
                            
                        otherwise
                            app.YAxisDataButtonGroup.SelectedObject = app.HeatFlowRateWgButton;
                            title(app.UIAxesDataAnalysis, 'Heat Flow Rate vs. Temperature')
                            xlabel(app.UIAxesDataAnalysis, 'Temperature (K)')
                            ylabel(app.UIAxesDataAnalysis, 'Heat Flow Rate (W/g)')
                            
                            % Check whether there is any data before attempting to plot
                            if (app.analysisData.DataLength > 0)
                                if app.DifferentialCheckBox.Value
                                    % Plot the Differential data as Heat Flow Rate vs. Temperature
                                    line(app.UIAxesDataAnalysis, cel2kel(app.analysisData.TempData_Interpolated), app.analysisData.HeatFlowData_Diff_Interpolated,...
                                        'DisplayName', 'Differential');
                                    if ~isequal(0, abs(diff(app.analysisData.TempDataRange)))
                                        line(app.UIAxesDataAnalysis, app.analysisData.TempDataRange, [0, 0],...
                                            'LineStyle', ':', 'DisplayName', 'Zero');
                                    end
                                end
                                
                                if app.ReferenceSampleCheckBox.Value
                                    % Plot the Reference Sample data as Heat Flow Rate vs. Temperature
                                    line(app.UIAxesDataAnalysis, cel2kel(app.analysisData.TempData_Ref), app.analysisData.HeatFlowData_Ref,...
                                        'LineStyle', '--', 'DisplayName', 'Reference');
                                    
                                end
                                
                                if app.TestSampleCheckBox.Value
                                    % Plot the Test Sample data as Heat Flow Rate vs. Temperature
                                    line(app.UIAxesDataAnalysis, cel2kel(app.analysisData.TempData_Samp), app.analysisData.HeatFlowData_Samp,...
                                        'LineStyle', '-.', 'DisplayName', 'Test Sample');
                                    
                                end
                            end
                    end
            end
            
            legend(app.UIAxesDataAnalysis, 'Location', 'best')
            
            % Turn off "hold" for the analysis plot
            hold(app.UIAxesDataAnalysis, 'off')
            
            drawnow
            
        end
        
        function refreshMaintenanceUI(app)
            % Update the Maintenance Tab with the new values
            drawnow nocallbacks
            try
                % Update the options displayed depending on the temperature sensor selection (thermocouple or RTD)
                switch app.daqBox.TempSensorSelection
                    case 'Thermocouple'
                        app.TemperatureSensorSelectionButtonGroup.SelectedObject = app.ThermocoupleButton;
                        
                        app.ThermocoupleConfigurationPanel.Visible = 'on';
                        app.PlatinumRTDConfigurationPanel.Visible = 'off';
                        
                    case 'RTD'
                        app.TemperatureSensorSelectionButtonGroup.SelectedObject = app.PlatinumRTDButton;
                        
                        app.PlatinumRTDConfigurationPanel.Visible = 'on';
                        app.ThermocoupleConfigurationPanel.Visible = 'off';
                end
                
            catch
                % Update the options displayed depending on the temperature sensor selection (thermocouple by default)
                %app.TemperatureSensorSelectionButtonGroup.SelectedObject = app.ThermocoupleButton;
                
                %app.ThermocoupleConfigurationPanel.Visible = 'on';
                %app.PlatinumRTDConfigurationPanel.Visible = 'off';
            end
            
            
            % Update the sample temp measurement display for the calibration panel
            switch app.SelectSensortoCalibrateButtonGroup.SelectedObject
                case app.TemperatureReferenceSampleButton
                    app.CalibrationSampleCelsiusEditFieldLabel.Text = 'Celsius';
                    app.CalibrationSampleKelvinEditFieldLabel.Text = 'Kelvin';
                    app.CalibrationActualTempPanel.Title = 'Actual Temperature (C)';
                    app.CalibrationActualLabel.Text = 'Enter the actual temp:';
                    app.CalibrationSampleKelvinEditFieldLabel_2.Text = 'Celsius';
                    app.OffsetdeltaKLabel.Text = 'Offset (C)';
                    app.CalibrationDataPanel.Title = 'Reference Sample Temperature Sensor Calibration Data';
                    app.CalibrationOffsetPanel.Title = 'Reference Sample Calibration Offset';
                    app.CalibrationOffsetLabel.Text = 'Reference Sample Temperature Calibration Offset (delta C):';
                    
                    % Update the temperature values displayed in the calibration panel
                    app.CalibrationSampleCelsiusEditField.Value = app.Calibration_Measured;
                    app.CalibrationSampleKelvinEditField.Value = cel2kel(app.Calibration_Measured);
                    
                    app.CalibrationDataUITable.ColumnName = {'Measured Temp (C)', 'Actual Temp (C)', 'Offset'};
                    
                case app.TemperatureTestSampleButton
                    app.CalibrationSampleCelsiusEditFieldLabel.Text = 'Celsius';
                    app.CalibrationSampleKelvinEditFieldLabel.Text = 'Kelvin';
                    app.CalibrationActualTempPanel.Title = 'Actual Temperature (C)';
                    app.CalibrationActualLabel.Text = 'Enter the actual temp:';
                    app.CalibrationSampleKelvinEditFieldLabel_2.Text = 'Celsius';
                    app.OffsetdeltaKLabel.Text = 'Offset (C)';
                    app.CalibrationDataPanel.Title = 'Test Sample Temperature Sensor Calibration Data';
                    app.CalibrationOffsetPanel.Title = 'Test Sample Calibration Offset';
                    app.CalibrationOffsetLabel.Text = 'Test Sample Temperature Calibration Offset (delta C)';
                    
                    % Update the temperature values displayed in the calibration panel
                    app.CalibrationSampleCelsiusEditField.Value = app.Calibration_Measured;
                    app.CalibrationSampleKelvinEditField.Value = cel2kel(app.Calibration_Measured);
                    
                    app.CalibrationDataUITable.ColumnName = {'Measured Temp (C)', 'Actual Temp (C)', 'Offset'};
                    
                case app.CurrentReferenceSampleButton
                    app.CalibrationSampleCelsiusEditFieldLabel.Text = '(A)';
                    app.CalibrationSampleKelvinEditFieldLabel.Text = 'N/A';
                    app.CalibrationActualTempPanel.Title = 'Actual Current (A)';
                    app.CalibrationActualLabel.Text = 'Enter the actual current:';
                    app.CalibrationSampleKelvinEditFieldLabel_2.Text = '(A)';
                    app.OffsetdeltaKLabel.Text = 'Offset (A)';
                    app.CalibrationDataPanel.Title = 'Reference Sample Current Sensor Calibration Data';
                    app.CalibrationOffsetPanel.Title = 'Reference Sample Calibration Offset';
                    app.CalibrationOffsetLabel.Text = 'Reference Sample Current Calibration Offset (delta A)';
                    
                    % Update the temperature values displayed in the calibration panel
                    app.CalibrationSampleCelsiusEditField.Value = app.Calibration_Measured;
                    app.CalibrationSampleKelvinEditField.Value = 0;
                    
                    app.CalibrationDataUITable.ColumnName = {'Measured Current (A)', 'Actual Current (A)', 'Offset'};
                    
                case app.CurrentTestSampleButton
                    app.CalibrationSampleCelsiusEditFieldLabel.Text = '(A)';
                    app.CalibrationSampleKelvinEditFieldLabel.Text = 'N/A';
                    app.CalibrationActualTempPanel.Title = 'Actual Current (A)';
                    app.CalibrationActualLabel.Text = 'Enter the actual current:';
                    app.CalibrationSampleKelvinEditFieldLabel_2.Text = '(A)';
                    app.OffsetdeltaKLabel.Text = 'Offset (A)';
                    app.CalibrationDataPanel.Title = 'Test Sample Current Sensor Calibration Data';
                    app.CalibrationOffsetPanel.Title = 'Test Sample Calibration Offset';
                    app.CalibrationOffsetLabel.Text = 'Test Sample Current Calibration Offset (delta A)';
                    
                    % Update the temperature values displayed in the calibration panel
                    app.CalibrationSampleCelsiusEditField.Value = app.Calibration_Measured;
                    app.CalibrationSampleKelvinEditField.Value = 0;
                    
                    app.CalibrationDataUITable.ColumnName = {'Measured Current (A)', 'Actual Current (A)', 'Offset'};
                    
            end
            
            app.Calibration_Offset = app.Calibration_Actual - app.Calibration_Measured;
            app.ActualTempOffsetEditField.Value = app.Calibration_Offset;
            
            if ~isempty(app.CalibrationData_Offset)
                averageCalibrationOffset = mean(app.CalibrationData_Offset);
                app.CalibrationOffsetEditField.Value = averageCalibrationOffset;
            end
            
            app.CalibrationData = [app.CalibrationData_Measured', app.CalibrationData_Actual', app.CalibrationData_Offset'];
            app.CalibrationDataUITable.Data = app.CalibrationData;
            
            if isempty(app.daqBox) || ~isvalid(app.daqBox)
                % Refresh the values displayed on the Maintenance Tab
                app.DAQStatusLamp.Color = 'r';
                app.DAQStatusLamp.Enable = 'off';
                app.InitializeDAQBoxButton_2.Enable = 'on';
                app.InitializeDAQBoxButton.Enable = 'on';
                
                app.LoadConfigFileButton.Enable = 'off';
                app.LoadDefaultConfigButton.Enable = 'off';
                
                app.MaxTempLimitCelsiusSpinner.Enable = 'off';
                
                app.KpproportionalgainSpinner.Enable = 'off';
                app.KiintegralgainSpinner.Enable = 'off';
                app.KdderivativegainSpinner.Enable = 'off';
                
                app.TemperatureReferenceSampleButton.Enable = 'off';
                app.TemperatureTestSampleButton.Enable = 'off';
                app.CurrentReferenceSampleButton.Enable = 'off';
                app.CurrentTestSampleButton.Enable = 'off';
                
                app.TakeMeasurementButton.Enable = 'off';
                
                app.AddtoCalibrationDataButton.Enable = 'off';
                
                app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Enable = 'off';
                app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Enable = 'off';
                app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Enable = 'off';
                app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Enable = 'off';
                
                app.ApplyConfigChangesButton.Enable = 'off';
                
            else
                % Refresh the values displayed on the Maintenance Tab
                app.DAQStatusLamp.Color = 'g';
                app.DAQStatusLamp.Enable = 'on';
                app.InitializeDAQBoxButton_2.Text = 'Restart DAQ Box';
                app.InitializeDAQBoxButton_2.Enable = 'on';
                app.InitializeDAQBoxButton.Enable = 'off';
                
                app.LoadConfigFileButton.Enable = 'on';
                app.LoadDefaultConfigButton.Enable = 'on';
                
                app.MaxTempLimitCelsiusSpinner.Enable = 'on';
                
                app.KpproportionalgainSpinner.Enable = 'on';
                app.KiintegralgainSpinner.Enable = 'on';
                app.KdderivativegainSpinner.Enable = 'on';
                
                app.MaxTempLimitCelsiusSpinner.Value = app.daqBox.MaxTempLimit;
                
                app.KpproportionalgainSpinner.Value = app.daqBox.PID_Kp;
                app.KiintegralgainSpinner.Value = app.daqBox.PID_Ki;
                app.KdderivativegainSpinner.Value = app.daqBox.PID_Kd;
                
                app.TemperatureReferenceSampleButton.Enable = 'on';
                app.TemperatureTestSampleButton.Enable = 'on';
                app.CurrentReferenceSampleButton.Enable = 'on';
                app.CurrentTestSampleButton.Enable = 'on';
                
                app.TakeMeasurementButton.Enable = 'on';
                
                app.AddtoCalibrationDataButton.Enable = 'on';
                
                app.RemoveLatestEntryButton.Enable = 'on';
                app.ClearCalibrationDataButton.Enable = 'on';
                
                app.SaveCalibrationOffsetButton.Enable = 'on';
                
                app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Enable = 'on';
                app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Enable = 'on';
                app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Enable = 'on';
                app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Enable = 'on';
                
                app.ApplyConfigChangesButton.Enable = 'on';
                
                app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Value = app.daqBox.TempCalibrationOffset_Ref;
                app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Value = app.daqBox.TempCalibrationOffset_Samp;
                app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Value = app.daqBox.CurrentCalibrationOffset_Ref;
                app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Value = app.daqBox.CurrentCalibrationOffset_Samp;
                
                % Set the system status lamp to green if the system is fully configured
                if app.SystemConfigStatus
                    app.SystemStatusLamp.Color = 'g';
                    app.SystemStatusLamp.Enable = 'on';
                    
                else
                    app.SystemStatusLamp.Color = 'r';
                    app.SystemStatusLamp.Enable = 'off';
                    
                end
                
                if app.stageController.ExperimentInProgress
                    app.InitializeDAQBoxButton_2.Enable = 'off';
                    app.InitializeDAQBoxButton.Enable = 'off';
                    
                    app.LoadConfigFileButton.Enable = 'off';
                    app.LoadDefaultConfigButton.Enable = 'off';
                    
                    app.TakeMeasurementButton.Enable = 'off';
                    
                    app.AutoCalibrateButton.Enable = 'off';
                    
                    app.AddtoCalibrationDataButton.Enable = 'off';
                    
                    app.RemoveLatestEntryButton.Enable = 'off';
                    app.ClearCalibrationDataButton.Enable = 'off';
                    
                    app.SaveCalibrationOffsetButton.Enable = 'off';
                    
                    app.ApplyConfigChangesButton.Enable = 'off';
                    
                    app.MaxTempLimitCelsiusSpinner.Enable = 'off';
                    
                    app.KpproportionalgainSpinner.Enable = 'off';
                    app.KiintegralgainSpinner.Enable = 'off';
                    app.KdderivativegainSpinner.Enable = 'off';
                    
                end
            end
            
            drawnow
            
        end
        
        function refreshCalibrationUI(app, temp_Ref, temp_Samp, current_Ref, current_Samp)
            switch app.SelectSensortoCalibrateButtonGroup.SelectedObject
                case app.TemperatureReferenceSampleButton
                    app.Calibration_Measured = temp_Ref;
                    
                case app.TemperatureTestSampleButton
                    app.Calibration_Measured = temp_Samp;
                    
                case app.CurrentReferenceSampleButton
                    app.Calibration_Measured = current_Ref;
                    
                case app.CurrentTestSampleButton
                    app.Calibration_Measured = current_Samp;
                    
            end
            
            app.refreshMaintenanceUI();
            
        end
        
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            app.InitializeDAQBoxButton_2.Enable = 'off';
            app.InitializeDAQBoxButton.Enable = 'off';
            
            disp('Starting DSC App. Please Wait...')
            
            s = 0;
            n = 6;
            
            % Create a waitbar
            f = waitbar(s/n,'Please wait...');
            CLI_Waitbar(s/n,'Please wait...');
            
            daqreset;
            
            message = 'Starting Stage Controller...';
            try
                s = s + 1;
                waitbar(s/n,f,message);
                % Update the CLI_Waitbar progress and label
                CLI_Waitbar(s/n,message);
            catch
                UIFigureCloseRequest(app);
                return
            end
            % Create a new StageController object
            app.stageController = StageController(app);
            
            app.refreshStagingTable();
            
            
            message = 'Creating Live Data Object...';
            try
                s = s + 1;
                % Attempt to update the waitbar progress and label
                waitbar(s/n,f,message);
                % Update the CLI_Waitbar progress and label
                CLI_Waitbar(s/n,message);
            catch
                % Close the app if the waitbar was closed by the user
                UIFigureCloseRequest(app);
                return
            end
            % Create a new DSCData object
            app.liveData = app.stageController.createLiveData();
            
            
            message = 'Creating Analysis Data Object...';
            try
                s = s + 1;
                % Attempt to update the waitbar progress and label
                waitbar(s/n,f,message);
                % Update the CLI_Waitbar progress and label
                CLI_Waitbar(s/n,message);
            catch
                % Close the app if the waitbar was closed by the user
                UIFigureCloseRequest(app);
                return
            end
            % Create a new DSCData object
            app.analysisData = DSCData;
            
            
            message = 'Creating Animated Lines...';
            try
                s = s + 1;
                % Attempt to update the waitbar progress and label
                waitbar(s/n,f,message);
                % Update the CLI_Waitbar progress and label
                CLI_Waitbar(s/n,message);
            catch
                % Close the app if the waitbar was closed by the user
                UIFigureCloseRequest(app);
                return
            end
            % Create the animatedline objects
            app.DifferentialLine = animatedline(app.UIAxesDifferential, 'Color', 'blue', 'LineStyle', '-');
            app.ZeroLine = animatedline(app.UIAxesDifferential, 'Color', 'black', 'LineStyle', ':');
            
            app.RefSampleLine = animatedline(app.UIAxesSamples, 'Color', 'blue', 'LineStyle', '--');
            app.TestSampleLine = animatedline(app.UIAxesSamples, 'Color', 'red', 'LineStyle', '-.');
            
            app.TargetTempLine = animatedline(app.UIAxesTemperatures, 'Color', 'black', 'LineStyle', ':');
            app.RefTempLine = animatedline(app.UIAxesTemperatures, 'Color', 'blue', 'LineStyle', '--');
            app.SampTempLine = animatedline(app.UIAxesTemperatures, 'Color', 'red', 'LineStyle', '-.');
            
            % Create a legend for the samples plot
            legend(app.UIAxesSamples, 'Reference Sample', 'Test Sample', 'Location', 'best')
            
            % Create a legend for the temperature plot
            legend(app.UIAxesTemperatures, 'Target Temperature', 'Reference Sample', 'Test Sample', 'Location', 'bestoutside')
            
            % Refresh the plot units
            app.refreshOperationUnits();
            
            
            message = 'Creating Semaphores...';
            try
                s = s + 1;
                % Attempt to update the waitbar progress and label
                waitbar(s/n,f,message);
                % Update the CLI_Waitbar progress and label
                CLI_Waitbar(s/n,message);
            catch
                % Close the app if the waitbar was closed by the user
                UIFigureCloseRequest(app);
                return
            end
            % Create the Semaphore objects
            app.SetupSemaphore = Semaphore;
            app.ExperimentSemaphore = Semaphore;
            app.SkipStageSemaphore = Semaphore;
            app.StopExperimentSemaphore = Semaphore;
            app.RecalcSemaphore = Semaphore;
            
            % Lock and release the semaphores to ensure that they are initialized in the correct state
            app.SetupSemaphore.lock();
            app.ExperimentSemaphore.lock();
            app.SkipStageSemaphore.lock();
            app.StopExperimentSemaphore.lock();
            app.RecalcSemaphore.lock();
            
            app.SetupSemaphore.release();
            app.ExperimentSemaphore.release();
            app.SkipStageSemaphore.release();
            app.StopExperimentSemaphore.release();
            app.RecalcSemaphore.release();
            
            
            message = 'App is now Ready';
            try
                % Attempt to update the waitbar progress and label
                waitbar(1,f,message);
                
                % Update the CLI_Waitbar progress and label
                CLI_Waitbar(1,message);
            catch
                % Close the app if the waitbar was closed by the user
                UIFigureCloseRequest(app);
                return
            end
            
            pause(0.5)
            
            try
                % Attempt to close the waitbar
                close(f)
            catch
                % Close the app if the waitbar was closed by the user
                UIFigureCloseRequest(app);
                return
            end
            
            disp(' ')
            disp(' ')
            disp(' ')
            disp(' ')
            
            app.InitializeDAQBoxButton_2.Enable = 'on';
            app.InitializeDAQBoxButton.Enable = 'on';
            
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {640, 640};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {352, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end

        % Button pushed function: LoadConfigFileButton
        function LoadConfigFileButtonPushed(app, event)
            configLoadStatus = app.daqBox.loadConfigFile();
            
            app.SystemConfigStatus = configLoadStatus;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI(); % Update the UI with the new values
            
        end

        % Button pushed function: InitializeDAQBoxButton, 
        % InitializeDAQBoxButton_2
        function StartDAQSessionsButtonPushed(app, event)
            app.InitializeDAQBoxButton_2.Enable = 'off';
            app.InitializeDAQBoxButton.Enable = 'off';
            
            drawnow nocallbacks
            
            app.initializeDAQBox();
            
            drawnow
            
        end

        % Button pushed function: StartExperimentButton
        function StartExperimentButtonPushed(app, event)
            app.startExperiment();
            
        end

        % Button pushed function: LoadDefaultConfigButton
        function LoadDefaultConfigButtonPushed(app, event)
            % Load the default config values
            app.daqBox.loadConfigFile('default');
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI(); % Update the UI with the new values
            
        end

        % Button pushed function: ClearDataButton
        function ClearDataButtonPushed(app, event)
            if app.DataSaveStatus
                SaveCheck = 'Yes';
            else
                SaveCheck = questdlg(sprintf('WARNING: All unsaved data will be lost\nAre you sure you want to clear the current data?'));
            end
            
            switch SaveCheck
                case 'Yes'
                    % Clear the points from the plots
                    clearpoints(app.DifferentialLine)
                    clearpoints(app.ZeroLine)
                    clearpoints(app.RefSampleLine)
                    clearpoints(app.TestSampleLine)
                    clearpoints(app.TargetTempLine)
                    clearpoints(app.RefTempLine)
                    clearpoints(app.SampTempLine)
                    
                    % Create a new, empty DSCData object
                    app.liveData = app.stageController.createLiveData();
                    
                    app.ReferenceCurrentEditField.Value = 0;
                    app.ReferenceTemperatureEditField.Value = 0;
                    app.TestSampleCurrentEditField.Value = 0;
                    app.TestSampleTemperatureEditField.Value = 0;
                    app.TargetTemperatureEditField.Value = 0;
                    
                    app.ElapsedTimeEditField.Value = datestr(0, 'dd - HH:MM:SS.FFF');
                    app.CurrentStage_ElapsedTimeEditField.Value = datestr(0, 'dd - HH:MM:SS.FFF');
                    app.CurrentStage_EstimatedTimeRemainingEditField.Value = datestr(0, 'dd - HH:MM:SS.FFF');
                    
                    app.daqBox.SimulatedTemp_Ref = app.daqBox.SIMULATED_AMBIENT_TEMP;
                    app.daqBox.SimulatedTemp_Samp = app.daqBox.SIMULATED_AMBIENT_TEMP;
                    
                    app.DataSaveStatus = true;
                    
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
                    
                otherwise
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
            end
            
        end

        % Callback function
        function ReferenceSampleSpecificHeatSpinnerValueChanged(app, event)
            app.liveData.ReferenceSampleData.SpecificHeat = app.ReferenceSpecificHeatJgKSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: ReferenceSampleMassgramsSpinner
        function ReferenceSampleMassgramsSpinnerValueChanged(app, event)
            % Prevent this function from running more than once at a time
            app.RecalcSemaphore.wait();
            app.RecalcSemaphore.lock();
            
            app.SampleMass_Reference = app.ReferenceSampleMassgramsSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            try
                app.daqBox.recalculateHeatFlow(app.liveData);
            catch
                warning('An error occurred when trying to recalculate the live experiment data for the new mass')
                % Do nothing in the event of an error
            end
            
            try
                app.daqBox.recalculateHeatFlow(app.analysisData);
            catch
                warning('An error occurred when trying to recalculate the analysis data for the new mass')
                % Do nothing in the event of an error
            end
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            app.refreshOperationPlots();
            app.refreshAnalysisPlot();
            
            app.RecalcSemaphore.release();
            
        end

        % Value changed function: TestSampleMassgramsSpinner
        function TestSampleMassgramsSpinnerValueChanged(app, event)
            % Prevent this function from running more than once at a time
            app.RecalcSemaphore.wait();
            app.RecalcSemaphore.lock();
            
            app.SampleMass_TestSample = app.TestSampleMassgramsSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            try
                app.daqBox.recalculateHeatFlow(app.liveData);
            catch
                warning('An error occurred when trying to recalculate the live experiment data for the new mass')
                % Do nothing in the event of an error
            end
            
            try
                app.daqBox.recalculateHeatFlow(app.analysisData);
            catch
                warning('An error occurred when trying to recalculate the analysis data for the new mass')
                % Do nothing in the event of an error
            end
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            app.refreshOperationPlots();
            app.refreshAnalysisPlot();
            
            app.RecalcSemaphore.release();
            
        end

        % Button pushed function: SaveDataToFileButton
        function SaveDataToFileButtonPushed(app, event)
            app.SaveDataToFileButton.Text = 'Saving Data . . .';
            
            app.DataSaveStatus = app.liveData.saveXlsxFile();
            
            app.refreshOperationUI; % Update the UI with the new values
            
            if app.DataSaveStatus
                app.SaveDataToFileButton.Text = 'Data Saved';
                pause(1)
                app.SaveDataToFileButton.Text = 'Save Data To File';
                
            else
                app.SaveDataToFileButton.Text = 'Save Data To File';
                
            end
            
        end

        % Button pushed function: ApplyConfigChangesButton
        function ApplyConfigChangesButtonPushed(app, event)
            if isempty(app.daqBox) || ~isvalid(app.daqBox)
                app.SystemConfigStatus = false;
                
                app.refreshMaintenanceUI();
                app.refreshOperationUI();
                
                warndlg('DAQ Box must be configured')
                
            else
                app.SystemConfigStatus = true;
                
                app.refreshMaintenanceUI();
                app.refreshOperationUI();
                
            end
            
        end

        % Button pushed function: StopExperimentButton
        function StopExperimentButtonPushed(app, event)
            app.StartExperimentButton.Enable = 'off';
            app.StopExperimentButton.Enable = 'off';
            app.SkipCurrentStageButton.Enable = 'off';
            drawnow nocallbacks
            
            % Stop the currently running experiment
            app.stopExperiment();
            
            app.refreshOperationUI(); % Update the UI with the new values
            
            drawnow
            
        end

        % Callback function
        function TemperatureSensorSelectionButtonGroupSelectionChanged(app, event)
            switch app.TemperatureSensorSelectionButtonGroup.SelectedObject
                case app.ThermocoupleButton
                    app.TempSensorSelection = 'Thermocouple';
                    
                case app.PlatinumRTDButton
                    app.TempSensorSelection = 'RTD';
                    
            end
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Callback function
        function ThermocoupleTypeDropDownValueChanged(app, event)
            switch app.ThermocoupleTypeDropDown.Value
                case 'Type J'
                    app.ThermocoupleType = 'J';
                    app.refreshMaintenanceUI();
                    
                case 'Type K'
                    app.ThermocoupleType = 'K';
                    app.refreshMaintenanceUI();
                    
            end
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Callback function
        function RTDResistenceohmSpinnerValueChanged(app, event)
            app.RTDResistance = app.RTDResistenceohmSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Callback function
        function TemperatureUnitsSwitchValueChanged(app, event)
            app.TemperatureUnits = app.TemperatureUnitsSwitch.Value;
            
            app.refreshOperationUnits() % Update the Units displayed on the UI
            
        end

        % Callback function
        function RTDTypeDropDownValueChanged(app, event)
            app.RTDType = app.RTDTypeDropDown.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Callback function
        function RTDConfigurationDropDownValueChanged(app, event)
            app.RTDConfiguration = app.RTDConfigurationDropDown.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: XAxisDataSwitch
        function XAxisDataSwitchValueChanged(app, event)
            app.XAxisUnits = app.XAxisDataSwitch.Value;
            
            app.refreshOperationUnits() % Update the Units displayed on the UI
            
        end

        % Value changed function: DifferentialCheckBox
        function DifferentialCheckBoxValueChanged(app, event)
            if app.DifferentialCheckBox.Value
                app.ReferenceSampleCheckBox.Value = false;
                app.TestSampleCheckBox.Value = false;
                app.TargetTempCheckBox.Value = false;
                
                switch app.YAxisDataButtonGroup.SelectedObject
                    case app.TemperatureErrorButton
                        app.YAxisDataButtonGroup.SelectedObject = app.HeatFlowRateWgButton;
                        
                end
                
            end
            
            app.refreshAnalysisUI();
            
        end

        % Value changed function: ReferenceSampleCheckBox
        function ReferenceSampleCheckBoxValueChanged(app, event)
            if app.ReferenceSampleCheckBox.Value
                app.DifferentialCheckBox.Value = false;
                
            end
            
            app.refreshAnalysisUI();
            
        end

        % Value changed function: TargetTempCheckBox
        function TargetTempCheckBoxValueChanged(app, event)
            if app.TargetTempCheckBox.Value
                app.DifferentialCheckBox.Value = false;
                
                app.XAxisDataButtonGroup.SelectedObject = app.TimesecButton;
                
                switch app.YAxisDataButtonGroup.SelectedObject
                    case app.HeatFlowRateWgButton
                        app.YAxisDataButtonGroup.SelectedObject = app.TemperatureCButton_Y;
                        
                    case app.TemperatureErrorButton
                        app.YAxisDataButtonGroup.SelectedObject = app.TemperatureCButton_Y;
                        
                end
                
            end
            
            app.refreshAnalysisUI();
            
        end

        % Value changed function: TestSampleCheckBox
        function TestSampleCheckBoxValueChanged(app, event)
            if app.TestSampleCheckBox.Value
                app.DifferentialCheckBox.Value = false;
                
            end
            
            app.refreshAnalysisUI();
            
        end

        % Selection changed function: YAxisDataButtonGroup
        function YAxisDataButtonGroupSelectionChanged(app, event)
            app.refreshAnalysisUI();
            
        end

        % Selection changed function: XAxisDataButtonGroup
        function XAxisDataButtonGroupSelectionChanged(app, event)
            app.refreshAnalysisUI();
            
        end

        % Button pushed function: TakeMeasurementButton
        function TakeMeasurementButtonPushed(app, event)
            
            [~, temp_Ref, temp_Samp, current_Ref, current_Samp] = app.daqBox.getSingleScanData();
            
            switch app.SelectSensortoCalibrateButtonGroup.SelectedObject
                case app.TemperatureReferenceSampleButton
                    app.Calibration_Measured = temp_Ref;
                    
                case app.TemperatureTestSampleButton
                    app.Calibration_Measured = temp_Samp;
                    
                case app.CurrentReferenceSampleButton
                    app.Calibration_Measured = current_Ref;
                    
                case app.CurrentTestSampleButton
                    app.Calibration_Measured = current_Samp;
                    
            end
            
            app.refreshMaintenanceUI();
            
        end

        % Value changed function: MaxTempLimitCelsiusSpinner
        function MaxTempLimitCelsiusSpinnerValueChanged(app, event)
            app.daqBox.MaxTempLimit = app.MaxTempLimitCelsiusSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Button pushed function: ImportDataFromOperationButton
        function ImportDataFromOperationButtonPushed(app, event)
            if app.liveData.DataLength == 0
                warndlg('No data has been detected from the Operation Tab')
                
            else
                app.analysisData = app.liveData;
                
            end
            
            app.refreshAnalysisUI()
            
        end

        % Button pushed function: SaveConfigToFileButton
        function SaveConfigToFileButtonPushed(app, event)
            app.SaveConfigToFileButton.Text = 'Saving Config . . .';
            
            app.daqBox.saveConfigFile();
            
            app.refreshMaintenanceUI();
            
            if app.daqBox.ConfigSaveStatus
                app.SaveConfigToFileButton.Text = 'Config Saved';
                pause(1)
                app.SaveConfigToFileButton.Text = 'Save Config To File';
                
            else
                app.SaveConfigToFileButton.Text = 'Save Config To File';
                
            end
            
            drawnow;
            
        end

        % Button pushed function: RefreshPlotButton
        function RefreshPlotButtonPushed(app, event)
            app.refreshAnalysisUI();
            
        end

        % Button pushed function: ImportDataFromMATFileButton
        function ImportDataFromMATFileButtonPushed(app, event)
            app.DataLoadingTextArea.Visible = 'on';
            
            app.analysisData = DSCData();
            
            app.loadMATFileToAnalysis();
            
            app.refreshAnalysisUI()
            
            app.DataLoadingTextArea.Visible = 'off';
            
        end

        % Value changed function: ReferenceSampleMaterialEditField
        function ReferenceSampleMaterialEditFieldValueChanged(app, event)
            app.SampleMaterial_Reference = app.ReferenceSampleMaterialEditField.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: TestSampleMaterialEditField
        function TestSampleMaterialEditFieldValueChanged(app, event)
            app.SampleMaterial_TestSample = app.TestSampleMaterialEditField.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Button pushed function: AddaStageButton
        function AddaStageButtonPushed(app, event)
            % Clear the Items and ItemsData cell arrays before they are rebuilt with the newest values
            app.StageNumberDropDown.Items = {'1'};
            app.StageNumberDropDown.ItemsData = {1};
            
            for StageNumber = 1:(app.stageController.NumberOfStages + 1)
                app.StageNumberDropDown.Items{StageNumber} = int2str(StageNumber);
                app.StageNumberDropDown.ItemsData{StageNumber} = StageNumber;
                
            end
            app.StageNumberDropDown.Value = StageNumber;
            
            % Update the values displayed in the "Add a Stage" panel
            app.StartTempEditField.Value = 0;
            app.RampUpRateCminEditField.Value = 0;
            app.EndTempEditField.Value = 0;
            app.HoldTimeEditField.Value = 0;
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.ExperimentStagingConfigurationPanel.Visible = 'off';
            app.AddaStagePanel.Visible = 'on';
            
        end

        % Button pushed function: AddStageButton
        function AddStageButtonPushed(app, event)
            NewStageNumber = app.StageNumberDropDown.Value;
            
            % Convert units from Celsius to Kelvin if necessary
            switch app.TemperatureUnits
                case 'Celsius'
                    StartTemp = app.StartTempEditField.Value;
                    EndTemp = app.EndTempEditField.Value;
                    
                case 'Kelvin'
                    StartTemp = kel2cel(app.StartTempEditField.Value);
                    EndTemp = kel2cel(app.EndTempEditField.Value);
                    
            end
            
            RampUpRate = app.RampUpRateCminEditField.Value;
            
            HoldTime = app.HoldTimeEditField.Value;
            
            % Add the stage
            app.stageController.addStage(NewStageNumber, StartTemp, RampUpRate, EndTemp, HoldTime);
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.AddaStagePanel.Visible = 'off';
            app.ExperimentStagingConfigurationPanel.Visible = 'on';
            
        end

        % Button pushed function: CancelButton
        function CancelButtonPushed(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.AddaStagePanel.Visible = 'off';
            app.ExperimentStagingConfigurationPanel.Visible = 'on';
            
        end

        % Button pushed function: EditaStageButton
        function EditaStageButtonPushed(app, event)
            % Clear the Items and ItemsData cell arrays before they are rebuilt with the newest values
            app.StageNumberDropDown_2.Items = {'1'};
            app.StageNumberDropDown_2.ItemsData = {1};
            
            for StageNumber = 1:(app.stageController.NumberOfStages)
                app.StageNumberDropDown_2.Items{StageNumber} = int2str(StageNumber);
                app.StageNumberDropDown_2.ItemsData{StageNumber} = StageNumber;
                
            end
            
            app.StageNumberDropDown_2.Value = StageNumber;
            
            % Convert units from Celsius to Kelvin if necessary
            switch app.TemperatureUnits
                case 'Celsius'
                    StartTemp = app.stageController.getStartTemp(StageNumber);
                    EndTemp = app.stageController.getEndTemp(StageNumber);
                    
                case 'Kelvin'
                    StartTemp = cel2kel(app.stageController.getStartTemp(StageNumber));
                    EndTemp = cel2kel(app.stageController.getEndTemp(StageNumber));
                    
            end
            
            % Update the values displayed in the "Edit a Stage" panel
            app.StartTempEditField_2.Value = StartTemp;
            app.RampUpRateCminEditField_2.Value = app.stageController.getRampUpRate(StageNumber);
            app.EndTempEditField_2.Value = EndTemp;
            app.HoldTimeEditField_2.Value = app.stageController.getHoldTime(StageNumber);
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.ExperimentStagingConfigurationPanel.Visible = 'off';
            app.EditaStagePanel.Visible = 'on';
            
        end

        % Value changed function: StageNumberDropDown_2
        function StageNumberDropDown_2ValueChanged(app, event)
            StageNumber = app.StageNumberDropDown_2.Value;
            
            % Convert units from Celsius to Kelvin if necessary
            switch app.TemperatureUnits
                case 'Celsius'
                    StartTemp = app.stageController.getStartTemp(StageNumber);
                    EndTemp = app.stageController.getEndTemp(StageNumber);
                    
                case 'Kelvin'
                    StartTemp = cel2kel(app.stageController.getStartTemp(StageNumber));
                    EndTemp = cel2kel(app.stageController.getEndTemp(StageNumber));
                    
            end
            
            % Update the values displayed in the "Edit a Stage" panel
            app.StartTempEditField_2.Value = StartTemp;
            app.RampUpRateCminEditField_2.Value = app.stageController.getRampUpRate(StageNumber);
            app.EndTempEditField_2.Value = EndTemp;
            app.HoldTimeEditField_2.Value = app.stageController.getHoldTime(StageNumber);
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
        end

        % Button pushed function: ApplyChangesButton
        function ApplyChangesButtonPushed(app, event)
            StageNumber = app.StageNumberDropDown_2.Value;
            
            % Convert units from Celsius to Kelvin if necessary
            switch app.TemperatureUnits
                case 'Celsius'
                    StartTemp = app.StartTempEditField_2.Value;
                    EndTemp = app.EndTempEditField_2.Value;
                    
                case 'Kelvin'
                    StartTemp = kel2cel(app.StartTempEditField_2.Value);
                    EndTemp = kel2cel(app.EndTempEditField_2.Value);
                    
            end
            
            RampUpRate = app.RampUpRateCminEditField_2.Value;
            
            HoldTime = app.HoldTimeEditField_2.Value;
            
            % Have the new stage parameters added to the table
            app.stageController.editStage(StageNumber, StartTemp, RampUpRate, EndTemp, HoldTime);
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.EditaStagePanel.Visible = 'off';
            app.ExperimentStagingConfigurationPanel.Visible = 'on';
            
        end

        % Button pushed function: CancelButton_2
        function CancelButton_2Pushed(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.EditaStagePanel.Visible = 'off';
            app.ExperimentStagingConfigurationPanel.Visible = 'on';
            
        end

        % Button pushed function: RemoveaStageButton
        function RemoveaStageButtonPushed(app, event)
            % Clear the Items and ItemsData cell arrays before they are rebuilt with the newest values
            app.StageNumberDropDown_3.Items = {'1'};
            app.StageNumberDropDown_3.ItemsData = {1};
            
            for StageNumber = 1:(app.stageController.NumberOfStages)
                app.StageNumberDropDown_3.Items{StageNumber} = int2str(StageNumber);
                app.StageNumberDropDown_3.ItemsData{StageNumber} = StageNumber;
                
            end
            
            app.StageNumberDropDown_3.Value = StageNumber;
            
            % Convert units from Celsius to Kelvin if necessary
            switch app.TemperatureUnits
                case 'Celsius'
                    StartTemp = app.stageController.getStartTemp(StageNumber);
                    EndTemp = app.stageController.getEndTemp(StageNumber);
                    
                case 'Kelvin'
                    StartTemp = cel2kel(app.stageController.getStartTemp(StageNumber));
                    EndTemp = cel2kel(app.stageController.getEndTemp(StageNumber));
                    
            end
            
            % Update the values displayed in the "Remove a Stage" panel
            app.StartTempEditField_3.Value = StartTemp;
            app.RampUpRateCminEditField_3.Value = app.stageController.getRampUpRate(StageNumber);
            app.EndTempEditField_3.Value = EndTemp;
            app.HoldTimeEditField_3.Value = app.stageController.getHoldTime(StageNumber);
            
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.ExperimentStagingConfigurationPanel.Visible = 'off';
            app.RemoveaStagePanel.Visible = 'on';
            
        end

        % Value changed function: StageNumberDropDown_3
        function StageNumberDropDown_3ValueChanged(app, event)
            StageNumber = app.StageNumberDropDown_3.Value;
            
            % Convert units from Celsius to Kelvin if necessary
            switch app.TemperatureUnits
                case 'Celsius'
                    StartTemp = app.stageController.getStartTemp(StageNumber);
                    EndTemp = app.stageController.getEndTemp(StageNumber);
                    
                case 'Kelvin'
                    StartTemp = cel2kel(app.stageController.getStartTemp(StageNumber));
                    EndTemp = cel2kel(app.stageController.getEndTemp(StageNumber));
                    
            end
            
            % Update the values displayed in the "Remove a Stage" panel
            app.StartTempEditField_3.Value = StartTemp;
            app.RampUpRateCminEditField_3.Value = app.stageController.getRampUpRate(StageNumber);
            app.EndTempEditField_3.Value = EndTemp;
            app.HoldTimeEditField_3.Value = app.stageController.getHoldTime(StageNumber);
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
        end

        % Button pushed function: RemoveStageButton
        function RemoveStageButtonPushed(app, event)
            StageNumber = app.StageNumberDropDown_3.Value;
            
            % Have the specified stage removed from the table
            app.stageController.removeStage(StageNumber);
            
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.RemoveaStagePanel.Visible = 'off';
            app.ExperimentStagingConfigurationPanel.Visible = 'on';
            
        end

        % Button pushed function: CancelButton_3
        function CancelButton_3Pushed(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.RemoveaStagePanel.Visible = 'off';
            app.ExperimentStagingConfigurationPanel.Visible = 'on';
            
        end

        % Selection change function: TabGroup
        function TabGroupSelectionChanged(app, event)
            switch app.TabGroup.SelectedTab
                case app.OperationTab
                    app.refreshOperationUI();
                    
                case app.AnalysisTab
                    app.refreshAnalysisUI();
                    
                case app.MaintenanceTab
                    % Prevent the user from opening the Maintenance Tab if the experiment is currently running
                    if app.stageController.ExperimentInProgress
                        warndlg('The configuration parameters on the Maintenance Tab cannot be edited while an experiment is running')
                        app.TabGroup.SelectedTab = app.OperationTab;
                        
                    else
                        app.refreshMaintenanceUI();
                        
                    end
                    
            end
            
        end

        % Button pushed function: SkipCurrentStageButton
        function SkipCurrentStageButtonPushed(app, event)
            app.StopExperimentButton.Enable = 'off';
            app.SkipCurrentStageButton.Enable = 'off';
            drawnow nocallbacks
            
            app.skipCurrentStage();
            
            app.refreshOperationUI();
            
            drawnow
            
        end

        % Value changed function: CalibrationActualTempEditField
        function CalibrationActualTempEditFieldValueChanged(app, event)
            app.Calibration_Actual = app.CalibrationActualTempEditField.Value;
            
            app.ActualTempOffsetEditField.Value = app.Calibration_Actual - app.Calibration_Measured;
            
            app.refreshMaintenanceUI();
            
        end

        % Button pushed function: AddtoCalibrationDataButton
        function AddtoCalibrationDataButtonPushed(app, event)
            app.CalibrationData_Measured(end + 1) = app.Calibration_Measured;
            app.CalibrationData_Actual(end + 1) = app.Calibration_Actual;
            app.CalibrationData_Offset(end + 1) = app.Calibration_Offset;
            
            app.CalibrationData = [app.CalibrationData_Measured', app.CalibrationData_Actual', app.CalibrationData_Offset'];
            
            app.CalibrationDataUITable.Data = app.CalibrationData;
            
            app.refreshMaintenanceUI();
            
        end

        % Button pushed function: RemoveLatestEntryButton
        function RemoveLatestEntryButtonPushed(app, event)
            if ~isempty(app.CalibrationData_Measured)
                app.CalibrationData_Measured(end) = [];
            end
            
            if ~isempty(app.CalibrationData_Actual)
                app.CalibrationData_Actual(end) = [];
            end
            
            if ~isempty(app.CalibrationData_Offset)
                app.CalibrationData_Offset(end) = [];
            end
            
            app.CalibrationData = [app.CalibrationData_Measured', app.CalibrationData_Actual', app.CalibrationData_Offset'];
            
            app.CalibrationDataUITable.Data = app.CalibrationData;
            
            app.refreshMaintenanceUI();
            
        end

        % Button pushed function: ClearCalibrationDataButton
        function ClearCalibrationDataButtonPushed(app, event)
            app.CalibrationData_Measured = [];
            app.CalibrationData_Actual = [];
            app.CalibrationData_Offset = [];
            
            app.CalibrationData = [];
            
            app.CalibrationDataUITable.Data = app.CalibrationData;
            
            app.refreshMaintenanceUI();
            
        end

        % Button pushed function: SaveCalibrationOffsetButton
        function SaveCalibrationOffsetButtonPushed(app, event)
            switch app.SelectSensortoCalibrateButtonGroup.SelectedObject
                case app.TemperatureReferenceSampleButton
                    app.daqBox.TempCalibrationOffset_Ref = app.CalibrationOffsetEditField.Value;
                    
                case app.TemperatureTestSampleButton
                    app.daqBox.TempCalibrationOffset_Samp = app.CalibrationOffsetEditField.Value;
                    
                case app.CurrentReferenceSampleButton
                    app.daqBox.CurrentCalibrationOffset_Ref = app.CalibrationOffsetEditField.Value;
                    
                case app.CurrentTestSampleButton
                    app.daqBox.CurrentCalibrationOffset_Samp = app.CalibrationOffsetEditField.Value;
                    
            end
            
            app.refreshMaintenanceUI();
            
        end

        % Value changed function: KpproportionalgainSpinner
        function KpproportionalgainSpinnerValueChanged(app, event)
            app.daqBox.PID_Kp = app.KpproportionalgainSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: KiintegralgainSpinner
        function KiintegralgainSpinnerValueChanged(app, event)
            app.daqBox.PID_Ki = app.KiintegralgainSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: KdderivativegainSpinner
        function KdderivativegainSpinnerValueChanged(app, event)
            app.daqBox.PID_Kd = app.KdderivativegainSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Button pushed function: LoadStagingFileButton
        function LoadStagingFileButtonPushed(app, event)
            app.stageController.loadStagingFile('user select');
            
            app.refreshOperationUI();
            
            app.refreshStagingTable();
            
        end

        % Button pushed function: SaveStagingFileButton
        function SaveStagingFileButtonPushed(app, event)
            app.SaveStagingFileButton.Text = 'Saving Staging . . .';
            
            app.StagingSaveStatus = app.stageController.saveStagingFile();
            
            app.refreshOperationUI();
            
            if app.StagingSaveStatus
                app.SaveStagingFileButton.Text = 'Staging Saved';
                pause(1)
                app.SaveStagingFileButton.Text = 'Save Staging File';
                
            else
                app.SaveStagingFileButton.Text = 'Save Staging File';
                
            end
            
        end

        % Button pushed function: SaveAnalysisDataToExcelFileButton
        function SaveAnalysisDataToExcelFileButtonPushed(app, event)
            app.SaveAnalysisDataToExcelFileButton.Text = 'Saving Data . . .';
            
            app.AnalysisDataSaveStatus = app.analysisData.saveXlsxFile();
            
            app.refreshOperationUI(); % Update the UI with the new values
            
            if app.AnalysisDataSaveStatus
                app.SaveAnalysisDataToExcelFileButton.Text = 'Data Saved';
                pause(1)
                app.SaveAnalysisDataToExcelFileButton.Text = 'Save Data To Excel File';
                
            else
                app.SaveAnalysisDataToExcelFileButton.Text = 'Save Data To Excel File';
                
            end
            
        end

        % Selection changed function: 
        % SelectSensortoCalibrateButtonGroup
        function SelectSensortoCalibrateButtonGroupSelectionChanged(app, event)
            if app.CalibrationSelectionChanged
                if ~isempty(app.CalibrationData)
                    answer = questdlg(sprintf(['WARNING: Changing the sensor selection will clear the calibration data table.\n'...
                        'However, any previously calculated calibration offset will still be saved.\n'...
                        'Are you sure you want to proceed?']));
                    
                    switch answer
                        case 'Yes'
                            app.CalibrationData_Measured = [];
                            app.CalibrationData_Actual = [];
                            app.CalibrationData_Offset = [];
                            app.CalibrationData = [];
                            
                            app.daqBox.ConfigSaveStatus = false;
                            app.SystemConfigStatus = false;
                            
                            app.refreshMaintenanceUI();
                            app.refreshOperationUI();
                            
                            app.CalibrationSelectionChanged = true;
                            
                        otherwise
                            app.SelectSensortoCalibrateButtonGroup.SelectedObject = app.PreviousCalibrationSelection;
                            
                            app.CalibrationSelectionChanged = false;
                    end
                    
                else
                    app.CalibrationData_Measured = [];
                    app.CalibrationData_Actual = [];
                    app.CalibrationData_Offset = [];
                    app.CalibrationData = [];
                    
                    %app.daqBox.ConfigSaveStatus = false;
                    %app.SystemConfigStatus = false;
                    
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
                    
                    app.CalibrationSelectionChanged = true;
                    
                end
            else
                app.CalibrationSelectionChanged = true;
                
            end
            
            app.PreviousCalibrationSelection = app.SelectSensortoCalibrateButtonGroup.SelectedObject;
        end

        % Close request function: UIFigure
        function UIFigureCloseRequest(app, event)
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                try app.SetupSemaphore.release(); catch, end
            end
            
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                try app.ExperimentSemaphore.release(); catch, end
            end
            
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                try app.SkipStageSemaphore.release(); catch, end
            end
            
            if ~isempty(app.SetupSemaphore) && isvalid(app.SetupSemaphore)
                try app.StopExperimentSemaphore.release(); catch, end
            end
            
            app.stopExperiment();
            
            % Stop the PWM outputs before closing the app
            app.stopPWM();
            
            app.StopExperimentButton.Enable = 'off';
            
            if app.DataSaveStatus
                SaveCheck = 'No';
            else
                SaveCheck = questdlg(sprintf('WARNING: All unsaved data will be lost\nWould you like to save the current data before closing?'));
            end
            
            switch SaveCheck
                case 'Yes'
                    % Attempt to save the data
                    app.DataSaveStatus = app.liveData.saveDataFile();
                    
                    if app.DataSaveStatus
                        %continue
                    else
                        return
                    end
                    
                case 'No'
                    %continue
                    
                otherwise
                    return
            end
            
            try delete(app.daqBox); catch, end
            try delete(app.stageController); catch, end
            delete(app)
            
        end

        % Cell selection callback: TempControlStagingUITable
        function TempControlStagingUITableCellSelection(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
        end

        % Cell selection callback: CalibrationDataUITable
        function CalibrationDataUITableCellSelection(app, event)
            % Refresh the maintenance tab
            app.refreshMaintenanceUI();
            
        end

        % Value changed function: ReferenceSpecificHeatJgKSpinner
        function ReferenceSpecificHeatJgKSpinnerValueChanged(app, event)
            app.analysisData.ReferenceSampleData.SpecificHeat = app.ReferenceSpecificHeatJgKSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Button pushed function: ImportDataFromExcelFileButton
        function ImportDataFromExcelFileButtonPushed(app, event)
            app.DataLoadingTextArea.Visible = 'on';
            
            app.analysisData = DSCData();
            
            app.analysisData.loadXlsxFile();
            
            app.refreshAnalysisUI()
            
            app.DataLoadingTextArea.Visible = 'off';
            
        end

        % Button pushed function: SaveAnalysisDataToMATFileButton
        function SaveAnalysisDataToMATFileButtonPushed(app, event)
            app.SaveAnalysisDataToMATFileButton.Text = 'Saving Data . . .';
            
            app.AnalysisDataSaveStatus = app.analysisData.saveMATFile();
            
            app.refreshOperationUI(); % Update the UI with the new values
            
            if app.AnalysisDataSaveStatus
                app.SaveAnalysisDataToMATFileButton.Text = 'Data Saved';
                pause(1)
                app.SaveAnalysisDataToMATFileButton.Text = 'Save Data To MAT File';
                
            else
                app.SaveAnalysisDataToMATFileButton.Text = 'Save Data To MAT File';
                
            end
            
        end

        % Button pushed function: AutoCalibrateButton
        function AutoCalibrateButtonPushed(app, event)
            app.AutoCalibrateButton.Enable = 'off';
            
            f = waitbar(0, 'Auto calibrating. Please wait...');
            
            for n = 1:100
                app.TakeMeasurementButtonPushed();
                app.AddtoCalibrationDataButtonPushed();
                pause(0.1)
                try
                    waitbar(n/100, f, 'Auto calibrating. Please wait...');
                catch
                    break
                end
            end
            
            % Attempt to close the waitbar
            try close(f); catch, end
            
            app.AutoCalibrateButton.Enable = 'on';
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [10 10 1260 640];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {352, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.BackgroundColor = [0.502 0.502 0.502];
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;
            app.LeftPanel.Scrollable = 'on';

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.LeftPanel);
            app.GridLayout2.ColumnWidth = {140, 160, '1x'};
            app.GridLayout2.RowHeight = {30, 30, 30, 96, 60, 30, 60, 120, 120};
            app.GridLayout2.RowSpacing = 6;
            app.GridLayout2.Padding = [10 6 10 6];

            % Create ClearDataButton
            app.ClearDataButton = uibutton(app.GridLayout2, 'push');
            app.ClearDataButton.ButtonPushedFcn = createCallbackFcn(app, @ClearDataButtonPushed, true);
            app.ClearDataButton.BackgroundColor = [1 1 0];
            app.ClearDataButton.Layout.Row = 3;
            app.ClearDataButton.Layout.Column = 1;
            app.ClearDataButton.Text = 'Clear Data';

            % Create SaveDataToFileButton
            app.SaveDataToFileButton = uibutton(app.GridLayout2, 'push');
            app.SaveDataToFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveDataToFileButtonPushed, true);
            app.SaveDataToFileButton.BackgroundColor = [0 1 1];
            app.SaveDataToFileButton.Layout.Row = 2;
            app.SaveDataToFileButton.Layout.Column = 1;
            app.SaveDataToFileButton.Text = 'Save Data To File';

            % Create StartExperimentButton
            app.StartExperimentButton = uibutton(app.GridLayout2, 'push');
            app.StartExperimentButton.ButtonPushedFcn = createCallbackFcn(app, @StartExperimentButtonPushed, true);
            app.StartExperimentButton.BackgroundColor = [0 1 0];
            app.StartExperimentButton.Enable = 'off';
            app.StartExperimentButton.Layout.Row = 1;
            app.StartExperimentButton.Layout.Column = [2 3];
            app.StartExperimentButton.Text = 'Start Experiment';

            % Create StopExperimentButton
            app.StopExperimentButton = uibutton(app.GridLayout2, 'push');
            app.StopExperimentButton.ButtonPushedFcn = createCallbackFcn(app, @StopExperimentButtonPushed, true);
            app.StopExperimentButton.BackgroundColor = [1 0 0];
            app.StopExperimentButton.Enable = 'off';
            app.StopExperimentButton.Layout.Row = 3;
            app.StopExperimentButton.Layout.Column = [2 3];
            app.StopExperimentButton.Text = 'Stop Experiment';

            % Create InitializeDAQBoxButton
            app.InitializeDAQBoxButton = uibutton(app.GridLayout2, 'push');
            app.InitializeDAQBoxButton.ButtonPushedFcn = createCallbackFcn(app, @StartDAQSessionsButtonPushed, true);
            app.InitializeDAQBoxButton.Enable = 'off';
            app.InitializeDAQBoxButton.Layout.Row = 1;
            app.InitializeDAQBoxButton.Layout.Column = 1;
            app.InitializeDAQBoxButton.Text = 'Initialize DAQ Box';

            % Create SkipCurrentStageButton
            app.SkipCurrentStageButton = uibutton(app.GridLayout2, 'push');
            app.SkipCurrentStageButton.ButtonPushedFcn = createCallbackFcn(app, @SkipCurrentStageButtonPushed, true);
            app.SkipCurrentStageButton.BackgroundColor = [0.9294 0.6902 0.1294];
            app.SkipCurrentStageButton.Enable = 'off';
            app.SkipCurrentStageButton.Layout.Row = 2;
            app.SkipCurrentStageButton.Layout.Column = [2 3];
            app.SkipCurrentStageButton.Text = 'Skip Current Stage';

            % Create ReferenceSampleLiveDataPanel
            app.ReferenceSampleLiveDataPanel = uipanel(app.GridLayout2);
            app.ReferenceSampleLiveDataPanel.Title = 'Reference Sample Live Data';
            app.ReferenceSampleLiveDataPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ReferenceSampleLiveDataPanel.Layout.Row = 4;
            app.ReferenceSampleLiveDataPanel.Layout.Column = [2 3];
            app.ReferenceSampleLiveDataPanel.FontWeight = 'bold';

            % Create GridLayout22
            app.GridLayout22 = uigridlayout(app.ReferenceSampleLiveDataPanel);
            app.GridLayout22.ColumnWidth = {60, '1x'};
            app.GridLayout22.RowHeight = {22, 22};
            app.GridLayout22.ColumnSpacing = 6;
            app.GridLayout22.Padding = [6 10 6 10];

            % Create ReferenceCurrentEditField
            app.ReferenceCurrentEditField = uieditfield(app.GridLayout22, 'numeric');
            app.ReferenceCurrentEditField.ValueDisplayFormat = '%.3f';
            app.ReferenceCurrentEditField.Editable = 'off';
            app.ReferenceCurrentEditField.Layout.Row = 1;
            app.ReferenceCurrentEditField.Layout.Column = 1;

            % Create ReferenceTemperatureEditField
            app.ReferenceTemperatureEditField = uieditfield(app.GridLayout22, 'numeric');
            app.ReferenceTemperatureEditField.ValueDisplayFormat = '%.2f';
            app.ReferenceTemperatureEditField.Editable = 'off';
            app.ReferenceTemperatureEditField.Layout.Row = 2;
            app.ReferenceTemperatureEditField.Layout.Column = 1;

            % Create ReferenceCurrentGaugeLabel
            app.ReferenceCurrentGaugeLabel = uilabel(app.GridLayout22);
            app.ReferenceCurrentGaugeLabel.Layout.Row = 1;
            app.ReferenceCurrentGaugeLabel.Layout.Column = 2;
            app.ReferenceCurrentGaugeLabel.Text = 'Current (A)';

            % Create ReferenceTemperatureGaugeLabel
            app.ReferenceTemperatureGaugeLabel = uilabel(app.GridLayout22);
            app.ReferenceTemperatureGaugeLabel.Layout.Row = 2;
            app.ReferenceTemperatureGaugeLabel.Layout.Column = 2;
            app.ReferenceTemperatureGaugeLabel.Text = 'Temperature (C)';

            % Create TestSampleLiveDataPanel
            app.TestSampleLiveDataPanel = uipanel(app.GridLayout2);
            app.TestSampleLiveDataPanel.Title = 'Test Sample Live Data';
            app.TestSampleLiveDataPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TestSampleLiveDataPanel.Layout.Row = [5 6];
            app.TestSampleLiveDataPanel.Layout.Column = [2 3];
            app.TestSampleLiveDataPanel.FontWeight = 'bold';

            % Create GridLayout23
            app.GridLayout23 = uigridlayout(app.TestSampleLiveDataPanel);
            app.GridLayout23.ColumnWidth = {60, '1x'};
            app.GridLayout23.RowHeight = {22, 22};
            app.GridLayout23.ColumnSpacing = 6;
            app.GridLayout23.Padding = [6 10 6 10];

            % Create TestSampleCurrentEditField
            app.TestSampleCurrentEditField = uieditfield(app.GridLayout23, 'numeric');
            app.TestSampleCurrentEditField.ValueDisplayFormat = '%.3f';
            app.TestSampleCurrentEditField.Editable = 'off';
            app.TestSampleCurrentEditField.Layout.Row = 1;
            app.TestSampleCurrentEditField.Layout.Column = 1;

            % Create TestSampleTemperatureEditField
            app.TestSampleTemperatureEditField = uieditfield(app.GridLayout23, 'numeric');
            app.TestSampleTemperatureEditField.ValueDisplayFormat = '%.2f';
            app.TestSampleTemperatureEditField.Editable = 'off';
            app.TestSampleTemperatureEditField.Layout.Row = 2;
            app.TestSampleTemperatureEditField.Layout.Column = 1;

            % Create TestSampleCurrentGaugeLabel
            app.TestSampleCurrentGaugeLabel = uilabel(app.GridLayout23);
            app.TestSampleCurrentGaugeLabel.Layout.Row = 1;
            app.TestSampleCurrentGaugeLabel.Layout.Column = 2;
            app.TestSampleCurrentGaugeLabel.Text = 'Current (A)';

            % Create TestSampleTemperatureGaugeLabel
            app.TestSampleTemperatureGaugeLabel = uilabel(app.GridLayout23);
            app.TestSampleTemperatureGaugeLabel.Layout.Row = 2;
            app.TestSampleTemperatureGaugeLabel.Layout.Column = 2;
            app.TestSampleTemperatureGaugeLabel.Text = 'Temperature (C)';

            % Create TargetTemperatureLiveDataPanel
            app.TargetTemperatureLiveDataPanel = uipanel(app.GridLayout2);
            app.TargetTemperatureLiveDataPanel.Title = 'Target Temperature Live Data';
            app.TargetTemperatureLiveDataPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TargetTemperatureLiveDataPanel.Layout.Row = 7;
            app.TargetTemperatureLiveDataPanel.Layout.Column = [2 3];
            app.TargetTemperatureLiveDataPanel.FontWeight = 'bold';

            % Create GridLayout24
            app.GridLayout24 = uigridlayout(app.TargetTemperatureLiveDataPanel);
            app.GridLayout24.ColumnWidth = {60, '1x'};
            app.GridLayout24.RowHeight = {22};
            app.GridLayout24.ColumnSpacing = 6;
            app.GridLayout24.Padding = [6 8.5 6 8.5];

            % Create TargetTemperatureEditField
            app.TargetTemperatureEditField = uieditfield(app.GridLayout24, 'numeric');
            app.TargetTemperatureEditField.ValueDisplayFormat = '%.2f';
            app.TargetTemperatureEditField.Editable = 'off';
            app.TargetTemperatureEditField.Layout.Row = 1;
            app.TargetTemperatureEditField.Layout.Column = 1;

            % Create TargetTemperatureGaugeLabel
            app.TargetTemperatureGaugeLabel = uilabel(app.GridLayout24);
            app.TargetTemperatureGaugeLabel.Layout.Row = 1;
            app.TargetTemperatureGaugeLabel.Layout.Column = 2;
            app.TargetTemperatureGaugeLabel.Text = 'Temperature (C)';

            % Create CurrentStageClocksPanel
            app.CurrentStageClocksPanel = uipanel(app.GridLayout2);
            app.CurrentStageClocksPanel.Title = 'Current Stage Clocks';
            app.CurrentStageClocksPanel.Layout.Row = [5 7];
            app.CurrentStageClocksPanel.Layout.Column = 1;
            app.CurrentStageClocksPanel.FontWeight = 'bold';

            % Create GridLayout20
            app.GridLayout20 = uigridlayout(app.CurrentStageClocksPanel);
            app.GridLayout20.ColumnWidth = {'1x'};
            app.GridLayout20.RowHeight = {28, 22, '1x', 28, 22};
            app.GridLayout20.RowSpacing = 6;
            app.GridLayout20.Padding = [10 6 10 6];

            % Create ElapsedTimeStage0Label
            app.ElapsedTimeStage0Label = uilabel(app.GridLayout20);
            app.ElapsedTimeStage0Label.HorizontalAlignment = 'center';
            app.ElapsedTimeStage0Label.Layout.Row = 1;
            app.ElapsedTimeStage0Label.Layout.Column = 1;
            app.ElapsedTimeStage0Label.Text = {'Elapsed Time'; '(Stage 0):'; ''};

            % Create CurrentStage_ElapsedTimeEditField
            app.CurrentStage_ElapsedTimeEditField = uieditfield(app.GridLayout20, 'text');
            app.CurrentStage_ElapsedTimeEditField.Editable = 'off';
            app.CurrentStage_ElapsedTimeEditField.HorizontalAlignment = 'right';
            app.CurrentStage_ElapsedTimeEditField.Layout.Row = 2;
            app.CurrentStage_ElapsedTimeEditField.Layout.Column = 1;
            app.CurrentStage_ElapsedTimeEditField.Value = '00:00:00.000';

            % Create EstimatedTimeRemainingLabel
            app.EstimatedTimeRemainingLabel = uilabel(app.GridLayout20);
            app.EstimatedTimeRemainingLabel.HorizontalAlignment = 'center';
            app.EstimatedTimeRemainingLabel.Layout.Row = 4;
            app.EstimatedTimeRemainingLabel.Layout.Column = 1;
            app.EstimatedTimeRemainingLabel.Text = {'Estimated '; 'Time Remaining: '; ''};

            % Create CurrentStage_EstimatedTimeRemainingEditField
            app.CurrentStage_EstimatedTimeRemainingEditField = uieditfield(app.GridLayout20, 'text');
            app.CurrentStage_EstimatedTimeRemainingEditField.Editable = 'off';
            app.CurrentStage_EstimatedTimeRemainingEditField.HorizontalAlignment = 'right';
            app.CurrentStage_EstimatedTimeRemainingEditField.Layout.Row = 5;
            app.CurrentStage_EstimatedTimeRemainingEditField.Layout.Column = 1;
            app.CurrentStage_EstimatedTimeRemainingEditField.Value = '00:00:00.000';

            % Create ExperimentClockPanel
            app.ExperimentClockPanel = uipanel(app.GridLayout2);
            app.ExperimentClockPanel.Title = 'Experiment Clock';
            app.ExperimentClockPanel.Layout.Row = 4;
            app.ExperimentClockPanel.Layout.Column = 1;
            app.ExperimentClockPanel.FontWeight = 'bold';

            % Create GridLayout21
            app.GridLayout21 = uigridlayout(app.ExperimentClockPanel);
            app.GridLayout21.ColumnWidth = {'1x'};
            app.GridLayout21.RowHeight = {22, 22};

            % Create TotalTimeLabel
            app.TotalTimeLabel = uilabel(app.GridLayout21);
            app.TotalTimeLabel.HorizontalAlignment = 'center';
            app.TotalTimeLabel.Layout.Row = 1;
            app.TotalTimeLabel.Layout.Column = 1;
            app.TotalTimeLabel.Text = {'Total Time: '; ''};

            % Create ElapsedTimeEditField
            app.ElapsedTimeEditField = uieditfield(app.GridLayout21, 'text');
            app.ElapsedTimeEditField.Editable = 'off';
            app.ElapsedTimeEditField.HorizontalAlignment = 'right';
            app.ElapsedTimeEditField.Layout.Row = 2;
            app.ElapsedTimeEditField.Layout.Column = 1;
            app.ElapsedTimeEditField.Value = '00:00:00.000';

            % Create ReferenceSamplePropertiesPanel
            app.ReferenceSamplePropertiesPanel = uipanel(app.GridLayout2);
            app.ReferenceSamplePropertiesPanel.Title = 'Reference Sample Properties';
            app.ReferenceSamplePropertiesPanel.Layout.Row = 8;
            app.ReferenceSamplePropertiesPanel.Layout.Column = [1 3];
            app.ReferenceSamplePropertiesPanel.FontWeight = 'bold';

            % Create ReferenceSampleMassgramsSpinnerLabel
            app.ReferenceSampleMassgramsSpinnerLabel = uilabel(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSampleMassgramsSpinnerLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleMassgramsSpinnerLabel.Position = [11 38 190 22];
            app.ReferenceSampleMassgramsSpinnerLabel.Text = 'Reference Sample Mass (grams)';

            % Create ReferenceSampleMassgramsSpinner
            app.ReferenceSampleMassgramsSpinner = uispinner(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSampleMassgramsSpinner.Step = 0.0001;
            app.ReferenceSampleMassgramsSpinner.Limits = [0 Inf];
            app.ReferenceSampleMassgramsSpinner.ValueDisplayFormat = '%.4f';
            app.ReferenceSampleMassgramsSpinner.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleMassgramsSpinnerValueChanged, true);
            app.ReferenceSampleMassgramsSpinner.Position = [211 38 90 22];
            app.ReferenceSampleMassgramsSpinner.Value = 1;

            % Create ReferenceSpecificHeatJgKSpinner_2Label
            app.ReferenceSpecificHeatJgKSpinner_2Label = uilabel(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSpecificHeatJgKSpinner_2Label.HorizontalAlignment = 'right';
            app.ReferenceSpecificHeatJgKSpinner_2Label.Position = [18 8 183 22];
            app.ReferenceSpecificHeatJgKSpinner_2Label.Text = 'Reference Specific Heat (J/(g*K))';

            % Create ReferenceSpecificHeatJgKSpinner
            app.ReferenceSpecificHeatJgKSpinner = uispinner(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSpecificHeatJgKSpinner.Step = 0.0001;
            app.ReferenceSpecificHeatJgKSpinner.Limits = [0 Inf];
            app.ReferenceSpecificHeatJgKSpinner.ValueDisplayFormat = '%.4f';
            app.ReferenceSpecificHeatJgKSpinner.ValueChangedFcn = createCallbackFcn(app, @ReferenceSpecificHeatJgKSpinnerValueChanged, true);
            app.ReferenceSpecificHeatJgKSpinner.Enable = 'off';
            app.ReferenceSpecificHeatJgKSpinner.Position = [211 8 90 22];
            app.ReferenceSpecificHeatJgKSpinner.Value = 1;

            % Create ReferenceSampleMaterialEditFieldLabel
            app.ReferenceSampleMaterialEditFieldLabel = uilabel(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSampleMaterialEditFieldLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleMaterialEditFieldLabel.Position = [11 68 110 22];
            app.ReferenceSampleMaterialEditFieldLabel.Text = 'Sample Material';

            % Create ReferenceSampleMaterialEditField
            app.ReferenceSampleMaterialEditField = uieditfield(app.ReferenceSamplePropertiesPanel, 'text');
            app.ReferenceSampleMaterialEditField.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleMaterialEditFieldValueChanged, true);
            app.ReferenceSampleMaterialEditField.Position = [126 68 175 22];
            app.ReferenceSampleMaterialEditField.Value = 'Unknown';

            % Create TestSamplePropertiesPanel
            app.TestSamplePropertiesPanel = uipanel(app.GridLayout2);
            app.TestSamplePropertiesPanel.Title = 'Test Sample Properties';
            app.TestSamplePropertiesPanel.Layout.Row = 9;
            app.TestSamplePropertiesPanel.Layout.Column = [1 3];
            app.TestSamplePropertiesPanel.FontWeight = 'bold';

            % Create TestSampleMassgramsSpinnerLabel
            app.TestSampleMassgramsSpinnerLabel = uilabel(app.TestSamplePropertiesPanel);
            app.TestSampleMassgramsSpinnerLabel.HorizontalAlignment = 'right';
            app.TestSampleMassgramsSpinnerLabel.Position = [11 38 180 22];
            app.TestSampleMassgramsSpinnerLabel.Text = 'Test Sample Mass (grams)';

            % Create TestSampleMassgramsSpinner
            app.TestSampleMassgramsSpinner = uispinner(app.TestSamplePropertiesPanel);
            app.TestSampleMassgramsSpinner.Step = 0.0001;
            app.TestSampleMassgramsSpinner.Limits = [0 Inf];
            app.TestSampleMassgramsSpinner.ValueDisplayFormat = '%.4f';
            app.TestSampleMassgramsSpinner.ValueChangedFcn = createCallbackFcn(app, @TestSampleMassgramsSpinnerValueChanged, true);
            app.TestSampleMassgramsSpinner.Position = [201 38 90 22];
            app.TestSampleMassgramsSpinner.Value = 1;

            % Create TestSampleMaterialEditFieldLabel
            app.TestSampleMaterialEditFieldLabel = uilabel(app.TestSamplePropertiesPanel);
            app.TestSampleMaterialEditFieldLabel.HorizontalAlignment = 'right';
            app.TestSampleMaterialEditFieldLabel.Position = [11 68 100 22];
            app.TestSampleMaterialEditFieldLabel.Text = 'Sample Material';

            % Create TestSampleMaterialEditField
            app.TestSampleMaterialEditField = uieditfield(app.TestSamplePropertiesPanel, 'text');
            app.TestSampleMaterialEditField.ValueChangedFcn = createCallbackFcn(app, @TestSampleMaterialEditFieldValueChanged, true);
            app.TestSampleMaterialEditField.Position = [116 68 175 22];
            app.TestSampleMaterialEditField.Value = 'Unknown';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create GridLayout18
            app.GridLayout18 = uigridlayout(app.RightPanel);
            app.GridLayout18.ColumnWidth = {'1x'};
            app.GridLayout18.RowHeight = {'1x'};
            app.GridLayout18.Padding = [0 0 0 0];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout18);
            app.TabGroup.SelectionChangedFcn = createCallbackFcn(app, @TabGroupSelectionChanged, true);
            app.TabGroup.Layout.Row = 1;
            app.TabGroup.Layout.Column = 1;

            % Create OperationTab
            app.OperationTab = uitab(app.TabGroup);
            app.OperationTab.Title = 'Operation';
            app.OperationTab.BackgroundColor = [0.502 0.502 0.502];

            % Create GridLayout3
            app.GridLayout3 = uigridlayout(app.OperationTab);
            app.GridLayout3.ColumnWidth = {420, 60, 60, '1x'};
            app.GridLayout3.RowHeight = {30, 30, 60, 60, '1x'};
            app.GridLayout3.RowSpacing = 6;
            app.GridLayout3.Padding = [10 6 10 6];

            % Create UIAxesSamples
            app.UIAxesSamples = uiaxes(app.GridLayout3);
            title(app.UIAxesSamples, 'Sample Heat Flow vs. Time')
            xlabel(app.UIAxesSamples, 'Time (sec)')
            ylabel(app.UIAxesSamples, 'Heat Flow (W/g)')
            app.UIAxesSamples.PlotBoxAspectRatio = [2.02185792349727 1 1];
            app.UIAxesSamples.Box = 'on';
            app.UIAxesSamples.XGrid = 'on';
            app.UIAxesSamples.YGrid = 'on';
            app.UIAxesSamples.Layout.Row = [1 4];
            app.UIAxesSamples.Layout.Column = 4;

            % Create UIAxesDifferential
            app.UIAxesDifferential = uiaxes(app.GridLayout3);
            title(app.UIAxesDifferential, 'Differential Heat Flow vs. Time')
            xlabel(app.UIAxesDifferential, 'Time (sec)')
            ylabel(app.UIAxesDifferential, '\Delta Heat Flow (W/g)')
            app.UIAxesDifferential.YLim = [-1000000000 1000000000];
            app.UIAxesDifferential.Box = 'on';
            app.UIAxesDifferential.XGrid = 'on';
            app.UIAxesDifferential.YGrid = 'on';
            app.UIAxesDifferential.Layout.Row = 5;
            app.UIAxesDifferential.Layout.Column = [1 4];

            % Create ExperimentStagingConfigurationPanel
            app.ExperimentStagingConfigurationPanel = uipanel(app.GridLayout3);
            app.ExperimentStagingConfigurationPanel.Title = 'Experiment Staging Configuration';
            app.ExperimentStagingConfigurationPanel.Layout.Row = [1 4];
            app.ExperimentStagingConfigurationPanel.Layout.Column = 1;
            app.ExperimentStagingConfigurationPanel.FontWeight = 'bold';

            % Create GridLayout13
            app.GridLayout13 = uigridlayout(app.ExperimentStagingConfigurationPanel);
            app.GridLayout13.ColumnWidth = {'2x', 100, '1x', 100, '1x', 120};
            app.GridLayout13.RowHeight = {22, 22, '1x'};
            app.GridLayout13.ColumnSpacing = 4;
            app.GridLayout13.RowSpacing = 9.75;
            app.GridLayout13.Padding = [4 9.75 4 9.75];

            % Create AddaStageButton
            app.AddaStageButton = uibutton(app.GridLayout13, 'push');
            app.AddaStageButton.ButtonPushedFcn = createCallbackFcn(app, @AddaStageButtonPushed, true);
            app.AddaStageButton.Layout.Row = 1;
            app.AddaStageButton.Layout.Column = 2;
            app.AddaStageButton.Text = 'Add a Stage';

            % Create EditaStageButton
            app.EditaStageButton = uibutton(app.GridLayout13, 'push');
            app.EditaStageButton.ButtonPushedFcn = createCallbackFcn(app, @EditaStageButtonPushed, true);
            app.EditaStageButton.Layout.Row = 1;
            app.EditaStageButton.Layout.Column = 4;
            app.EditaStageButton.Text = 'Edit a Stage';

            % Create TempControlStagingUITable
            app.TempControlStagingUITable = uitable(app.GridLayout13);
            app.TempControlStagingUITable.ColumnName = {'Stage'; 'Start T (*C)'; 'Rate (C/min)'; 'End T (*C)'; 'Hold Time (sec)'};
            app.TempControlStagingUITable.ColumnWidth = {50, 80, 85, 80, 110};
            app.TempControlStagingUITable.RowName = {};
            app.TempControlStagingUITable.CellSelectionCallback = createCallbackFcn(app, @TempControlStagingUITableCellSelection, true);
            app.TempControlStagingUITable.Layout.Row = 3;
            app.TempControlStagingUITable.Layout.Column = [1 6];

            % Create RemoveaStageButton
            app.RemoveaStageButton = uibutton(app.GridLayout13, 'push');
            app.RemoveaStageButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveaStageButtonPushed, true);
            app.RemoveaStageButton.Layout.Row = 1;
            app.RemoveaStageButton.Layout.Column = 6;
            app.RemoveaStageButton.Text = 'Remove a Stage';

            % Create CurrentStageLabel
            app.CurrentStageLabel = uilabel(app.GridLayout13);
            app.CurrentStageLabel.Layout.Row = 2;
            app.CurrentStageLabel.Layout.Column = 2;
            app.CurrentStageLabel.Text = '<< Current Stage';

            % Create CurrentStageEditField
            app.CurrentStageEditField = uieditfield(app.GridLayout13, 'numeric');
            app.CurrentStageEditField.ValueDisplayFormat = '%.0f';
            app.CurrentStageEditField.Editable = 'off';
            app.CurrentStageEditField.Layout.Row = 2;
            app.CurrentStageEditField.Layout.Column = 1;

            % Create CurrentModeLabel
            app.CurrentModeLabel = uilabel(app.GridLayout13);
            app.CurrentModeLabel.HorizontalAlignment = 'right';
            app.CurrentModeLabel.Layout.Row = 2;
            app.CurrentModeLabel.Layout.Column = [3 4];
            app.CurrentModeLabel.Text = 'Current Mode >>';

            % Create CurrentModeEditField
            app.CurrentModeEditField = uieditfield(app.GridLayout13, 'text');
            app.CurrentModeEditField.Editable = 'off';
            app.CurrentModeEditField.Layout.Row = 2;
            app.CurrentModeEditField.Layout.Column = [5 6];
            app.CurrentModeEditField.Value = 'Off';

            % Create XAxisDataPanel
            app.XAxisDataPanel = uipanel(app.GridLayout3);
            app.XAxisDataPanel.Title = 'X-Axis Data';
            app.XAxisDataPanel.Layout.Row = 4;
            app.XAxisDataPanel.Layout.Column = [2 3];
            app.XAxisDataPanel.FontWeight = 'bold';

            % Create GridLayout14
            app.GridLayout14 = uigridlayout(app.XAxisDataPanel);
            app.GridLayout14.ColumnWidth = {'1x'};
            app.GridLayout14.RowHeight = {22};

            % Create XAxisDataSwitch
            app.XAxisDataSwitch = uiswitch(app.GridLayout14, 'slider');
            app.XAxisDataSwitch.Items = {'Time', 'Temp'};
            app.XAxisDataSwitch.ValueChangedFcn = createCallbackFcn(app, @XAxisDataSwitchValueChanged, true);
            app.XAxisDataSwitch.Layout.Row = 1;
            app.XAxisDataSwitch.Layout.Column = 1;
            app.XAxisDataSwitch.Value = 'Temp';

            % Create LoadStagingFileButton
            app.LoadStagingFileButton = uibutton(app.GridLayout3, 'push');
            app.LoadStagingFileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadStagingFileButtonPushed, true);
            app.LoadStagingFileButton.BackgroundColor = [0.302 0.749 0.9294];
            app.LoadStagingFileButton.Layout.Row = 1;
            app.LoadStagingFileButton.Layout.Column = [2 3];
            app.LoadStagingFileButton.Text = 'Load Staging File';

            % Create SaveStagingFileButton
            app.SaveStagingFileButton = uibutton(app.GridLayout3, 'push');
            app.SaveStagingFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveStagingFileButtonPushed, true);
            app.SaveStagingFileButton.BackgroundColor = [0 1 1];
            app.SaveStagingFileButton.Layout.Row = 2;
            app.SaveStagingFileButton.Layout.Column = [2 3];
            app.SaveStagingFileButton.Text = 'Save Staging File';

            % Create AddaStagePanel
            app.AddaStagePanel = uipanel(app.GridLayout3);
            app.AddaStagePanel.Title = 'Add a Stage';
            app.AddaStagePanel.Visible = 'off';
            app.AddaStagePanel.Layout.Row = [1 4];
            app.AddaStagePanel.Layout.Column = 1;

            % Create GridLayout15
            app.GridLayout15 = uigridlayout(app.AddaStagePanel);
            app.GridLayout15.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x'};

            % Create StageNumberDropDownLabel
            app.StageNumberDropDownLabel = uilabel(app.GridLayout15);
            app.StageNumberDropDownLabel.HorizontalAlignment = 'right';
            app.StageNumberDropDownLabel.Layout.Row = 1;
            app.StageNumberDropDownLabel.Layout.Column = 1;
            app.StageNumberDropDownLabel.Text = 'Stage Number';

            % Create StageNumberDropDown
            app.StageNumberDropDown = uidropdown(app.GridLayout15);
            app.StageNumberDropDown.Items = {'1'};
            app.StageNumberDropDown.Layout.Row = 1;
            app.StageNumberDropDown.Layout.Column = 2;
            app.StageNumberDropDown.Value = '1';

            % Create StartTempEditFieldLabel
            app.StartTempEditFieldLabel = uilabel(app.GridLayout15);
            app.StartTempEditFieldLabel.HorizontalAlignment = 'right';
            app.StartTempEditFieldLabel.Layout.Row = 2;
            app.StartTempEditFieldLabel.Layout.Column = 1;
            app.StartTempEditFieldLabel.Text = 'Start Temp (*C)';

            % Create StartTempEditField
            app.StartTempEditField = uieditfield(app.GridLayout15, 'numeric');
            app.StartTempEditField.Layout.Row = 2;
            app.StartTempEditField.Layout.Column = 2;

            % Create RampUpRateCminEditFieldLabel
            app.RampUpRateCminEditFieldLabel = uilabel(app.GridLayout15);
            app.RampUpRateCminEditFieldLabel.HorizontalAlignment = 'right';
            app.RampUpRateCminEditFieldLabel.Layout.Row = 3;
            app.RampUpRateCminEditFieldLabel.Layout.Column = 1;
            app.RampUpRateCminEditFieldLabel.Text = 'Ramp Up Rate (C/min)';

            % Create RampUpRateCminEditField
            app.RampUpRateCminEditField = uieditfield(app.GridLayout15, 'numeric');
            app.RampUpRateCminEditField.Layout.Row = 3;
            app.RampUpRateCminEditField.Layout.Column = 2;

            % Create EndTempEditFieldLabel
            app.EndTempEditFieldLabel = uilabel(app.GridLayout15);
            app.EndTempEditFieldLabel.HorizontalAlignment = 'right';
            app.EndTempEditFieldLabel.Layout.Row = 4;
            app.EndTempEditFieldLabel.Layout.Column = 1;
            app.EndTempEditFieldLabel.Text = 'End Temp (*C)';

            % Create EndTempEditField
            app.EndTempEditField = uieditfield(app.GridLayout15, 'numeric');
            app.EndTempEditField.Layout.Row = 4;
            app.EndTempEditField.Layout.Column = 2;

            % Create HoldTimeEditFieldLabel
            app.HoldTimeEditFieldLabel = uilabel(app.GridLayout15);
            app.HoldTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.HoldTimeEditFieldLabel.Layout.Row = 5;
            app.HoldTimeEditFieldLabel.Layout.Column = 1;
            app.HoldTimeEditFieldLabel.Text = 'Hold Time (sec)';

            % Create HoldTimeEditField
            app.HoldTimeEditField = uieditfield(app.GridLayout15, 'numeric');
            app.HoldTimeEditField.Layout.Row = 5;
            app.HoldTimeEditField.Layout.Column = 2;

            % Create AddStageButton
            app.AddStageButton = uibutton(app.GridLayout15, 'push');
            app.AddStageButton.ButtonPushedFcn = createCallbackFcn(app, @AddStageButtonPushed, true);
            app.AddStageButton.Layout.Row = 6;
            app.AddStageButton.Layout.Column = 1;
            app.AddStageButton.Text = 'Add Stage';

            % Create CancelButton
            app.CancelButton = uibutton(app.GridLayout15, 'push');
            app.CancelButton.ButtonPushedFcn = createCallbackFcn(app, @CancelButtonPushed, true);
            app.CancelButton.Layout.Row = 6;
            app.CancelButton.Layout.Column = 2;
            app.CancelButton.Text = 'Cancel';

            % Create EditaStagePanel
            app.EditaStagePanel = uipanel(app.GridLayout3);
            app.EditaStagePanel.Title = 'Edit a Stage';
            app.EditaStagePanel.Visible = 'off';
            app.EditaStagePanel.Layout.Row = [1 4];
            app.EditaStagePanel.Layout.Column = 1;

            % Create GridLayout16
            app.GridLayout16 = uigridlayout(app.EditaStagePanel);
            app.GridLayout16.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x'};

            % Create StageNumberDropDown_2Label
            app.StageNumberDropDown_2Label = uilabel(app.GridLayout16);
            app.StageNumberDropDown_2Label.HorizontalAlignment = 'right';
            app.StageNumberDropDown_2Label.Layout.Row = 1;
            app.StageNumberDropDown_2Label.Layout.Column = 1;
            app.StageNumberDropDown_2Label.Text = 'Stage Number';

            % Create StageNumberDropDown_2
            app.StageNumberDropDown_2 = uidropdown(app.GridLayout16);
            app.StageNumberDropDown_2.Items = {'1'};
            app.StageNumberDropDown_2.ValueChangedFcn = createCallbackFcn(app, @StageNumberDropDown_2ValueChanged, true);
            app.StageNumberDropDown_2.Layout.Row = 1;
            app.StageNumberDropDown_2.Layout.Column = 2;
            app.StageNumberDropDown_2.Value = '1';

            % Create StartTempEditField_2Label
            app.StartTempEditField_2Label = uilabel(app.GridLayout16);
            app.StartTempEditField_2Label.HorizontalAlignment = 'right';
            app.StartTempEditField_2Label.Layout.Row = 2;
            app.StartTempEditField_2Label.Layout.Column = 1;
            app.StartTempEditField_2Label.Text = 'Start Temp (*C)';

            % Create StartTempEditField_2
            app.StartTempEditField_2 = uieditfield(app.GridLayout16, 'numeric');
            app.StartTempEditField_2.Layout.Row = 2;
            app.StartTempEditField_2.Layout.Column = 2;

            % Create RampUpRateCminEditField_2Label
            app.RampUpRateCminEditField_2Label = uilabel(app.GridLayout16);
            app.RampUpRateCminEditField_2Label.HorizontalAlignment = 'right';
            app.RampUpRateCminEditField_2Label.Layout.Row = 3;
            app.RampUpRateCminEditField_2Label.Layout.Column = 1;
            app.RampUpRateCminEditField_2Label.Text = 'Ramp Up Rate (C/min)';

            % Create RampUpRateCminEditField_2
            app.RampUpRateCminEditField_2 = uieditfield(app.GridLayout16, 'numeric');
            app.RampUpRateCminEditField_2.Layout.Row = 3;
            app.RampUpRateCminEditField_2.Layout.Column = 2;

            % Create EndTempEditField_2Label
            app.EndTempEditField_2Label = uilabel(app.GridLayout16);
            app.EndTempEditField_2Label.HorizontalAlignment = 'right';
            app.EndTempEditField_2Label.Layout.Row = 4;
            app.EndTempEditField_2Label.Layout.Column = 1;
            app.EndTempEditField_2Label.Text = 'End Temp (*C)';

            % Create EndTempEditField_2
            app.EndTempEditField_2 = uieditfield(app.GridLayout16, 'numeric');
            app.EndTempEditField_2.Layout.Row = 4;
            app.EndTempEditField_2.Layout.Column = 2;

            % Create HoldTimeEditField_2Label
            app.HoldTimeEditField_2Label = uilabel(app.GridLayout16);
            app.HoldTimeEditField_2Label.HorizontalAlignment = 'right';
            app.HoldTimeEditField_2Label.Layout.Row = 5;
            app.HoldTimeEditField_2Label.Layout.Column = 1;
            app.HoldTimeEditField_2Label.Text = 'Hold Time (sec)';

            % Create HoldTimeEditField_2
            app.HoldTimeEditField_2 = uieditfield(app.GridLayout16, 'numeric');
            app.HoldTimeEditField_2.Layout.Row = 5;
            app.HoldTimeEditField_2.Layout.Column = 2;

            % Create ApplyChangesButton
            app.ApplyChangesButton = uibutton(app.GridLayout16, 'push');
            app.ApplyChangesButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyChangesButtonPushed, true);
            app.ApplyChangesButton.Layout.Row = 6;
            app.ApplyChangesButton.Layout.Column = 1;
            app.ApplyChangesButton.Text = 'Apply Changes';

            % Create CancelButton_2
            app.CancelButton_2 = uibutton(app.GridLayout16, 'push');
            app.CancelButton_2.ButtonPushedFcn = createCallbackFcn(app, @CancelButton_2Pushed, true);
            app.CancelButton_2.Layout.Row = 6;
            app.CancelButton_2.Layout.Column = 2;
            app.CancelButton_2.Text = 'Cancel';

            % Create RemoveaStagePanel
            app.RemoveaStagePanel = uipanel(app.GridLayout3);
            app.RemoveaStagePanel.Title = 'Remove a Stage';
            app.RemoveaStagePanel.Visible = 'off';
            app.RemoveaStagePanel.Layout.Row = [1 4];
            app.RemoveaStagePanel.Layout.Column = 1;

            % Create GridLayout17
            app.GridLayout17 = uigridlayout(app.RemoveaStagePanel);
            app.GridLayout17.RowHeight = {'1x', '1x', '1x', '1x', '1x', '1x'};

            % Create StageNumberDropDown_3Label
            app.StageNumberDropDown_3Label = uilabel(app.GridLayout17);
            app.StageNumberDropDown_3Label.HorizontalAlignment = 'right';
            app.StageNumberDropDown_3Label.Layout.Row = 1;
            app.StageNumberDropDown_3Label.Layout.Column = 1;
            app.StageNumberDropDown_3Label.Text = 'Stage Number';

            % Create StageNumberDropDown_3
            app.StageNumberDropDown_3 = uidropdown(app.GridLayout17);
            app.StageNumberDropDown_3.Items = {'1'};
            app.StageNumberDropDown_3.ValueChangedFcn = createCallbackFcn(app, @StageNumberDropDown_3ValueChanged, true);
            app.StageNumberDropDown_3.Layout.Row = 1;
            app.StageNumberDropDown_3.Layout.Column = 2;
            app.StageNumberDropDown_3.Value = '1';

            % Create StartTempEditField_3Label
            app.StartTempEditField_3Label = uilabel(app.GridLayout17);
            app.StartTempEditField_3Label.HorizontalAlignment = 'right';
            app.StartTempEditField_3Label.Layout.Row = 2;
            app.StartTempEditField_3Label.Layout.Column = 1;
            app.StartTempEditField_3Label.Text = 'Start Temp (*C)';

            % Create StartTempEditField_3
            app.StartTempEditField_3 = uieditfield(app.GridLayout17, 'numeric');
            app.StartTempEditField_3.Editable = 'off';
            app.StartTempEditField_3.Layout.Row = 2;
            app.StartTempEditField_3.Layout.Column = 2;

            % Create RampUpRateCminEditField_3Label
            app.RampUpRateCminEditField_3Label = uilabel(app.GridLayout17);
            app.RampUpRateCminEditField_3Label.HorizontalAlignment = 'right';
            app.RampUpRateCminEditField_3Label.Layout.Row = 3;
            app.RampUpRateCminEditField_3Label.Layout.Column = 1;
            app.RampUpRateCminEditField_3Label.Text = 'Ramp Up Rate (C/min)';

            % Create RampUpRateCminEditField_3
            app.RampUpRateCminEditField_3 = uieditfield(app.GridLayout17, 'numeric');
            app.RampUpRateCminEditField_3.Editable = 'off';
            app.RampUpRateCminEditField_3.Layout.Row = 3;
            app.RampUpRateCminEditField_3.Layout.Column = 2;

            % Create EndTempEditField_3Label
            app.EndTempEditField_3Label = uilabel(app.GridLayout17);
            app.EndTempEditField_3Label.HorizontalAlignment = 'right';
            app.EndTempEditField_3Label.Layout.Row = 4;
            app.EndTempEditField_3Label.Layout.Column = 1;
            app.EndTempEditField_3Label.Text = 'End Temp (*C)';

            % Create EndTempEditField_3
            app.EndTempEditField_3 = uieditfield(app.GridLayout17, 'numeric');
            app.EndTempEditField_3.Editable = 'off';
            app.EndTempEditField_3.Layout.Row = 4;
            app.EndTempEditField_3.Layout.Column = 2;

            % Create HoldTimeEditField_3Label
            app.HoldTimeEditField_3Label = uilabel(app.GridLayout17);
            app.HoldTimeEditField_3Label.HorizontalAlignment = 'right';
            app.HoldTimeEditField_3Label.Layout.Row = 5;
            app.HoldTimeEditField_3Label.Layout.Column = 1;
            app.HoldTimeEditField_3Label.Text = 'Hold Time (sec)';

            % Create HoldTimeEditField_3
            app.HoldTimeEditField_3 = uieditfield(app.GridLayout17, 'numeric');
            app.HoldTimeEditField_3.Editable = 'off';
            app.HoldTimeEditField_3.Layout.Row = 5;
            app.HoldTimeEditField_3.Layout.Column = 2;

            % Create RemoveStageButton
            app.RemoveStageButton = uibutton(app.GridLayout17, 'push');
            app.RemoveStageButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveStageButtonPushed, true);
            app.RemoveStageButton.Layout.Row = 6;
            app.RemoveStageButton.Layout.Column = 1;
            app.RemoveStageButton.Text = 'Remove Stage';

            % Create CancelButton_3
            app.CancelButton_3 = uibutton(app.GridLayout17, 'push');
            app.CancelButton_3.ButtonPushedFcn = createCallbackFcn(app, @CancelButton_3Pushed, true);
            app.CancelButton_3.Layout.Row = 6;
            app.CancelButton_3.Layout.Column = 2;
            app.CancelButton_3.Text = 'Cancel';

            % Create HeatFlowUnitsPanel
            app.HeatFlowUnitsPanel = uipanel(app.GridLayout3);
            app.HeatFlowUnitsPanel.Title = 'Heat Flow Units';
            app.HeatFlowUnitsPanel.Layout.Row = 3;
            app.HeatFlowUnitsPanel.Layout.Column = [2 3];
            app.HeatFlowUnitsPanel.FontWeight = 'bold';

            % Create GridLayout25
            app.GridLayout25 = uigridlayout(app.HeatFlowUnitsPanel);
            app.GridLayout25.ColumnWidth = {'1x'};
            app.GridLayout25.RowHeight = {22};

            % Create HeatFlowUnitsSwitch
            app.HeatFlowUnitsSwitch = uiswitch(app.GridLayout25, 'slider');
            app.HeatFlowUnitsSwitch.Items = {'W', 'W/g'};
            app.HeatFlowUnitsSwitch.Enable = 'off';
            app.HeatFlowUnitsSwitch.Layout.Row = 1;
            app.HeatFlowUnitsSwitch.Layout.Column = 1;
            app.HeatFlowUnitsSwitch.Value = 'W/g';

            % Create LiveTemperatureDataTab
            app.LiveTemperatureDataTab = uitab(app.TabGroup);
            app.LiveTemperatureDataTab.Title = 'Live Temperature Data';
            app.LiveTemperatureDataTab.BackgroundColor = [0.502 0.502 0.502];

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.LiveTemperatureDataTab);
            app.GridLayout4.ColumnWidth = {'1x'};
            app.GridLayout4.RowHeight = {'1x'};
            app.GridLayout4.RowSpacing = 6;
            app.GridLayout4.Padding = [10 6 10 6];

            % Create UIAxesTemperatures
            app.UIAxesTemperatures = uiaxes(app.GridLayout4);
            title(app.UIAxesTemperatures, 'Temperature vs. Time')
            xlabel(app.UIAxesTemperatures, 'Time (s)')
            ylabel(app.UIAxesTemperatures, 'Temperature (\circC)')
            app.UIAxesTemperatures.PlotBoxAspectRatio = [1.86355140186916 1 1];
            app.UIAxesTemperatures.Box = 'on';
            app.UIAxesTemperatures.XGrid = 'on';
            app.UIAxesTemperatures.YGrid = 'on';
            app.UIAxesTemperatures.Layout.Row = 1;
            app.UIAxesTemperatures.Layout.Column = 1;

            % Create AnalysisTab
            app.AnalysisTab = uitab(app.TabGroup);
            app.AnalysisTab.Title = 'Analysis';
            app.AnalysisTab.BackgroundColor = [0.502 0.502 0.502];

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.AnalysisTab);
            app.GridLayout5.ColumnWidth = {250, 250, '1x', '1x'};
            app.GridLayout5.RowHeight = {30, 30, 30, 90, 120, 120, 60, '1x', 30};
            app.GridLayout5.RowSpacing = 6;
            app.GridLayout5.Padding = [10 6 10 6];

            % Create UIAxesDataAnalysis
            app.UIAxesDataAnalysis = uiaxes(app.GridLayout5);
            title(app.UIAxesDataAnalysis, 'Differential Heat Flow Rate vs. Time')
            xlabel(app.UIAxesDataAnalysis, 'Time (sec)')
            ylabel(app.UIAxesDataAnalysis, 'Heat Flow Rate (W/g)')
            app.UIAxesDataAnalysis.PlotBoxAspectRatio = [2.20714285714286 1 1];
            app.UIAxesDataAnalysis.Box = 'on';
            app.UIAxesDataAnalysis.XGrid = 'on';
            app.UIAxesDataAnalysis.YGrid = 'on';
            app.UIAxesDataAnalysis.Layout.Row = [3 9];
            app.UIAxesDataAnalysis.Layout.Column = [2 4];

            % Create ImportDataFromOperationButton
            app.ImportDataFromOperationButton = uibutton(app.GridLayout5, 'push');
            app.ImportDataFromOperationButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataFromOperationButtonPushed, true);
            app.ImportDataFromOperationButton.BackgroundColor = [1 1 1];
            app.ImportDataFromOperationButton.FontSize = 16;
            app.ImportDataFromOperationButton.Layout.Row = 3;
            app.ImportDataFromOperationButton.Layout.Column = 1;
            app.ImportDataFromOperationButton.Text = 'Import Data From Operation';

            % Create ImportDataFromMATFileButton
            app.ImportDataFromMATFileButton = uibutton(app.GridLayout5, 'push');
            app.ImportDataFromMATFileButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataFromMATFileButtonPushed, true);
            app.ImportDataFromMATFileButton.BackgroundColor = [1 1 1];
            app.ImportDataFromMATFileButton.FontSize = 16;
            app.ImportDataFromMATFileButton.Layout.Row = 2;
            app.ImportDataFromMATFileButton.Layout.Column = 1;
            app.ImportDataFromMATFileButton.Text = 'Import Data From MAT File';

            % Create DataSetOpttionsPanel
            app.DataSetOpttionsPanel = uipanel(app.GridLayout5);
            app.DataSetOpttionsPanel.Title = 'Data Set Opttions';
            app.DataSetOpttionsPanel.Layout.Row = 4;
            app.DataSetOpttionsPanel.Layout.Column = 1;

            % Create DifferentialCheckBox
            app.DifferentialCheckBox = uicheckbox(app.DataSetOpttionsPanel);
            app.DifferentialCheckBox.ValueChangedFcn = createCallbackFcn(app, @DifferentialCheckBoxValueChanged, true);
            app.DifferentialCheckBox.Text = 'Differential';
            app.DifferentialCheckBox.Position = [11 38 79 22];
            app.DifferentialCheckBox.Value = true;

            % Create ReferenceSampleCheckBox
            app.ReferenceSampleCheckBox = uicheckbox(app.DataSetOpttionsPanel);
            app.ReferenceSampleCheckBox.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleCheckBoxValueChanged, true);
            app.ReferenceSampleCheckBox.Text = 'Reference Sample';
            app.ReferenceSampleCheckBox.Position = [11 8 121 22];

            % Create TargetTempCheckBox
            app.TargetTempCheckBox = uicheckbox(app.DataSetOpttionsPanel);
            app.TargetTempCheckBox.ValueChangedFcn = createCallbackFcn(app, @TargetTempCheckBoxValueChanged, true);
            app.TargetTempCheckBox.Text = 'Target Temp';
            app.TargetTempCheckBox.Position = [141 38 88 22];

            % Create TestSampleCheckBox
            app.TestSampleCheckBox = uicheckbox(app.DataSetOpttionsPanel);
            app.TestSampleCheckBox.ValueChangedFcn = createCallbackFcn(app, @TestSampleCheckBoxValueChanged, true);
            app.TestSampleCheckBox.Text = 'Test Sample';
            app.TestSampleCheckBox.Position = [141 8 88 22];

            % Create XAxisDataButtonGroup
            app.XAxisDataButtonGroup = uibuttongroup(app.GridLayout5);
            app.XAxisDataButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @XAxisDataButtonGroupSelectionChanged, true);
            app.XAxisDataButtonGroup.Title = 'X-Axis Data';
            app.XAxisDataButtonGroup.Layout.Row = 5;
            app.XAxisDataButtonGroup.Layout.Column = 1;

            % Create TimesecButton
            app.TimesecButton = uiradiobutton(app.XAxisDataButtonGroup);
            app.TimesecButton.Text = 'Time (sec)';
            app.TimesecButton.Position = [11 74 78 22];
            app.TimesecButton.Value = true;

            % Create TemperatureCButton_X
            app.TemperatureCButton_X = uiradiobutton(app.XAxisDataButtonGroup);
            app.TemperatureCButton_X.Text = 'Temperature (C)';
            app.TemperatureCButton_X.Position = [11 52 109 22];

            % Create TemperatureKButton_X
            app.TemperatureKButton_X = uiradiobutton(app.XAxisDataButtonGroup);
            app.TemperatureKButton_X.Text = 'Temperature (K)';
            app.TemperatureKButton_X.Position = [11 30 109 22];

            % Create YAxisDataButtonGroup
            app.YAxisDataButtonGroup = uibuttongroup(app.GridLayout5);
            app.YAxisDataButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @YAxisDataButtonGroupSelectionChanged, true);
            app.YAxisDataButtonGroup.Title = 'Y-Axis Data';
            app.YAxisDataButtonGroup.Layout.Row = 6;
            app.YAxisDataButtonGroup.Layout.Column = 1;

            % Create HeatFlowRateWgButton
            app.HeatFlowRateWgButton = uiradiobutton(app.YAxisDataButtonGroup);
            app.HeatFlowRateWgButton.Text = 'Heat Flow Rate (W/g)';
            app.HeatFlowRateWgButton.Position = [11 74 137 22];
            app.HeatFlowRateWgButton.Value = true;

            % Create TemperatureCButton_Y
            app.TemperatureCButton_Y = uiradiobutton(app.YAxisDataButtonGroup);
            app.TemperatureCButton_Y.Text = 'Temperature (C)';
            app.TemperatureCButton_Y.Position = [11 52 109 22];

            % Create TemperatureKButton_Y
            app.TemperatureKButton_Y = uiradiobutton(app.YAxisDataButtonGroup);
            app.TemperatureKButton_Y.Text = 'Temperature (K)';
            app.TemperatureKButton_Y.Position = [11 30 109 22];

            % Create TemperatureErrorButton
            app.TemperatureErrorButton = uiradiobutton(app.YAxisDataButtonGroup);
            app.TemperatureErrorButton.Enable = 'off';
            app.TemperatureErrorButton.Text = 'Temperature Error *';
            app.TemperatureErrorButton.Position = [11 8 127 22];

            % Create TempErrorInstructionsTextArea
            app.TempErrorInstructionsTextArea = uitextarea(app.GridLayout5);
            app.TempErrorInstructionsTextArea.Editable = 'off';
            app.TempErrorInstructionsTextArea.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TempErrorInstructionsTextArea.Layout.Row = 7;
            app.TempErrorInstructionsTextArea.Layout.Column = 1;
            app.TempErrorInstructionsTextArea.Value = {'* "Temperature Error" refers to the difference between the measured temperature for a given sample and the target temperature.'};

            % Create RefreshPlotButton
            app.RefreshPlotButton = uibutton(app.GridLayout5, 'push');
            app.RefreshPlotButton.ButtonPushedFcn = createCallbackFcn(app, @RefreshPlotButtonPushed, true);
            app.RefreshPlotButton.BackgroundColor = [1 1 1];
            app.RefreshPlotButton.FontSize = 16;
            app.RefreshPlotButton.Layout.Row = 9;
            app.RefreshPlotButton.Layout.Column = 1;
            app.RefreshPlotButton.Text = 'Refresh Plot';

            % Create DataLoadingTextArea
            app.DataLoadingTextArea = uitextarea(app.GridLayout5);
            app.DataLoadingTextArea.Editable = 'off';
            app.DataLoadingTextArea.HorizontalAlignment = 'center';
            app.DataLoadingTextArea.FontSize = 48;
            app.DataLoadingTextArea.Visible = 'off';
            app.DataLoadingTextArea.Layout.Row = [5 6];
            app.DataLoadingTextArea.Layout.Column = [2 3];
            app.DataLoadingTextArea.Value = {'Data Loading...'; 'Please wait'};

            % Create SaveAnalysisDataToExcelFileButton
            app.SaveAnalysisDataToExcelFileButton = uibutton(app.GridLayout5, 'push');
            app.SaveAnalysisDataToExcelFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveAnalysisDataToExcelFileButtonPushed, true);
            app.SaveAnalysisDataToExcelFileButton.BackgroundColor = [0 1 1];
            app.SaveAnalysisDataToExcelFileButton.FontSize = 16;
            app.SaveAnalysisDataToExcelFileButton.Layout.Row = 1;
            app.SaveAnalysisDataToExcelFileButton.Layout.Column = 2;
            app.SaveAnalysisDataToExcelFileButton.Text = 'Save Data To Excel File';

            % Create ImportDataFromExcelFileButton
            app.ImportDataFromExcelFileButton = uibutton(app.GridLayout5, 'push');
            app.ImportDataFromExcelFileButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataFromExcelFileButtonPushed, true);
            app.ImportDataFromExcelFileButton.BackgroundColor = [1 1 1];
            app.ImportDataFromExcelFileButton.FontSize = 16;
            app.ImportDataFromExcelFileButton.Layout.Row = 1;
            app.ImportDataFromExcelFileButton.Layout.Column = 1;
            app.ImportDataFromExcelFileButton.Text = 'Import Data From Excel File';

            % Create SaveAnalysisDataToMATFileButton
            app.SaveAnalysisDataToMATFileButton = uibutton(app.GridLayout5, 'push');
            app.SaveAnalysisDataToMATFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveAnalysisDataToMATFileButtonPushed, true);
            app.SaveAnalysisDataToMATFileButton.BackgroundColor = [0 1 1];
            app.SaveAnalysisDataToMATFileButton.FontSize = 16;
            app.SaveAnalysisDataToMATFileButton.Layout.Row = 2;
            app.SaveAnalysisDataToMATFileButton.Layout.Column = 2;
            app.SaveAnalysisDataToMATFileButton.Text = 'Save Data To MAT File';

            % Create MaintenanceTab
            app.MaintenanceTab = uitab(app.TabGroup);
            app.MaintenanceTab.Title = 'Maintenance';
            app.MaintenanceTab.BackgroundColor = [0.502 0.502 0.502];

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.MaintenanceTab);
            app.GridLayout6.ColumnWidth = {160, 120, 30, 160, '1x'};
            app.GridLayout6.RowHeight = {30, 70, '1x', 60, 120, 160, '2x', 30};
            app.GridLayout6.RowSpacing = 6;
            app.GridLayout6.Padding = [10 6 10 6];

            % Create LoadConfigFileButton
            app.LoadConfigFileButton = uibutton(app.GridLayout6, 'push');
            app.LoadConfigFileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadConfigFileButtonPushed, true);
            app.LoadConfigFileButton.BackgroundColor = [0.302 0.749 0.9294];
            app.LoadConfigFileButton.FontSize = 16;
            app.LoadConfigFileButton.Layout.Row = 1;
            app.LoadConfigFileButton.Layout.Column = 1;
            app.LoadConfigFileButton.Text = 'Load Config File';

            % Create LoadDefaultConfigButton
            app.LoadDefaultConfigButton = uibutton(app.GridLayout6, 'push');
            app.LoadDefaultConfigButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDefaultConfigButtonPushed, true);
            app.LoadDefaultConfigButton.BackgroundColor = [1 1 0];
            app.LoadDefaultConfigButton.FontSize = 16;
            app.LoadDefaultConfigButton.Layout.Row = 1;
            app.LoadDefaultConfigButton.Layout.Column = 4;
            app.LoadDefaultConfigButton.Text = 'Load Default Config';

            % Create DAQBoxConfigurationPanel
            app.DAQBoxConfigurationPanel = uipanel(app.GridLayout6);
            app.DAQBoxConfigurationPanel.Title = 'DAQ Box Configuration';
            app.DAQBoxConfigurationPanel.Layout.Row = 2;
            app.DAQBoxConfigurationPanel.Layout.Column = [1 2];
            app.DAQBoxConfigurationPanel.FontWeight = 'bold';

            % Create GridLayout10
            app.GridLayout10 = uigridlayout(app.DAQBoxConfigurationPanel);
            app.GridLayout10.ColumnWidth = {120, '1x', 20};
            app.GridLayout10.RowHeight = {30};

            % Create InitializeDAQBoxButton_2
            app.InitializeDAQBoxButton_2 = uibutton(app.GridLayout10, 'push');
            app.InitializeDAQBoxButton_2.ButtonPushedFcn = createCallbackFcn(app, @StartDAQSessionsButtonPushed, true);
            app.InitializeDAQBoxButton_2.Layout.Row = 1;
            app.InitializeDAQBoxButton_2.Layout.Column = 1;
            app.InitializeDAQBoxButton_2.Text = 'Initialize DAQ Box';

            % Create DAQBoxStatusLabel
            app.DAQBoxStatusLabel = uilabel(app.GridLayout10);
            app.DAQBoxStatusLabel.HorizontalAlignment = 'right';
            app.DAQBoxStatusLabel.Layout.Row = 1;
            app.DAQBoxStatusLabel.Layout.Column = 2;
            app.DAQBoxStatusLabel.Text = 'DAQ Box Status';

            % Create DAQStatusLamp
            app.DAQStatusLamp = uilamp(app.GridLayout10);
            app.DAQStatusLamp.Enable = 'off';
            app.DAQStatusLamp.Layout.Row = 1;
            app.DAQStatusLamp.Layout.Column = 3;
            app.DAQStatusLamp.Color = [1 0 0];

            % Create TemperatureControlsPanel
            app.TemperatureControlsPanel = uipanel(app.GridLayout6);
            app.TemperatureControlsPanel.Title = 'Temperature Controls';
            app.TemperatureControlsPanel.Layout.Row = 4;
            app.TemperatureControlsPanel.Layout.Column = [1 2];
            app.TemperatureControlsPanel.FontWeight = 'bold';

            % Create GridLayout11
            app.GridLayout11 = uigridlayout(app.TemperatureControlsPanel);
            app.GridLayout11.ColumnWidth = {'1x', 100};
            app.GridLayout11.RowHeight = {22};

            % Create MaxTempLimitCelsiusLabel
            app.MaxTempLimitCelsiusLabel = uilabel(app.GridLayout11);
            app.MaxTempLimitCelsiusLabel.HorizontalAlignment = 'right';
            app.MaxTempLimitCelsiusLabel.Layout.Row = 1;
            app.MaxTempLimitCelsiusLabel.Layout.Column = 1;
            app.MaxTempLimitCelsiusLabel.Text = 'Max Temp Limit (Celsius) ';

            % Create MaxTempLimitCelsiusSpinner
            app.MaxTempLimitCelsiusSpinner = uispinner(app.GridLayout11);
            app.MaxTempLimitCelsiusSpinner.Step = 0.01;
            app.MaxTempLimitCelsiusSpinner.ValueDisplayFormat = '%.2f';
            app.MaxTempLimitCelsiusSpinner.ValueChangedFcn = createCallbackFcn(app, @MaxTempLimitCelsiusSpinnerValueChanged, true);
            app.MaxTempLimitCelsiusSpinner.Layout.Row = 1;
            app.MaxTempLimitCelsiusSpinner.Layout.Column = 2;
            app.MaxTempLimitCelsiusSpinner.Value = 150;

            % Create SensorCalibrationPanel
            app.SensorCalibrationPanel = uipanel(app.GridLayout6);
            app.SensorCalibrationPanel.ForegroundColor = [1 1 1];
            app.SensorCalibrationPanel.Title = 'Sensor Calibration';
            app.SensorCalibrationPanel.BackgroundColor = [0.149 0.149 0.149];
            app.SensorCalibrationPanel.Layout.Row = [1 8];
            app.SensorCalibrationPanel.Layout.Column = 5;
            app.SensorCalibrationPanel.FontWeight = 'bold';

            % Create GridLayout9
            app.GridLayout9 = uigridlayout(app.SensorCalibrationPanel);
            app.GridLayout9.RowHeight = {'20x', '60x', '20x', '1x', '100x', '1x', '80x'};

            % Create TakeMeasurementButton
            app.TakeMeasurementButton = uibutton(app.GridLayout9, 'push');
            app.TakeMeasurementButton.ButtonPushedFcn = createCallbackFcn(app, @TakeMeasurementButtonPushed, true);
            app.TakeMeasurementButton.BackgroundColor = [0.502 1 0.502];
            app.TakeMeasurementButton.Enable = 'off';
            app.TakeMeasurementButton.Layout.Row = 1;
            app.TakeMeasurementButton.Layout.Column = 1;
            app.TakeMeasurementButton.Text = 'Take Measurement';

            % Create CalibrationSamplePanel
            app.CalibrationSamplePanel = uipanel(app.GridLayout9);
            app.CalibrationSamplePanel.Title = 'Sensor Reading';
            app.CalibrationSamplePanel.Layout.Row = 2;
            app.CalibrationSamplePanel.Layout.Column = 1;
            app.CalibrationSamplePanel.FontWeight = 'bold';

            % Create CalibrationSampleCelsiusEditFieldLabel
            app.CalibrationSampleCelsiusEditFieldLabel = uilabel(app.CalibrationSamplePanel);
            app.CalibrationSampleCelsiusEditFieldLabel.Position = [81 54 45 22];
            app.CalibrationSampleCelsiusEditFieldLabel.Text = 'Celsius';

            % Create CalibrationSampleCelsiusEditField
            app.CalibrationSampleCelsiusEditField = uieditfield(app.CalibrationSamplePanel, 'numeric');
            app.CalibrationSampleCelsiusEditField.ValueDisplayFormat = '%.4f';
            app.CalibrationSampleCelsiusEditField.Editable = 'off';
            app.CalibrationSampleCelsiusEditField.Position = [11 54 60 22];

            % Create CalibrationSampleKelvinEditFieldLabel
            app.CalibrationSampleKelvinEditFieldLabel = uilabel(app.CalibrationSamplePanel);
            app.CalibrationSampleKelvinEditFieldLabel.Position = [81 24 38 22];
            app.CalibrationSampleKelvinEditFieldLabel.Text = 'Kelvin';

            % Create CalibrationSampleKelvinEditField
            app.CalibrationSampleKelvinEditField = uieditfield(app.CalibrationSamplePanel, 'numeric');
            app.CalibrationSampleKelvinEditField.ValueDisplayFormat = '%.4f';
            app.CalibrationSampleKelvinEditField.Editable = 'off';
            app.CalibrationSampleKelvinEditField.Position = [11 24 60 22];

            % Create CalibrationActualTempPanel
            app.CalibrationActualTempPanel = uipanel(app.GridLayout9);
            app.CalibrationActualTempPanel.Title = 'Actual Temperature (K)';
            app.CalibrationActualTempPanel.Layout.Row = [1 2];
            app.CalibrationActualTempPanel.Layout.Column = 2;
            app.CalibrationActualTempPanel.FontWeight = 'bold';

            % Create CalibrationSampleKelvinEditFieldLabel_2
            app.CalibrationSampleKelvinEditFieldLabel_2 = uilabel(app.CalibrationActualTempPanel);
            app.CalibrationSampleKelvinEditFieldLabel_2.Position = [81 70 38 22];
            app.CalibrationSampleKelvinEditFieldLabel_2.Text = 'Kelvin';

            % Create CalibrationActualTempEditField
            app.CalibrationActualTempEditField = uieditfield(app.CalibrationActualTempPanel, 'numeric');
            app.CalibrationActualTempEditField.ValueDisplayFormat = '%.4f';
            app.CalibrationActualTempEditField.ValueChangedFcn = createCallbackFcn(app, @CalibrationActualTempEditFieldValueChanged, true);
            app.CalibrationActualTempEditField.Position = [11 70 60 22];

            % Create CalibrationActualLabel
            app.CalibrationActualLabel = uilabel(app.CalibrationActualTempPanel);
            app.CalibrationActualLabel.Position = [11 100 123 22];
            app.CalibrationActualLabel.Text = 'Enter the actual temp:';

            % Create OffsetdeltaKLabel
            app.OffsetdeltaKLabel = uilabel(app.CalibrationActualTempPanel);
            app.OffsetdeltaKLabel.Position = [80 40 90 22];
            app.OffsetdeltaKLabel.Text = 'Offset (delta K)';

            % Create ActualTempOffsetEditField
            app.ActualTempOffsetEditField = uieditfield(app.CalibrationActualTempPanel, 'numeric');
            app.ActualTempOffsetEditField.ValueDisplayFormat = '%+5.4f';
            app.ActualTempOffsetEditField.Editable = 'off';
            app.ActualTempOffsetEditField.Position = [11 40 60 22];

            % Create CalibrationDataPanel
            app.CalibrationDataPanel = uipanel(app.GridLayout9);
            app.CalibrationDataPanel.Title = 'Calibration Data';
            app.CalibrationDataPanel.Layout.Row = 5;
            app.CalibrationDataPanel.Layout.Column = [1 2];
            app.CalibrationDataPanel.FontWeight = 'bold';

            % Create GridLayout7
            app.GridLayout7 = uigridlayout(app.CalibrationDataPanel);
            app.GridLayout7.RowHeight = {'1x', 30};

            % Create CalibrationDataUITable
            app.CalibrationDataUITable = uitable(app.GridLayout7);
            app.CalibrationDataUITable.ColumnName = {'Measured Temp (K)'; 'Actual Temp (K)'; 'Offset'};
            app.CalibrationDataUITable.RowName = {};
            app.CalibrationDataUITable.CellSelectionCallback = createCallbackFcn(app, @CalibrationDataUITableCellSelection, true);
            app.CalibrationDataUITable.Layout.Row = 1;
            app.CalibrationDataUITable.Layout.Column = [1 2];

            % Create RemoveLatestEntryButton
            app.RemoveLatestEntryButton = uibutton(app.GridLayout7, 'push');
            app.RemoveLatestEntryButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveLatestEntryButtonPushed, true);
            app.RemoveLatestEntryButton.Layout.Row = 2;
            app.RemoveLatestEntryButton.Layout.Column = 1;
            app.RemoveLatestEntryButton.Text = 'Remove Latest Entry';

            % Create ClearCalibrationDataButton
            app.ClearCalibrationDataButton = uibutton(app.GridLayout7, 'push');
            app.ClearCalibrationDataButton.ButtonPushedFcn = createCallbackFcn(app, @ClearCalibrationDataButtonPushed, true);
            app.ClearCalibrationDataButton.Layout.Row = 2;
            app.ClearCalibrationDataButton.Layout.Column = 2;
            app.ClearCalibrationDataButton.Text = 'Clear Calibration Data';

            % Create AddtoCalibrationDataButton
            app.AddtoCalibrationDataButton = uibutton(app.GridLayout9, 'push');
            app.AddtoCalibrationDataButton.ButtonPushedFcn = createCallbackFcn(app, @AddtoCalibrationDataButtonPushed, true);
            app.AddtoCalibrationDataButton.Layout.Row = 3;
            app.AddtoCalibrationDataButton.Layout.Column = 2;
            app.AddtoCalibrationDataButton.Text = 'Add to Calibration Data';

            % Create CalibrationOffsetPanel
            app.CalibrationOffsetPanel = uipanel(app.GridLayout9);
            app.CalibrationOffsetPanel.Title = 'Calibration Offset';
            app.CalibrationOffsetPanel.Layout.Row = 7;
            app.CalibrationOffsetPanel.Layout.Column = [1 2];
            app.CalibrationOffsetPanel.FontWeight = 'bold';

            % Create GridLayout19
            app.GridLayout19 = uigridlayout(app.CalibrationOffsetPanel);
            app.GridLayout19.ColumnWidth = {'4x', '1x'};
            app.GridLayout19.RowHeight = {30, 30, '1x'};

            % Create SaveCalibrationOffsetButton
            app.SaveCalibrationOffsetButton = uibutton(app.GridLayout19, 'push');
            app.SaveCalibrationOffsetButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCalibrationOffsetButtonPushed, true);
            app.SaveCalibrationOffsetButton.FontSize = 16;
            app.SaveCalibrationOffsetButton.Layout.Row = 1;
            app.SaveCalibrationOffsetButton.Layout.Column = [1 2];
            app.SaveCalibrationOffsetButton.Text = 'Save Calibration Offset';

            % Create CalibrationOffsetLabel
            app.CalibrationOffsetLabel = uilabel(app.GridLayout19);
            app.CalibrationOffsetLabel.HorizontalAlignment = 'right';
            app.CalibrationOffsetLabel.Layout.Row = 2;
            app.CalibrationOffsetLabel.Layout.Column = 1;
            app.CalibrationOffsetLabel.Text = {'Reference Sample Temperature '; 'Calibration Offset (delta K):'};

            % Create CalibrationOffsetEditField
            app.CalibrationOffsetEditField = uieditfield(app.GridLayout19, 'numeric');
            app.CalibrationOffsetEditField.ValueDisplayFormat = '%+5.4f';
            app.CalibrationOffsetEditField.Layout.Row = 2;
            app.CalibrationOffsetEditField.Layout.Column = 2;

            % Create AutoCalibrateButton
            app.AutoCalibrateButton = uibutton(app.GridLayout9, 'push');
            app.AutoCalibrateButton.ButtonPushedFcn = createCallbackFcn(app, @AutoCalibrateButtonPushed, true);
            app.AutoCalibrateButton.Layout.Row = 3;
            app.AutoCalibrateButton.Layout.Column = 1;
            app.AutoCalibrateButton.Text = 'Auto Calibrate';

            % Create SaveConfigToFileButton
            app.SaveConfigToFileButton = uibutton(app.GridLayout6, 'push');
            app.SaveConfigToFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveConfigToFileButtonPushed, true);
            app.SaveConfigToFileButton.BackgroundColor = [0 1 1];
            app.SaveConfigToFileButton.FontSize = 16;
            app.SaveConfigToFileButton.Layout.Row = 1;
            app.SaveConfigToFileButton.Layout.Column = [2 3];
            app.SaveConfigToFileButton.Text = 'Save Config To File';

            % Create ApplyConfigChangesButton
            app.ApplyConfigChangesButton = uibutton(app.GridLayout6, 'push');
            app.ApplyConfigChangesButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyConfigChangesButtonPushed, true);
            app.ApplyConfigChangesButton.BackgroundColor = [0.502 1 0.502];
            app.ApplyConfigChangesButton.FontSize = 16;
            app.ApplyConfigChangesButton.Layout.Row = 8;
            app.ApplyConfigChangesButton.Layout.Column = [1 2];
            app.ApplyConfigChangesButton.Text = 'Apply Config Changes';

            % Create SystemStatusLamp
            app.SystemStatusLamp = uilamp(app.GridLayout6);
            app.SystemStatusLamp.Layout.Row = 8;
            app.SystemStatusLamp.Layout.Column = 3;

            % Create PIDGainConstantsPanel
            app.PIDGainConstantsPanel = uipanel(app.GridLayout6);
            app.PIDGainConstantsPanel.Title = 'PID Gain Constants';
            app.PIDGainConstantsPanel.Layout.Row = 5;
            app.PIDGainConstantsPanel.Layout.Column = [1 2];
            app.PIDGainConstantsPanel.FontWeight = 'bold';

            % Create GridLayout12
            app.GridLayout12 = uigridlayout(app.PIDGainConstantsPanel);
            app.GridLayout12.ColumnWidth = {'1x', 100};
            app.GridLayout12.RowHeight = {22, 22, 22};
            app.GridLayout12.RowSpacing = 6;

            % Create KpproportionalgainSpinnerLabel
            app.KpproportionalgainSpinnerLabel = uilabel(app.GridLayout12);
            app.KpproportionalgainSpinnerLabel.HorizontalAlignment = 'right';
            app.KpproportionalgainSpinnerLabel.Layout.Row = 1;
            app.KpproportionalgainSpinnerLabel.Layout.Column = 1;
            app.KpproportionalgainSpinnerLabel.Text = 'Kp - proportional gain';

            % Create KpproportionalgainSpinner
            app.KpproportionalgainSpinner = uispinner(app.GridLayout12);
            app.KpproportionalgainSpinner.Step = 1e-05;
            app.KpproportionalgainSpinner.ValueDisplayFormat = '%.5f';
            app.KpproportionalgainSpinner.ValueChangedFcn = createCallbackFcn(app, @KpproportionalgainSpinnerValueChanged, true);
            app.KpproportionalgainSpinner.Layout.Row = 1;
            app.KpproportionalgainSpinner.Layout.Column = 2;

            % Create KiintegralgainSpinnerLabel
            app.KiintegralgainSpinnerLabel = uilabel(app.GridLayout12);
            app.KiintegralgainSpinnerLabel.HorizontalAlignment = 'right';
            app.KiintegralgainSpinnerLabel.Layout.Row = 2;
            app.KiintegralgainSpinnerLabel.Layout.Column = 1;
            app.KiintegralgainSpinnerLabel.Text = 'Ki - integral gain';

            % Create KiintegralgainSpinner
            app.KiintegralgainSpinner = uispinner(app.GridLayout12);
            app.KiintegralgainSpinner.Step = 1e-05;
            app.KiintegralgainSpinner.ValueDisplayFormat = '%.5f';
            app.KiintegralgainSpinner.ValueChangedFcn = createCallbackFcn(app, @KiintegralgainSpinnerValueChanged, true);
            app.KiintegralgainSpinner.Layout.Row = 2;
            app.KiintegralgainSpinner.Layout.Column = 2;

            % Create KdderivativegainSpinnerLabel
            app.KdderivativegainSpinnerLabel = uilabel(app.GridLayout12);
            app.KdderivativegainSpinnerLabel.HorizontalAlignment = 'right';
            app.KdderivativegainSpinnerLabel.Layout.Row = 3;
            app.KdderivativegainSpinnerLabel.Layout.Column = 1;
            app.KdderivativegainSpinnerLabel.Text = 'Kd - derivative gain';

            % Create KdderivativegainSpinner
            app.KdderivativegainSpinner = uispinner(app.GridLayout12);
            app.KdderivativegainSpinner.Step = 1e-05;
            app.KdderivativegainSpinner.ValueDisplayFormat = '%.5f';
            app.KdderivativegainSpinner.ValueChangedFcn = createCallbackFcn(app, @KdderivativegainSpinnerValueChanged, true);
            app.KdderivativegainSpinner.Layout.Row = 3;
            app.KdderivativegainSpinner.Layout.Column = 2;

            % Create SavedCalibrationOffsetsPanel
            app.SavedCalibrationOffsetsPanel = uipanel(app.GridLayout6);
            app.SavedCalibrationOffsetsPanel.Title = 'Saved Calibration Offsets';
            app.SavedCalibrationOffsetsPanel.Layout.Row = 6;
            app.SavedCalibrationOffsetsPanel.Layout.Column = [1 4];
            app.SavedCalibrationOffsetsPanel.FontWeight = 'bold';

            % Create GridLayout8
            app.GridLayout8 = uigridlayout(app.SavedCalibrationOffsetsPanel);
            app.GridLayout8.ColumnWidth = {'1x', 320, 60, '1x'};
            app.GridLayout8.RowHeight = {22, 22, 22, 22};

            % Create ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel = uilabel(app.GridLayout8);
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.Layout.Row = 1;
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.Layout.Column = 2;
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.Text = 'Reference Sample Temperature Calibration Offset (delta K):';

            % Create ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField = uieditfield(app.GridLayout8, 'numeric');
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.ValueDisplayFormat = '%+5.4f';
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Editable = 'off';
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Layout.Row = 1;
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Layout.Column = 3;

            % Create TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel = uilabel(app.GridLayout8);
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.HorizontalAlignment = 'right';
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.Layout.Row = 2;
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.Layout.Column = 2;
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.Text = 'Test Sample Temperature Calibration Offset (delta K):';

            % Create TestSampleTemperatureCalibrationOffsetdeltaKEditField
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField = uieditfield(app.GridLayout8, 'numeric');
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.ValueDisplayFormat = '%+5.4f';
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Editable = 'off';
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Layout.Row = 2;
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Layout.Column = 3;

            % Create ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel = uilabel(app.GridLayout8);
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Layout.Row = 3;
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Layout.Column = 2;
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Text = 'Reference Sample Current Calibration Offset (delta A):';

            % Create ReferenceSampleCurrentCalibrationOffsetdeltaAEditField
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField = uieditfield(app.GridLayout8, 'numeric');
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.ValueDisplayFormat = '%+5.4f';
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Editable = 'off';
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Layout.Row = 3;
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Layout.Column = 3;

            % Create TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel = uilabel(app.GridLayout8);
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.HorizontalAlignment = 'right';
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Layout.Row = 4;
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Layout.Column = 2;
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Text = 'Test Sample Current Calibration Offset (delta A):';

            % Create TestSampleCurrentCalibrationOffsetdeltaAEditField
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField = uieditfield(app.GridLayout8, 'numeric');
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.ValueDisplayFormat = '%+5.4f';
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Editable = 'off';
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Layout.Row = 4;
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Layout.Column = 3;

            % Create SelectSensortoCalibrateButtonGroup
            app.SelectSensortoCalibrateButtonGroup = uibuttongroup(app.GridLayout6);
            app.SelectSensortoCalibrateButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @SelectSensortoCalibrateButtonGroupSelectionChanged, true);
            app.SelectSensortoCalibrateButtonGroup.Title = 'Select Sensor to Calibrate';
            app.SelectSensortoCalibrateButtonGroup.Layout.Row = [2 4];
            app.SelectSensortoCalibrateButtonGroup.Layout.Column = [3 4];
            app.SelectSensortoCalibrateButtonGroup.FontWeight = 'bold';

            % Create TemperatureReferenceSampleButton
            app.TemperatureReferenceSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.TemperatureReferenceSampleButton.Text = 'Temperature: Reference Sample';
            app.TemperatureReferenceSampleButton.Position = [11 116 180 24];
            app.TemperatureReferenceSampleButton.Value = true;

            % Create TemperatureTestSampleButton
            app.TemperatureTestSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.TemperatureTestSampleButton.Text = 'Temperature: Test Sample';
            app.TemperatureTestSampleButton.Position = [11 86 180 24];

            % Create CurrentReferenceSampleButton
            app.CurrentReferenceSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.CurrentReferenceSampleButton.Text = 'Current: Reference Sample';
            app.CurrentReferenceSampleButton.Position = [11 36 180 24];

            % Create CurrentTestSampleButton
            app.CurrentTestSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.CurrentTestSampleButton.Text = 'Current: Test Sample';
            app.CurrentTestSampleButton.Position = [11 6 180 24];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DSC_GUI_APP_autoreflow_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end