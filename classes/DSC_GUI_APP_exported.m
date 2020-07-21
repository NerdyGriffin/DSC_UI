classdef DSC_GUI_APP_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        OperationTab                    matlab.ui.container.Tab
        UIAxesSamples                   matlab.ui.control.UIAxes
        UIAxesDifferential              matlab.ui.control.UIAxes
        ClearDataButton                 matlab.ui.control.Button
        SaveDataToFileButton            matlab.ui.control.Button
        StartExperimentButton           matlab.ui.control.Button
        StopExperimentButton            matlab.ui.control.Button
        ReferenceSampleLiveDataPanel    matlab.ui.container.Panel
        ReferenceCurrentEditField       matlab.ui.control.NumericEditField
        ReferenceTemperatureEditField   matlab.ui.control.NumericEditField
        ReferenceCurrentGaugeLabel      matlab.ui.control.Label
        ReferenceTemperatureGaugeLabel  matlab.ui.control.Label
        TestSampleLiveDataPanel         matlab.ui.container.Panel
        TestSampleCurrentEditField      matlab.ui.control.NumericEditField
        TestSampleTemperatureEditField  matlab.ui.control.NumericEditField
        TestSampleCurrentGaugeLabel     matlab.ui.control.Label
        TestSampleTemperatureGaugeLabel  matlab.ui.control.Label
        InitializeDAQBoxButton          matlab.ui.control.Button
        ControlStagingConfigurationPanel  matlab.ui.container.Panel
        AddaStageButton                 matlab.ui.control.Button
        EditaStageButton                matlab.ui.control.Button
        TempControlStagingUITable       matlab.ui.control.Table
        RemoveaStageButton              matlab.ui.control.Button
        CurrentStageLabel               matlab.ui.control.Label
        CurrentStageEditField           matlab.ui.control.NumericEditField
        CurrentModeLabel                matlab.ui.control.Label
        CurrentModeEditField            matlab.ui.control.EditField
        AddaStagePanel                  matlab.ui.container.Panel
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
        CurrentStageClocksPanel         matlab.ui.container.Panel
        ElapsedTimeLabel                matlab.ui.control.Label
        CurrentStage_ElapsedTimeEditField  matlab.ui.control.EditField
        CurrentStage_EstimatedTimeRemainingLabel  matlab.ui.control.Label
        CurrentStage_EstimatedTimeRemainingEditField  matlab.ui.control.EditField
        ExperimentClockPanel            matlab.ui.container.Panel
        ElapsedTimeEditFieldLabel       matlab.ui.control.Label
        ElapsedTimeEditField            matlab.ui.control.EditField
        SkipCurrentStageButton          matlab.ui.control.Button
        ReferenceSamplePropertiesPanel_2  matlab.ui.container.Panel
        ReferenceSampleMassgramsSpinner_2Label  matlab.ui.control.Label
        ReferenceSampleMassgramsSpinner_2  matlab.ui.control.Spinner
        ReferenceSpecificHeatJgKSpinnerLabel  matlab.ui.control.Label
        ReferenceSpecificHeatJgKSpinner  matlab.ui.control.Spinner
        ReferenceSampleMaterialEditFieldLabel_2  matlab.ui.control.Label
        ReferenceSampleMaterialEditField_2  matlab.ui.control.EditField
        TestSamplePropertiesPanel_2     matlab.ui.container.Panel
        TestSampleMassgramsSpinner_2Label  matlab.ui.control.Label
        TestSampleMassgramsSpinner_2    matlab.ui.control.Spinner
        TestSampleMaterialEditFieldLabel_2  matlab.ui.control.Label
        TestSampleMaterialEditField_2   matlab.ui.control.EditField
        XAxisDataPanel                  matlab.ui.container.Panel
        XAxisDataSwitch                 matlab.ui.control.Switch
        LoadStagingFileButton           matlab.ui.control.Button
        SaveStagingFileButton           matlab.ui.control.Button
        TargetTemperatureLiveDataPanel  matlab.ui.container.Panel
        TargetTemperatureEditField      matlab.ui.control.NumericEditField
        TargetTemperatureGaugeLabel     matlab.ui.control.Label
        LiveTemperatureDataTab          matlab.ui.container.Tab
        UIAxesTemperatures              matlab.ui.control.UIAxes
        ReferenceSampleLiveDataPanel_2  matlab.ui.container.Panel
        ReferenceCurrentEditField_2     matlab.ui.control.NumericEditField
        ReferenceTemperatureEditField_2  matlab.ui.control.NumericEditField
        ReferenceCurrentGaugeLabel_2    matlab.ui.control.Label
        ReferenceTemperatureGaugeLabel_2  matlab.ui.control.Label
        TestSampleLiveDataPanel_2       matlab.ui.container.Panel
        TestSampleCurrentEditField_2    matlab.ui.control.NumericEditField
        TestSampleTemperatureEditField_2  matlab.ui.control.NumericEditField
        TestSampleCurrentGaugeLabel_2   matlab.ui.control.Label
        TestSampleTemperatureGaugeLabel_2  matlab.ui.control.Label
        TargetTemperatureLiveDataPanel_2  matlab.ui.container.Panel
        TargetTemperatureEditField_2    matlab.ui.control.NumericEditField
        TargetTemperatureGaugeLabel_2   matlab.ui.control.Label
        TemperatureUnitsPanel           matlab.ui.container.Panel
        TemperatureUnitsSwitch          matlab.ui.control.Switch
        StartExperimentButton_2         matlab.ui.control.Button
        StopExperimentButton_2          matlab.ui.control.Button
        SkipCurrentStageButton_2        matlab.ui.control.Button
        AnalysisTab                     matlab.ui.container.Tab
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
        ReferenceSamplePropertiesPanel  matlab.ui.container.Panel
        ReferenceSampleMassgramsSpinnerLabel  matlab.ui.control.Label
        ReferenceSampleMassgramsSpinner  matlab.ui.control.Spinner
        ReferenceSpecificHeatJgKSpinner_2Label  matlab.ui.control.Label
        ReferenceSpecificHeatJgKSpinner_2  matlab.ui.control.Spinner
        ReferenceSampleMaterialEditFieldLabel  matlab.ui.control.Label
        ReferenceSampleMaterialEditField  matlab.ui.control.EditField
        TestSamplePropertiesPanel       matlab.ui.container.Panel
        TestSampleMassgramsSpinnerLabel  matlab.ui.control.Label
        TestSampleMassgramsSpinner      matlab.ui.control.Spinner
        TestSampleMaterialEditFieldLabel  matlab.ui.control.Label
        TestSampleMaterialEditField     matlab.ui.control.EditField
        SaveAnalysisDataToExcelFileButton  matlab.ui.control.Button
        ImportDataFromExcelFileButton   matlab.ui.control.Button
        SaveAnalysisDataToMATFileButton  matlab.ui.control.Button
        MaintenanceTab                  matlab.ui.container.Tab
        LoadConfigFileButton            matlab.ui.control.Button
        LoadDefaultConfigButton         matlab.ui.control.Button
        DAQBoxConfigurationPanel        matlab.ui.container.Panel
        InitializeDAQBoxButton_2        matlab.ui.control.Button
        DAQBoxStatusLabel               matlab.ui.control.Label
        DAQStatusLamp                   matlab.ui.control.Lamp
        TemperatureSensorSelectionButtonGroup  matlab.ui.container.ButtonGroup
        ThermocoupleButton              matlab.ui.control.RadioButton
        PlatinumRTDButton               matlab.ui.control.RadioButton
        ThermocoupleConfigurationPanel  matlab.ui.container.Panel
        ThermocoupleTypeDropDownLabel   matlab.ui.control.Label
        ThermocoupleTypeDropDown        matlab.ui.control.DropDown
        PlatinumRTDConfigurationPanel   matlab.ui.container.Panel
        RTDResistenceohmSpinnerLabel    matlab.ui.control.Label
        RTDResistenceohmSpinner         matlab.ui.control.Spinner
        RTDTypeDropDownLabel            matlab.ui.control.Label
        RTDTypeDropDown                 matlab.ui.control.DropDown
        RTDConfigurationDropDownLabel   matlab.ui.control.Label
        RTDConfigurationDropDown        matlab.ui.control.DropDown
        TemperatureControlsPanel        matlab.ui.container.Panel
        MaxTempLimitCelsiusSpinnerLabel  matlab.ui.control.Label
        MaxTempLimitCelsiusSpinner      matlab.ui.control.Spinner
        SensorCalibrationPanel          matlab.ui.container.Panel
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
        CalibrationDataUITable          matlab.ui.control.Table
        RemoveLatestEntryButton         matlab.ui.control.Button
        ClearCalibrationDataButton      matlab.ui.control.Button
        AddtoCalibrationDataButton      matlab.ui.control.Button
        CalibrationOffsetPanel          matlab.ui.container.Panel
        SaveCalibrationOffsetButton     matlab.ui.control.Button
        CalibrationOffsetLabel          matlab.ui.control.Label
        CalibrationOffsetEditField      matlab.ui.control.NumericEditField
        AutoCalibrateButton             matlab.ui.control.Button
        SaveConfigToFileButton          matlab.ui.control.Button
        ApplyConfigChangesButton        matlab.ui.control.Button
        SystemStatusLamp                matlab.ui.control.Lamp
        PIDGainConstantsPanel           matlab.ui.container.Panel
        KpproportionalgainSpinnerLabel  matlab.ui.control.Label
        KpproportionalgainSpinner       matlab.ui.control.Spinner
        KiintegralgainSpinnerLabel      matlab.ui.control.Label
        KiintegralgainSpinner           matlab.ui.control.Spinner
        KdderivativegainSpinnerLabel    matlab.ui.control.Label
        KdderivativegainSpinner         matlab.ui.control.Spinner
        SavedCalibrationOffsetsPanel    matlab.ui.container.Panel
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
            app.StartExperimentButton_2.Enable = 'off';
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
            app.SkipCurrentStageButton_2.Enable = 'off';
            
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
            app.StopExperimentSemaphore.wait();
            app.StopExperimentSemaphore.lock();
            
            if app.stageController.ExperimentInProgress
                app.stageController.forceStop();
            end
            
            app.StopExperimentSemaphore.release();
            
            app.refreshOperationUI();
        end
        
        function stopPWM(app)
            % Prevent this function from running more than once at a time
            app.SetupSemaphore.wait();
            app.SetupSemaphore.lock();
            
            % Stop the PWM outputs
            if ~isempty(app.daqBox) && isvalid(app.daqBox)
                app.daqBox.stopPWM();
            end
            
            app.SetupSemaphore.release();
            
            app.refreshOperationUI();
        end
        
        function refreshOperationUI(app)
            % Update the enable state of the UI buttons
            drawnow nocallbacks
            
            % Disable the "Start Experiment" button if the system is not fully configured
            if isempty(app.daqBox) || ~isvalid(app.daqBox)...
                    || isempty(app.stageController) || ~isvalid(app.stageController)
                
                app.StartExperimentButton.Enable = 'off';
                app.StartExperimentButton_2.Enable = 'off';
                
            else
                app.StartExperimentButton.Enable = 'on';
                app.StartExperimentButton_2.Enable = 'on';
                
            end
            
            % Enable or disable selective buttons on the Operation Tab depending on whether the experiment procedure is currently running
            if app.stageController.ExperimentInProgress
                if app.stageController.ForceStop
                    app.StopExperimentButton.Enable = 'off';
                    app.StopExperimentButton_2.Enable = 'off';
                else
                    app.StopExperimentButton.Enable = 'on';
                    app.StopExperimentButton_2.Enable = 'on';
                end
                
                if app.stageController.ForceSkipStage
                    app.SkipCurrentStageButton.Enable = 'off';
                    app.SkipCurrentStageButton_2.Enable = 'off';
                else
                    app.SkipCurrentStageButton.Enable = 'on';
                    app.SkipCurrentStageButton_2.Enable = 'on';
                end
                app.StartExperimentButton.Enable = 'off';
                app.StartExperimentButton_2.Enable = 'off';
                app.SaveDataToFileButton.Enable = 'off';
                app.ClearDataButton.Enable = 'off';
                
                app.SaveStagingFileButton.Enable = 'off';
                app.AddaStageButton.Enable = 'off';
                app.EditaStageButton.Enable = 'off';
                app.RemoveaStageButton.Enable = 'off';
                
                app.ReferenceSampleMassgramsSpinner.Enable = 'off';
                app.ReferenceSampleMassgramsSpinner_2.Enable = 'off';
                app.TestSampleMassgramsSpinner.Enable = 'off';
                app.TestSampleMassgramsSpinner_2.Enable = 'off';
                
            else
                app.StopExperimentButton.Enable = 'off';
                app.StopExperimentButton_2.Enable = 'off';
                app.SkipCurrentStageButton.Enable = 'off';
                app.SkipCurrentStageButton_2.Enable = 'off';
                
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
                app.ReferenceSampleMassgramsSpinner_2.Enable = 'on';
                app.TestSampleMassgramsSpinner.Enable = 'on';
                app.TestSampleMassgramsSpinner_2.Enable = 'on';
                
            end
            
            drawnow
        end
        
        function refreshStagingInfo(app, stageCounter, currentModeText)
            drawnow nocallbacks
            
            % Update the stage counter to indicate the current stage
            app.CurrentStageEditField.Value = stageCounter;
            
            % Update the mode display to indicate the current mode of the stage
            app.CurrentModeEditField.Value = currentModeText;
            
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
            app.ElapsedTimeEditField.Value = datestr(elapsedSerialDate, 'HH:MM:SS.FFF');
            
            try
                elapsedStageSerialDate = currentSerialDate - app.liveData.LatestStageSerialDate;
                app.CurrentStage_ElapsedTimeEditField.Value...
                    = datestr(elapsedStageSerialDate, 'HH:MM:SS.FFF');
            catch
                app.CurrentStage_ElapsedTimeEditField.Value = 'NaN';
            end
            
            try
                estimatedTimeRemainingSerialDate...
                    = sec2date(app.stageController.EstimatedStageDuration) - elapsedStageSerialDate;
                app.CurrentStage_EstimatedTimeRemainingEditField.Value...
                    = datestr(estimatedTimeRemainingSerialDate, 'HH:MM:SS.FFF');
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
                    app.TargetTemperatureEditField_2.Value = targetTemp;
                    
                case 'Kelvin'
                    app.TargetTemperatureEditField.Value = cel2kel(targetTemp);
                    app.TargetTemperatureEditField_2.Value = cel2kel(targetTemp);
            end
            
            switch app.TemperatureUnits
                case 'Celsius'
                    app.ReferenceTemperatureEditField.Value = temp_Ref;
                    app.ReferenceTemperatureEditField_2.Value = temp_Ref;
                    
                case 'Kelvin'
                    app.ReferenceTemperatureEditField.Value = cel2kel(temp_Ref);
                    app.ReferenceTemperatureEditField_2.Value = cel2kel(temp_Ref);
            end
            
            switch app.TemperatureUnits
                case 'Celsius'
                    app.TestSampleTemperatureEditField.Value = temp_Samp;
                    app.TestSampleTemperatureEditField_2.Value = temp_Samp;
                    
                case 'Kelvin'
                    app.TestSampleTemperatureEditField.Value = cel2kel(temp_Samp);
                    app.TestSampleTemperatureEditField_2.Value = cel2kel(temp_Samp);
            end
            
            app.ReferenceCurrentEditField.Value = current_Ref;
            app.ReferenceCurrentEditField_2.Value = current_Ref;
            
            app.TestSampleCurrentEditField.Value = current_Samp;
            app.TestSampleCurrentEditField_2.Value = current_Samp;
            
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
                app.ReferenceSpecificHeatJgKSpinner_2.Value = app.analysisData.ReferenceSampleData.SpecificHeat;
                
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
                app.ReferenceSpecificHeatJgKSpinner_2.Enable = 'on';
                
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
                app.ReferenceSpecificHeatJgKSpinner_2.Enable = 'off';
                
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
                app.TemperatureSensorSelectionButtonGroup.SelectedObject = app.ThermocoupleButton;
                
                app.ThermocoupleConfigurationPanel.Visible = 'on';
                app.PlatinumRTDConfigurationPanel.Visible = 'off';
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
                    app.CalibrationSampleCelsiusEditFieldLabel.Text = 'Amps';
                    app.CalibrationSampleKelvinEditFieldLabel.Text = 'N/A';
                    app.CalibrationActualTempPanel.Title = 'Actual Current (A)';
                    app.CalibrationActualLabel.Text = 'Enter the actual current:';
                    app.CalibrationSampleKelvinEditFieldLabel_2.Text = 'Amps';
                    app.OffsetdeltaKLabel.Text = 'Offset (A)';
                    app.CalibrationDataPanel.Title = 'Reference Sample Current Sensor Calibration Data';
                    app.CalibrationOffsetPanel.Title = 'Reference Sample Calibration Offset';
                    app.CalibrationOffsetLabel.Text = 'Reference Sample Current Calibration Offset (delta A)';
                    
                    % Update the temperature values displayed in the calibration panel
                    app.CalibrationSampleCelsiusEditField.Value = app.Calibration_Measured;
                    app.CalibrationSampleKelvinEditField.Value = 0;
                    
                    app.CalibrationDataUITable.ColumnName = {'Measured Current (A)', 'Actual Current (A)', 'Offset'};
                    
                case app.CurrentTestSampleButton
                    app.CalibrationSampleCelsiusEditFieldLabel.Text = 'Amps';
                    app.CalibrationSampleKelvinEditFieldLabel.Text = 'N/A';
                    app.CalibrationActualTempPanel.Title = 'Actual Current (A)';
                    app.CalibrationActualLabel.Text = 'Enter the actual current:';
                    app.CalibrationSampleKelvinEditFieldLabel_2.Text = 'Amps';
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
                    
                else
                    app.SystemStatusLamp.Color = 'r';
                    
                end
                
                if app.stageController.ExperimentInProgress
                    app.InitializeDAQBoxButton_2.Enable = 'off';
                    app.InitializeDAQBoxButton.Enable = 'off';
                    
                    app.LoadConfigFileButton.Enable = 'off';
                    app.LoadDefaultConfigButton.Enable = 'off';
                    
                    app.ThermocoupleButton.Enable = 'off';
                    app.PlatinumRTDButton.Enable = 'off';
                    
                    app.TakeMeasurementButton.Enable = 'off';
                    
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

        % Button pushed function: StartExperimentButton, 
        % StartExperimentButton_2
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
                    
                    app.DataSaveStatus = true;
                    
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
                    
                otherwise
                    app.refreshMaintenanceUI();
                    app.refreshOperationUI();
            end
            
        end

        % Value changed function: ReferenceSpecificHeatJgKSpinner
        function ReferenceSampleSpecificHeatSpinnerValueChanged(app, event)
            app.liveData.ReferenceSampleData.SpecificHeat = app.ReferenceSpecificHeatJgKSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: ReferenceSampleMassgramsSpinner, 
        % ReferenceSampleMassgramsSpinner_2
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

        % Value changed function: TestSampleMassgramsSpinner, 
        % TestSampleMassgramsSpinner_2
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

        % Button pushed function: StopExperimentButton, 
        % StopExperimentButton_2
        function StopExperimentButtonPushed(app, event)
            app.StartExperimentButton.Enable = 'off';
            app.StartExperimentButton_2.Enable = 'off';
            app.StopExperimentButton.Enable = 'off';
            app.StopExperimentButton_2.Enable = 'off';
            app.SkipCurrentStageButton.Enable = 'off';
            app.SkipCurrentStageButton_2.Enable = 'off';
            drawnow nocallbacks
            
            % Stop the currently running experiment
            app.stopExperiment();
            
            app.refreshOperationUI(); % Update the UI with the new values
            
            drawnow
            
        end

        % Selection changed function: 
        % TemperatureSensorSelectionButtonGroup
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

        % Value changed function: ThermocoupleTypeDropDown
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

        % Value changed function: RTDResistenceohmSpinner
        function RTDResistenceohmSpinnerValueChanged(app, event)
            app.RTDResistance = app.RTDResistenceohmSpinner.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: TemperatureUnitsSwitch
        function TemperatureUnitsSwitchValueChanged(app, event)
            app.TemperatureUnits = app.TemperatureUnitsSwitch.Value;
            
            app.refreshOperationUnits() % Update the Units displayed on the UI
            
        end

        % Value changed function: RTDTypeDropDown
        function RTDTypeDropDownValueChanged(app, event)
            app.RTDType = app.RTDTypeDropDown.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: RTDConfigurationDropDown
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
            [temp_Ref, temp_Samp, current_Ref, current_Samp] = app.daqBox.getSingleScanData();
            
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

        % Value changed function: ReferenceSampleMaterialEditField, 
        % ReferenceSampleMaterialEditField_2
        function ReferenceSampleMaterialEditFieldValueChanged(app, event)
            app.SampleMaterial_Reference = app.ReferenceSampleMaterialEditField.Value;
            
            app.daqBox.ConfigSaveStatus = false;
            app.SystemConfigStatus = false;
            
            app.refreshMaintenanceUI();
            app.refreshOperationUI();
            
        end

        % Value changed function: TestSampleMaterialEditField, 
        % TestSampleMaterialEditField_2
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
            
        end

        % Button pushed function: CancelButton
        function CancelButtonPushed(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.AddaStagePanel.Visible = 'off';
            
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
            
        end

        % Button pushed function: CancelButton_2
        function CancelButton_2Pushed(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.EditaStagePanel.Visible = 'off';
            
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
            
        end

        % Button pushed function: CancelButton_3
        function CancelButton_3Pushed(app, event)
            % Update the values displayed in the staging table
            app.refreshStagingTable();
            
            app.RemoveaStagePanel.Visible = 'off';
            
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
            app.StopExperimentButton_2.Enable = 'off';
            app.SkipCurrentStageButton.Enable = 'off';
            app.SkipCurrentStageButton_2.Enable = 'off';
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
                    
                    app.daqBox.ConfigSaveStatus = false;
                    app.SystemConfigStatus = false;
                    
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
            app.StopExperimentButton_2.Enable = 'off';
            
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

        % Value changed function: ReferenceSpecificHeatJgKSpinner_2
        function ReferenceSpecificHeatJgKSpinner_2ValueChanged(app, event)
            app.analysisData.ReferenceSampleData.SpecificHeat = app.ReferenceSpecificHeatJgKSpinner_2.Value;
            
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
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [10 10 1260 640];
            app.UIFigure.Name = 'UI Figure';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.SelectionChangedFcn = createCallbackFcn(app, @TabGroupSelectionChanged, true);
            app.TabGroup.Position = [1 1 1260 640];

            % Create OperationTab
            app.OperationTab = uitab(app.TabGroup);
            app.OperationTab.Title = 'Operation';
            app.OperationTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create UIAxesSamples
            app.UIAxesSamples = uiaxes(app.OperationTab);
            title(app.UIAxesSamples, 'Sample Heat Flow vs. Time')
            xlabel(app.UIAxesSamples, 'Time (sec)')
            ylabel(app.UIAxesSamples, 'Heat Flow (W/g)')
            app.UIAxesSamples.PlotBoxAspectRatio = [2.02185792349727 1 1];
            app.UIAxesSamples.Box = 'on';
            app.UIAxesSamples.XGrid = 'on';
            app.UIAxesSamples.YGrid = 'on';
            app.UIAxesSamples.Position = [11 6 420 240];

            % Create UIAxesDifferential
            app.UIAxesDifferential = uiaxes(app.OperationTab);
            title(app.UIAxesDifferential, 'Differential Heat Flow vs. Time')
            xlabel(app.UIAxesDifferential, 'Time (sec)')
            ylabel(app.UIAxesDifferential, '\Delta Heat Flow (W/g)')
            app.UIAxesDifferential.Box = 'on';
            app.UIAxesDifferential.XGrid = 'on';
            app.UIAxesDifferential.YGrid = 'on';
            app.UIAxesDifferential.Position = [441 6 810 420];

            % Create ClearDataButton
            app.ClearDataButton = uibutton(app.OperationTab, 'push');
            app.ClearDataButton.ButtonPushedFcn = createCallbackFcn(app, @ClearDataButtonPushed, true);
            app.ClearDataButton.BackgroundColor = [1 1 0];
            app.ClearDataButton.Position = [141 496 120 30];
            app.ClearDataButton.Text = 'Clear Data';

            % Create SaveDataToFileButton
            app.SaveDataToFileButton = uibutton(app.OperationTab, 'push');
            app.SaveDataToFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveDataToFileButtonPushed, true);
            app.SaveDataToFileButton.BackgroundColor = [0 1 1];
            app.SaveDataToFileButton.Position = [11 496 120 30];
            app.SaveDataToFileButton.Text = 'Save Data To File';

            % Create StartExperimentButton
            app.StartExperimentButton = uibutton(app.OperationTab, 'push');
            app.StartExperimentButton.ButtonPushedFcn = createCallbackFcn(app, @StartExperimentButtonPushed, true);
            app.StartExperimentButton.BackgroundColor = [0 1 0];
            app.StartExperimentButton.Enable = 'off';
            app.StartExperimentButton.Position = [141 576 120 30];
            app.StartExperimentButton.Text = 'Start Experiment';

            % Create StopExperimentButton
            app.StopExperimentButton = uibutton(app.OperationTab, 'push');
            app.StopExperimentButton.ButtonPushedFcn = createCallbackFcn(app, @StopExperimentButtonPushed, true);
            app.StopExperimentButton.BackgroundColor = [1 0 0];
            app.StopExperimentButton.Enable = 'off';
            app.StopExperimentButton.Position = [141 536 120 30];
            app.StopExperimentButton.Text = 'Stop Experiment';

            % Create ReferenceSampleLiveDataPanel
            app.ReferenceSampleLiveDataPanel = uipanel(app.OperationTab);
            app.ReferenceSampleLiveDataPanel.Title = 'Reference Sample Live Data';
            app.ReferenceSampleLiveDataPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ReferenceSampleLiveDataPanel.FontWeight = 'bold';
            app.ReferenceSampleLiveDataPanel.Position = [1071 526 190 90];

            % Create ReferenceCurrentEditField
            app.ReferenceCurrentEditField = uieditfield(app.ReferenceSampleLiveDataPanel, 'numeric');
            app.ReferenceCurrentEditField.ValueDisplayFormat = '%.2f';
            app.ReferenceCurrentEditField.Editable = 'off';
            app.ReferenceCurrentEditField.Position = [11 38 60 22];

            % Create ReferenceTemperatureEditField
            app.ReferenceTemperatureEditField = uieditfield(app.ReferenceSampleLiveDataPanel, 'numeric');
            app.ReferenceTemperatureEditField.ValueDisplayFormat = '%.2f';
            app.ReferenceTemperatureEditField.Editable = 'off';
            app.ReferenceTemperatureEditField.Position = [11 8 60 22];

            % Create ReferenceCurrentGaugeLabel
            app.ReferenceCurrentGaugeLabel = uilabel(app.ReferenceSampleLiveDataPanel);
            app.ReferenceCurrentGaugeLabel.Position = [81 38 100 22];
            app.ReferenceCurrentGaugeLabel.Text = 'Current (A)';

            % Create ReferenceTemperatureGaugeLabel
            app.ReferenceTemperatureGaugeLabel = uilabel(app.ReferenceSampleLiveDataPanel);
            app.ReferenceTemperatureGaugeLabel.Position = [81 8 100 22];
            app.ReferenceTemperatureGaugeLabel.Text = 'Temperature (C)';

            % Create TestSampleLiveDataPanel
            app.TestSampleLiveDataPanel = uipanel(app.OperationTab);
            app.TestSampleLiveDataPanel.Title = 'Test Sample Live Data';
            app.TestSampleLiveDataPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TestSampleLiveDataPanel.FontWeight = 'bold';
            app.TestSampleLiveDataPanel.Position = [1071 426 190 90];

            % Create TestSampleCurrentEditField
            app.TestSampleCurrentEditField = uieditfield(app.TestSampleLiveDataPanel, 'numeric');
            app.TestSampleCurrentEditField.ValueDisplayFormat = '%.2f';
            app.TestSampleCurrentEditField.Editable = 'off';
            app.TestSampleCurrentEditField.Position = [11 38 60 22];

            % Create TestSampleTemperatureEditField
            app.TestSampleTemperatureEditField = uieditfield(app.TestSampleLiveDataPanel, 'numeric');
            app.TestSampleTemperatureEditField.ValueDisplayFormat = '%.2f';
            app.TestSampleTemperatureEditField.Editable = 'off';
            app.TestSampleTemperatureEditField.Position = [11 8 60 22];

            % Create TestSampleCurrentGaugeLabel
            app.TestSampleCurrentGaugeLabel = uilabel(app.TestSampleLiveDataPanel);
            app.TestSampleCurrentGaugeLabel.Position = [81 38 100 22];
            app.TestSampleCurrentGaugeLabel.Text = 'Current (A)';

            % Create TestSampleTemperatureGaugeLabel
            app.TestSampleTemperatureGaugeLabel = uilabel(app.TestSampleLiveDataPanel);
            app.TestSampleTemperatureGaugeLabel.Position = [81 8 93 22];
            app.TestSampleTemperatureGaugeLabel.Text = 'Temperature (C)';

            % Create InitializeDAQBoxButton
            app.InitializeDAQBoxButton = uibutton(app.OperationTab, 'push');
            app.InitializeDAQBoxButton.ButtonPushedFcn = createCallbackFcn(app, @StartDAQSessionsButtonPushed, true);
            app.InitializeDAQBoxButton.Enable = 'off';
            app.InitializeDAQBoxButton.Position = [11 576 120 30];
            app.InitializeDAQBoxButton.Text = 'Initialize DAQ Box';

            % Create ControlStagingConfigurationPanel
            app.ControlStagingConfigurationPanel = uipanel(app.OperationTab);
            app.ControlStagingConfigurationPanel.Title = 'Control Staging Configuration';
            app.ControlStagingConfigurationPanel.FontWeight = 'bold';
            app.ControlStagingConfigurationPanel.Position = [11 256 420 230];

            % Create AddaStageButton
            app.AddaStageButton = uibutton(app.ControlStagingConfigurationPanel, 'push');
            app.AddaStageButton.ButtonPushedFcn = createCallbackFcn(app, @AddaStageButtonPushed, true);
            app.AddaStageButton.Position = [71 178 100 22];
            app.AddaStageButton.Text = 'Add a Stage';

            % Create EditaStageButton
            app.EditaStageButton = uibutton(app.ControlStagingConfigurationPanel, 'push');
            app.EditaStageButton.ButtonPushedFcn = createCallbackFcn(app, @EditaStageButtonPushed, true);
            app.EditaStageButton.Position = [181 178 100 22];
            app.EditaStageButton.Text = 'Edit a Stage';

            % Create TempControlStagingUITable
            app.TempControlStagingUITable = uitable(app.ControlStagingConfigurationPanel);
            app.TempControlStagingUITable.ColumnName = {'Stage'; 'Start Temp (*C)'; 'Rate (C/min)'; 'End Temp (*C)'; 'Hold Time (sec)'};
            app.TempControlStagingUITable.ColumnWidth = {40, 90, 80, 90, 'auto'};
            app.TempControlStagingUITable.RowName = {};
            app.TempControlStagingUITable.CellSelectionCallback = createCallbackFcn(app, @TempControlStagingUITableCellSelection, true);
            app.TempControlStagingUITable.Position = [11 10 400 130];

            % Create RemoveaStageButton
            app.RemoveaStageButton = uibutton(app.ControlStagingConfigurationPanel, 'push');
            app.RemoveaStageButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveaStageButtonPushed, true);
            app.RemoveaStageButton.Position = [291 178 100 22];
            app.RemoveaStageButton.Text = 'Remove a Stage';

            % Create CurrentStageLabel
            app.CurrentStageLabel = uilabel(app.ControlStagingConfigurationPanel);
            app.CurrentStageLabel.Position = [51 148 100 22];
            app.CurrentStageLabel.Text = '<< Current Stage';

            % Create CurrentStageEditField
            app.CurrentStageEditField = uieditfield(app.ControlStagingConfigurationPanel, 'numeric');
            app.CurrentStageEditField.ValueDisplayFormat = '%.0f';
            app.CurrentStageEditField.Editable = 'off';
            app.CurrentStageEditField.Position = [11 148 40 22];

            % Create CurrentModeLabel
            app.CurrentModeLabel = uilabel(app.ControlStagingConfigurationPanel);
            app.CurrentModeLabel.HorizontalAlignment = 'right';
            app.CurrentModeLabel.Position = [151 148 100 22];
            app.CurrentModeLabel.Text = 'Current Mode >>';

            % Create CurrentModeEditField
            app.CurrentModeEditField = uieditfield(app.ControlStagingConfigurationPanel, 'text');
            app.CurrentModeEditField.Editable = 'off';
            app.CurrentModeEditField.Position = [251 148 160 22];
            app.CurrentModeEditField.Value = 'Off';

            % Create AddaStagePanel
            app.AddaStagePanel = uipanel(app.OperationTab);
            app.AddaStagePanel.Title = 'Add a Stage';
            app.AddaStagePanel.BackgroundColor = [0.902 0.902 0.902];
            app.AddaStagePanel.FontWeight = 'bold';
            app.AddaStagePanel.Position = [481 155 260 221];

            % Create StageNumberDropDownLabel
            app.StageNumberDropDownLabel = uilabel(app.AddaStagePanel);
            app.StageNumberDropDownLabel.HorizontalAlignment = 'right';
            app.StageNumberDropDownLabel.Position = [52 169 83 22];
            app.StageNumberDropDownLabel.Text = 'Stage Number';

            % Create StageNumberDropDown
            app.StageNumberDropDown = uidropdown(app.AddaStagePanel);
            app.StageNumberDropDown.Items = {'1'};
            app.StageNumberDropDown.Position = [150 169 100 22];
            app.StageNumberDropDown.Value = '1';

            % Create StartTempEditFieldLabel
            app.StartTempEditFieldLabel = uilabel(app.AddaStagePanel);
            app.StartTempEditFieldLabel.HorizontalAlignment = 'right';
            app.StartTempEditFieldLabel.Position = [47 139 88 22];
            app.StartTempEditFieldLabel.Text = 'Start Temp (*C)';

            % Create StartTempEditField
            app.StartTempEditField = uieditfield(app.AddaStagePanel, 'numeric');
            app.StartTempEditField.Position = [150 139 100 22];

            % Create RampUpRateCminEditFieldLabel
            app.RampUpRateCminEditFieldLabel = uilabel(app.AddaStagePanel);
            app.RampUpRateCminEditFieldLabel.HorizontalAlignment = 'right';
            app.RampUpRateCminEditFieldLabel.Position = [7 109 128 22];
            app.RampUpRateCminEditFieldLabel.Text = 'Ramp Up Rate (C/min)';

            % Create RampUpRateCminEditField
            app.RampUpRateCminEditField = uieditfield(app.AddaStagePanel, 'numeric');
            app.RampUpRateCminEditField.Position = [150 109 100 22];

            % Create EndTempEditFieldLabel
            app.EndTempEditFieldLabel = uilabel(app.AddaStagePanel);
            app.EndTempEditFieldLabel.HorizontalAlignment = 'right';
            app.EndTempEditFieldLabel.Position = [51 79 84 22];
            app.EndTempEditFieldLabel.Text = 'End Temp (*C)';

            % Create EndTempEditField
            app.EndTempEditField = uieditfield(app.AddaStagePanel, 'numeric');
            app.EndTempEditField.Position = [150 79 100 22];

            % Create HoldTimeEditFieldLabel
            app.HoldTimeEditFieldLabel = uilabel(app.AddaStagePanel);
            app.HoldTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.HoldTimeEditFieldLabel.Position = [45 49 90 22];
            app.HoldTimeEditFieldLabel.Text = 'Hold Time (sec)';

            % Create HoldTimeEditField
            app.HoldTimeEditField = uieditfield(app.AddaStagePanel, 'numeric');
            app.HoldTimeEditField.Position = [150 49 100 22];

            % Create AddStageButton
            app.AddStageButton = uibutton(app.AddaStagePanel, 'push');
            app.AddStageButton.ButtonPushedFcn = createCallbackFcn(app, @AddStageButtonPushed, true);
            app.AddStageButton.Position = [21 9 100 22];
            app.AddStageButton.Text = 'Add Stage';

            % Create CancelButton
            app.CancelButton = uibutton(app.AddaStagePanel, 'push');
            app.CancelButton.ButtonPushedFcn = createCallbackFcn(app, @CancelButtonPushed, true);
            app.CancelButton.Position = [141 9 100 22];
            app.CancelButton.Text = 'Cancel';

            % Create EditaStagePanel
            app.EditaStagePanel = uipanel(app.OperationTab);
            app.EditaStagePanel.Title = 'Edit a Stage';
            app.EditaStagePanel.Visible = 'off';
            app.EditaStagePanel.BackgroundColor = [0.902 0.902 0.902];
            app.EditaStagePanel.FontWeight = 'bold';
            app.EditaStagePanel.Position = [481 155 260 221];

            % Create StageNumberDropDown_2Label
            app.StageNumberDropDown_2Label = uilabel(app.EditaStagePanel);
            app.StageNumberDropDown_2Label.HorizontalAlignment = 'right';
            app.StageNumberDropDown_2Label.Position = [52 169 83 22];
            app.StageNumberDropDown_2Label.Text = 'Stage Number';

            % Create StageNumberDropDown_2
            app.StageNumberDropDown_2 = uidropdown(app.EditaStagePanel);
            app.StageNumberDropDown_2.Items = {'1'};
            app.StageNumberDropDown_2.ValueChangedFcn = createCallbackFcn(app, @StageNumberDropDown_2ValueChanged, true);
            app.StageNumberDropDown_2.Position = [150 169 100 22];
            app.StageNumberDropDown_2.Value = '1';

            % Create StartTempEditField_2Label
            app.StartTempEditField_2Label = uilabel(app.EditaStagePanel);
            app.StartTempEditField_2Label.HorizontalAlignment = 'right';
            app.StartTempEditField_2Label.Position = [47 139 88 22];
            app.StartTempEditField_2Label.Text = 'Start Temp (*C)';

            % Create StartTempEditField_2
            app.StartTempEditField_2 = uieditfield(app.EditaStagePanel, 'numeric');
            app.StartTempEditField_2.Position = [150 139 100 22];

            % Create RampUpRateCminEditField_2Label
            app.RampUpRateCminEditField_2Label = uilabel(app.EditaStagePanel);
            app.RampUpRateCminEditField_2Label.HorizontalAlignment = 'right';
            app.RampUpRateCminEditField_2Label.Position = [7 109 128 22];
            app.RampUpRateCminEditField_2Label.Text = 'Ramp Up Rate (C/min)';

            % Create RampUpRateCminEditField_2
            app.RampUpRateCminEditField_2 = uieditfield(app.EditaStagePanel, 'numeric');
            app.RampUpRateCminEditField_2.Position = [150 109 100 22];

            % Create EndTempEditField_2Label
            app.EndTempEditField_2Label = uilabel(app.EditaStagePanel);
            app.EndTempEditField_2Label.HorizontalAlignment = 'right';
            app.EndTempEditField_2Label.Position = [51 79 84 22];
            app.EndTempEditField_2Label.Text = 'End Temp (*C)';

            % Create EndTempEditField_2
            app.EndTempEditField_2 = uieditfield(app.EditaStagePanel, 'numeric');
            app.EndTempEditField_2.Position = [150 79 100 22];

            % Create HoldTimeEditField_2Label
            app.HoldTimeEditField_2Label = uilabel(app.EditaStagePanel);
            app.HoldTimeEditField_2Label.HorizontalAlignment = 'right';
            app.HoldTimeEditField_2Label.Position = [45 49 90 22];
            app.HoldTimeEditField_2Label.Text = 'Hold Time (sec)';

            % Create HoldTimeEditField_2
            app.HoldTimeEditField_2 = uieditfield(app.EditaStagePanel, 'numeric');
            app.HoldTimeEditField_2.Position = [150 49 100 22];

            % Create ApplyChangesButton
            app.ApplyChangesButton = uibutton(app.EditaStagePanel, 'push');
            app.ApplyChangesButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyChangesButtonPushed, true);
            app.ApplyChangesButton.Position = [21 9 100 22];
            app.ApplyChangesButton.Text = 'Apply Changes';

            % Create CancelButton_2
            app.CancelButton_2 = uibutton(app.EditaStagePanel, 'push');
            app.CancelButton_2.ButtonPushedFcn = createCallbackFcn(app, @CancelButton_2Pushed, true);
            app.CancelButton_2.Position = [141 9 100 22];
            app.CancelButton_2.Text = 'Cancel';

            % Create RemoveaStagePanel
            app.RemoveaStagePanel = uipanel(app.OperationTab);
            app.RemoveaStagePanel.Title = 'Remove a Stage';
            app.RemoveaStagePanel.Visible = 'off';
            app.RemoveaStagePanel.BackgroundColor = [0.902 0.902 0.902];
            app.RemoveaStagePanel.FontWeight = 'bold';
            app.RemoveaStagePanel.Position = [481 155 260 221];

            % Create StageNumberDropDown_3Label
            app.StageNumberDropDown_3Label = uilabel(app.RemoveaStagePanel);
            app.StageNumberDropDown_3Label.HorizontalAlignment = 'right';
            app.StageNumberDropDown_3Label.Position = [52 169 83 22];
            app.StageNumberDropDown_3Label.Text = 'Stage Number';

            % Create StageNumberDropDown_3
            app.StageNumberDropDown_3 = uidropdown(app.RemoveaStagePanel);
            app.StageNumberDropDown_3.Items = {'1'};
            app.StageNumberDropDown_3.ValueChangedFcn = createCallbackFcn(app, @StageNumberDropDown_3ValueChanged, true);
            app.StageNumberDropDown_3.Position = [150 169 100 22];
            app.StageNumberDropDown_3.Value = '1';

            % Create StartTempEditField_3Label
            app.StartTempEditField_3Label = uilabel(app.RemoveaStagePanel);
            app.StartTempEditField_3Label.HorizontalAlignment = 'right';
            app.StartTempEditField_3Label.Position = [47 139 88 22];
            app.StartTempEditField_3Label.Text = 'Start Temp (*C)';

            % Create StartTempEditField_3
            app.StartTempEditField_3 = uieditfield(app.RemoveaStagePanel, 'numeric');
            app.StartTempEditField_3.Editable = 'off';
            app.StartTempEditField_3.Position = [150 139 100 22];

            % Create RampUpRateCminEditField_3Label
            app.RampUpRateCminEditField_3Label = uilabel(app.RemoveaStagePanel);
            app.RampUpRateCminEditField_3Label.HorizontalAlignment = 'right';
            app.RampUpRateCminEditField_3Label.Position = [7 109 128 22];
            app.RampUpRateCminEditField_3Label.Text = 'Ramp Up Rate (C/min)';

            % Create RampUpRateCminEditField_3
            app.RampUpRateCminEditField_3 = uieditfield(app.RemoveaStagePanel, 'numeric');
            app.RampUpRateCminEditField_3.Editable = 'off';
            app.RampUpRateCminEditField_3.Position = [150 109 100 22];

            % Create EndTempEditField_3Label
            app.EndTempEditField_3Label = uilabel(app.RemoveaStagePanel);
            app.EndTempEditField_3Label.HorizontalAlignment = 'right';
            app.EndTempEditField_3Label.Position = [51 79 84 22];
            app.EndTempEditField_3Label.Text = 'End Temp (*C)';

            % Create EndTempEditField_3
            app.EndTempEditField_3 = uieditfield(app.RemoveaStagePanel, 'numeric');
            app.EndTempEditField_3.Editable = 'off';
            app.EndTempEditField_3.Position = [150 79 100 22];

            % Create HoldTimeEditField_3Label
            app.HoldTimeEditField_3Label = uilabel(app.RemoveaStagePanel);
            app.HoldTimeEditField_3Label.HorizontalAlignment = 'right';
            app.HoldTimeEditField_3Label.Position = [45 49 90 22];
            app.HoldTimeEditField_3Label.Text = 'Hold Time (sec)';

            % Create HoldTimeEditField_3
            app.HoldTimeEditField_3 = uieditfield(app.RemoveaStagePanel, 'numeric');
            app.HoldTimeEditField_3.Editable = 'off';
            app.HoldTimeEditField_3.Position = [150 49 100 22];

            % Create RemoveStageButton
            app.RemoveStageButton = uibutton(app.RemoveaStagePanel, 'push');
            app.RemoveStageButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveStageButtonPushed, true);
            app.RemoveStageButton.Position = [21 9 100 22];
            app.RemoveStageButton.Text = 'Remove Stage';

            % Create CancelButton_3
            app.CancelButton_3 = uibutton(app.RemoveaStagePanel, 'push');
            app.CancelButton_3.ButtonPushedFcn = createCallbackFcn(app, @CancelButton_3Pushed, true);
            app.CancelButton_3.Position = [141 9 100 22];
            app.CancelButton_3.Text = 'Cancel';

            % Create CurrentStageClocksPanel
            app.CurrentStageClocksPanel = uipanel(app.OperationTab);
            app.CurrentStageClocksPanel.Title = 'Current Stage Clocks';
            app.CurrentStageClocksPanel.FontWeight = 'bold';
            app.CurrentStageClocksPanel.Position = [641 426 250 90];

            % Create ElapsedTimeLabel
            app.ElapsedTimeLabel = uilabel(app.CurrentStageClocksPanel);
            app.ElapsedTimeLabel.HorizontalAlignment = 'right';
            app.ElapsedTimeLabel.Position = [73 38 88 22];
            app.ElapsedTimeLabel.Text = {'Elapsed Time: '; ''};

            % Create CurrentStage_ElapsedTimeEditField
            app.CurrentStage_ElapsedTimeEditField = uieditfield(app.CurrentStageClocksPanel, 'text');
            app.CurrentStage_ElapsedTimeEditField.Editable = 'off';
            app.CurrentStage_ElapsedTimeEditField.HorizontalAlignment = 'right';
            app.CurrentStage_ElapsedTimeEditField.Position = [161 38 80 22];
            app.CurrentStage_ElapsedTimeEditField.Value = '00:00:00.000';

            % Create CurrentStage_EstimatedTimeRemainingLabel
            app.CurrentStage_EstimatedTimeRemainingLabel = uilabel(app.CurrentStageClocksPanel);
            app.CurrentStage_EstimatedTimeRemainingLabel.HorizontalAlignment = 'right';
            app.CurrentStage_EstimatedTimeRemainingLabel.Position = [1 8 160 22];
            app.CurrentStage_EstimatedTimeRemainingLabel.Text = {'Estimated Time Remaining: '; ''};

            % Create CurrentStage_EstimatedTimeRemainingEditField
            app.CurrentStage_EstimatedTimeRemainingEditField = uieditfield(app.CurrentStageClocksPanel, 'text');
            app.CurrentStage_EstimatedTimeRemainingEditField.Editable = 'off';
            app.CurrentStage_EstimatedTimeRemainingEditField.HorizontalAlignment = 'right';
            app.CurrentStage_EstimatedTimeRemainingEditField.Position = [161 8 80 22];
            app.CurrentStage_EstimatedTimeRemainingEditField.Value = '00:00:00.000';

            % Create ExperimentClockPanel
            app.ExperimentClockPanel = uipanel(app.OperationTab);
            app.ExperimentClockPanel.Title = 'Experiment Clock';
            app.ExperimentClockPanel.FontWeight = 'bold';
            app.ExperimentClockPanel.Position = [911 426 140 60];

            % Create ElapsedTimeEditFieldLabel
            app.ElapsedTimeEditFieldLabel = uilabel(app.ExperimentClockPanel);
            app.ElapsedTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.ElapsedTimeEditFieldLabel.Position = [11 8 40 22];
            app.ElapsedTimeEditFieldLabel.Text = {'Time: '; ''};

            % Create ElapsedTimeEditField
            app.ElapsedTimeEditField = uieditfield(app.ExperimentClockPanel, 'text');
            app.ElapsedTimeEditField.Editable = 'off';
            app.ElapsedTimeEditField.HorizontalAlignment = 'right';
            app.ElapsedTimeEditField.Position = [51 8 80 22];
            app.ElapsedTimeEditField.Value = '00:00:00.000';

            % Create SkipCurrentStageButton
            app.SkipCurrentStageButton = uibutton(app.OperationTab, 'push');
            app.SkipCurrentStageButton.ButtonPushedFcn = createCallbackFcn(app, @SkipCurrentStageButtonPushed, true);
            app.SkipCurrentStageButton.BackgroundColor = [0.9294 0.6902 0.1294];
            app.SkipCurrentStageButton.Enable = 'off';
            app.SkipCurrentStageButton.Position = [11 536 120 30];
            app.SkipCurrentStageButton.Text = 'Skip Current Stage';

            % Create ReferenceSamplePropertiesPanel_2
            app.ReferenceSamplePropertiesPanel_2 = uipanel(app.OperationTab);
            app.ReferenceSamplePropertiesPanel_2.Title = 'Reference Sample Properties';
            app.ReferenceSamplePropertiesPanel_2.FontWeight = 'bold';
            app.ReferenceSamplePropertiesPanel_2.Position = [271 496 310 120];

            % Create ReferenceSampleMassgramsSpinner_2Label
            app.ReferenceSampleMassgramsSpinner_2Label = uilabel(app.ReferenceSamplePropertiesPanel_2);
            app.ReferenceSampleMassgramsSpinner_2Label.HorizontalAlignment = 'right';
            app.ReferenceSampleMassgramsSpinner_2Label.Position = [11 38 190 22];
            app.ReferenceSampleMassgramsSpinner_2Label.Text = 'Reference Sample Mass (grams)';

            % Create ReferenceSampleMassgramsSpinner_2
            app.ReferenceSampleMassgramsSpinner_2 = uispinner(app.ReferenceSamplePropertiesPanel_2);
            app.ReferenceSampleMassgramsSpinner_2.Step = 0.001;
            app.ReferenceSampleMassgramsSpinner_2.ValueDisplayFormat = '%.3f';
            app.ReferenceSampleMassgramsSpinner_2.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleMassgramsSpinnerValueChanged, true);
            app.ReferenceSampleMassgramsSpinner_2.Position = [211 38 90 22];
            app.ReferenceSampleMassgramsSpinner_2.Value = 0.001;

            % Create ReferenceSpecificHeatJgKSpinnerLabel
            app.ReferenceSpecificHeatJgKSpinnerLabel = uilabel(app.ReferenceSamplePropertiesPanel_2);
            app.ReferenceSpecificHeatJgKSpinnerLabel.HorizontalAlignment = 'right';
            app.ReferenceSpecificHeatJgKSpinnerLabel.Position = [18 8 183 22];
            app.ReferenceSpecificHeatJgKSpinnerLabel.Text = 'Reference Specific Heat (J/(g*K))';

            % Create ReferenceSpecificHeatJgKSpinner
            app.ReferenceSpecificHeatJgKSpinner = uispinner(app.ReferenceSamplePropertiesPanel_2);
            app.ReferenceSpecificHeatJgKSpinner.Step = 0.001;
            app.ReferenceSpecificHeatJgKSpinner.ValueDisplayFormat = '%.3f';
            app.ReferenceSpecificHeatJgKSpinner.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleSpecificHeatSpinnerValueChanged, true);
            app.ReferenceSpecificHeatJgKSpinner.Position = [211 8 90 22];
            app.ReferenceSpecificHeatJgKSpinner.Value = 1;

            % Create ReferenceSampleMaterialEditFieldLabel_2
            app.ReferenceSampleMaterialEditFieldLabel_2 = uilabel(app.ReferenceSamplePropertiesPanel_2);
            app.ReferenceSampleMaterialEditFieldLabel_2.HorizontalAlignment = 'right';
            app.ReferenceSampleMaterialEditFieldLabel_2.Position = [11 68 110 22];
            app.ReferenceSampleMaterialEditFieldLabel_2.Text = 'Sample Material';

            % Create ReferenceSampleMaterialEditField_2
            app.ReferenceSampleMaterialEditField_2 = uieditfield(app.ReferenceSamplePropertiesPanel_2, 'text');
            app.ReferenceSampleMaterialEditField_2.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleMaterialEditFieldValueChanged, true);
            app.ReferenceSampleMaterialEditField_2.Position = [126 68 175 22];
            app.ReferenceSampleMaterialEditField_2.Value = 'Unknown';

            % Create TestSamplePropertiesPanel_2
            app.TestSamplePropertiesPanel_2 = uipanel(app.OperationTab);
            app.TestSamplePropertiesPanel_2.Title = 'Test Sample Properties';
            app.TestSamplePropertiesPanel_2.FontWeight = 'bold';
            app.TestSamplePropertiesPanel_2.Position = [591 526 300 90];

            % Create TestSampleMassgramsSpinner_2Label
            app.TestSampleMassgramsSpinner_2Label = uilabel(app.TestSamplePropertiesPanel_2);
            app.TestSampleMassgramsSpinner_2Label.HorizontalAlignment = 'right';
            app.TestSampleMassgramsSpinner_2Label.Position = [11 8 180 22];
            app.TestSampleMassgramsSpinner_2Label.Text = 'Test Sample Mass (grams)';

            % Create TestSampleMassgramsSpinner_2
            app.TestSampleMassgramsSpinner_2 = uispinner(app.TestSamplePropertiesPanel_2);
            app.TestSampleMassgramsSpinner_2.Step = 0.001;
            app.TestSampleMassgramsSpinner_2.ValueDisplayFormat = '%.3f';
            app.TestSampleMassgramsSpinner_2.ValueChangedFcn = createCallbackFcn(app, @TestSampleMassgramsSpinnerValueChanged, true);
            app.TestSampleMassgramsSpinner_2.Position = [201 8 90 22];
            app.TestSampleMassgramsSpinner_2.Value = 0.001;

            % Create TestSampleMaterialEditFieldLabel_2
            app.TestSampleMaterialEditFieldLabel_2 = uilabel(app.TestSamplePropertiesPanel_2);
            app.TestSampleMaterialEditFieldLabel_2.HorizontalAlignment = 'right';
            app.TestSampleMaterialEditFieldLabel_2.Position = [11 38 100 22];
            app.TestSampleMaterialEditFieldLabel_2.Text = 'Sample Material';

            % Create TestSampleMaterialEditField_2
            app.TestSampleMaterialEditField_2 = uieditfield(app.TestSamplePropertiesPanel_2, 'text');
            app.TestSampleMaterialEditField_2.ValueChangedFcn = createCallbackFcn(app, @TestSampleMaterialEditFieldValueChanged, true);
            app.TestSampleMaterialEditField_2.Position = [116 38 175 22];
            app.TestSampleMaterialEditField_2.Value = 'Unknown';

            % Create XAxisDataPanel
            app.XAxisDataPanel = uipanel(app.OperationTab);
            app.XAxisDataPanel.Title = 'X-Axis Data';
            app.XAxisDataPanel.FontWeight = 'bold';
            app.XAxisDataPanel.Position = [911 496 140 50];

            % Create XAxisDataSwitch
            app.XAxisDataSwitch = uiswitch(app.XAxisDataPanel, 'slider');
            app.XAxisDataSwitch.Items = {'Time', 'Temp'};
            app.XAxisDataSwitch.ValueChangedFcn = createCallbackFcn(app, @XAxisDataSwitchValueChanged, true);
            app.XAxisDataSwitch.Position = [47 5 45 20];
            app.XAxisDataSwitch.Value = 'Temp';

            % Create LoadStagingFileButton
            app.LoadStagingFileButton = uibutton(app.OperationTab, 'push');
            app.LoadStagingFileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadStagingFileButtonPushed, true);
            app.LoadStagingFileButton.BackgroundColor = [0.302 0.749 0.9294];
            app.LoadStagingFileButton.Position = [451 464 120 22];
            app.LoadStagingFileButton.Text = 'Load Staging File';

            % Create SaveStagingFileButton
            app.SaveStagingFileButton = uibutton(app.OperationTab, 'push');
            app.SaveStagingFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveStagingFileButtonPushed, true);
            app.SaveStagingFileButton.BackgroundColor = [0 1 1];
            app.SaveStagingFileButton.Position = [451 434 120 22];
            app.SaveStagingFileButton.Text = 'Save Staging File';

            % Create TargetTemperatureLiveDataPanel
            app.TargetTemperatureLiveDataPanel = uipanel(app.OperationTab);
            app.TargetTemperatureLiveDataPanel.Title = 'Target Temperature Live Data';
            app.TargetTemperatureLiveDataPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TargetTemperatureLiveDataPanel.FontWeight = 'bold';
            app.TargetTemperatureLiveDataPanel.Position = [901 556 160 60];

            % Create TargetTemperatureEditField
            app.TargetTemperatureEditField = uieditfield(app.TargetTemperatureLiveDataPanel, 'numeric');
            app.TargetTemperatureEditField.ValueDisplayFormat = '%.2f';
            app.TargetTemperatureEditField.Editable = 'off';
            app.TargetTemperatureEditField.Position = [11 8 60 22];

            % Create TargetTemperatureGaugeLabel
            app.TargetTemperatureGaugeLabel = uilabel(app.TargetTemperatureLiveDataPanel);
            app.TargetTemperatureGaugeLabel.Position = [81 8 70 22];
            app.TargetTemperatureGaugeLabel.Text = 'Temp. (C)';

            % Create LiveTemperatureDataTab
            app.LiveTemperatureDataTab = uitab(app.TabGroup);
            app.LiveTemperatureDataTab.Title = 'Live Temperature Data';

            % Create UIAxesTemperatures
            app.UIAxesTemperatures = uiaxes(app.LiveTemperatureDataTab);
            title(app.UIAxesTemperatures, 'Temperature vs. Time')
            xlabel(app.UIAxesTemperatures, 'Time (s)')
            ylabel(app.UIAxesTemperatures, 'Temperature (\circC)')
            app.UIAxesTemperatures.PlotBoxAspectRatio = [1.86355140186916 1 1];
            app.UIAxesTemperatures.Box = 'on';
            app.UIAxesTemperatures.XGrid = 'on';
            app.UIAxesTemperatures.YGrid = 'on';
            app.UIAxesTemperatures.Position = [11 11 1230 595];

            % Create ReferenceSampleLiveDataPanel_2
            app.ReferenceSampleLiveDataPanel_2 = uipanel(app.LiveTemperatureDataTab);
            app.ReferenceSampleLiveDataPanel_2.Title = 'Reference Sample Live Data';
            app.ReferenceSampleLiveDataPanel_2.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ReferenceSampleLiveDataPanel_2.FontWeight = 'bold';
            app.ReferenceSampleLiveDataPanel_2.Position = [1071 526 190 90];

            % Create ReferenceCurrentEditField_2
            app.ReferenceCurrentEditField_2 = uieditfield(app.ReferenceSampleLiveDataPanel_2, 'numeric');
            app.ReferenceCurrentEditField_2.ValueDisplayFormat = '%.2f';
            app.ReferenceCurrentEditField_2.Editable = 'off';
            app.ReferenceCurrentEditField_2.Position = [11 38 60 22];

            % Create ReferenceTemperatureEditField_2
            app.ReferenceTemperatureEditField_2 = uieditfield(app.ReferenceSampleLiveDataPanel_2, 'numeric');
            app.ReferenceTemperatureEditField_2.ValueDisplayFormat = '%.2f';
            app.ReferenceTemperatureEditField_2.Editable = 'off';
            app.ReferenceTemperatureEditField_2.Position = [11 8 60 22];

            % Create ReferenceCurrentGaugeLabel_2
            app.ReferenceCurrentGaugeLabel_2 = uilabel(app.ReferenceSampleLiveDataPanel_2);
            app.ReferenceCurrentGaugeLabel_2.Position = [81 38 100 22];
            app.ReferenceCurrentGaugeLabel_2.Text = 'Current (A)';

            % Create ReferenceTemperatureGaugeLabel_2
            app.ReferenceTemperatureGaugeLabel_2 = uilabel(app.ReferenceSampleLiveDataPanel_2);
            app.ReferenceTemperatureGaugeLabel_2.Position = [81 8 100 22];
            app.ReferenceTemperatureGaugeLabel_2.Text = 'Temperature (C)';

            % Create TestSampleLiveDataPanel_2
            app.TestSampleLiveDataPanel_2 = uipanel(app.LiveTemperatureDataTab);
            app.TestSampleLiveDataPanel_2.Title = 'Test Sample Live Data';
            app.TestSampleLiveDataPanel_2.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TestSampleLiveDataPanel_2.FontWeight = 'bold';
            app.TestSampleLiveDataPanel_2.Position = [1071 426 190 90];

            % Create TestSampleCurrentEditField_2
            app.TestSampleCurrentEditField_2 = uieditfield(app.TestSampleLiveDataPanel_2, 'numeric');
            app.TestSampleCurrentEditField_2.ValueDisplayFormat = '%.2f';
            app.TestSampleCurrentEditField_2.Editable = 'off';
            app.TestSampleCurrentEditField_2.Position = [11 38 60 22];

            % Create TestSampleTemperatureEditField_2
            app.TestSampleTemperatureEditField_2 = uieditfield(app.TestSampleLiveDataPanel_2, 'numeric');
            app.TestSampleTemperatureEditField_2.ValueDisplayFormat = '%.2f';
            app.TestSampleTemperatureEditField_2.Editable = 'off';
            app.TestSampleTemperatureEditField_2.Position = [11 8 60 22];

            % Create TestSampleCurrentGaugeLabel_2
            app.TestSampleCurrentGaugeLabel_2 = uilabel(app.TestSampleLiveDataPanel_2);
            app.TestSampleCurrentGaugeLabel_2.Position = [81 38 100 22];
            app.TestSampleCurrentGaugeLabel_2.Text = 'Current (A)';

            % Create TestSampleTemperatureGaugeLabel_2
            app.TestSampleTemperatureGaugeLabel_2 = uilabel(app.TestSampleLiveDataPanel_2);
            app.TestSampleTemperatureGaugeLabel_2.Position = [81 8 100 22];
            app.TestSampleTemperatureGaugeLabel_2.Text = 'Temperature (C)';

            % Create TargetTemperatureLiveDataPanel_2
            app.TargetTemperatureLiveDataPanel_2 = uipanel(app.LiveTemperatureDataTab);
            app.TargetTemperatureLiveDataPanel_2.Title = 'Target Temperature Live Data';
            app.TargetTemperatureLiveDataPanel_2.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TargetTemperatureLiveDataPanel_2.FontWeight = 'bold';
            app.TargetTemperatureLiveDataPanel_2.Position = [1071 356 190 60];

            % Create TargetTemperatureEditField_2
            app.TargetTemperatureEditField_2 = uieditfield(app.TargetTemperatureLiveDataPanel_2, 'numeric');
            app.TargetTemperatureEditField_2.ValueDisplayFormat = '%.2f';
            app.TargetTemperatureEditField_2.Editable = 'off';
            app.TargetTemperatureEditField_2.Position = [11 8 60 22];

            % Create TargetTemperatureGaugeLabel_2
            app.TargetTemperatureGaugeLabel_2 = uilabel(app.TargetTemperatureLiveDataPanel_2);
            app.TargetTemperatureGaugeLabel_2.Position = [81 8 100 22];
            app.TargetTemperatureGaugeLabel_2.Text = 'Temperature (C)';

            % Create TemperatureUnitsPanel
            app.TemperatureUnitsPanel = uipanel(app.LiveTemperatureDataTab);
            app.TemperatureUnitsPanel.Title = 'Temperature Units';
            app.TemperatureUnitsPanel.Visible = 'off';
            app.TemperatureUnitsPanel.FontWeight = 'bold';
            app.TemperatureUnitsPanel.Position = [1090 160 140 50];

            % Create TemperatureUnitsSwitch
            app.TemperatureUnitsSwitch = uiswitch(app.TemperatureUnitsPanel, 'slider');
            app.TemperatureUnitsSwitch.Items = {'Kelvin', 'Celsius'};
            app.TemperatureUnitsSwitch.ValueChangedFcn = createCallbackFcn(app, @TemperatureUnitsSwitchValueChanged, true);
            app.TemperatureUnitsSwitch.Position = [47 5 45 20];
            app.TemperatureUnitsSwitch.Value = 'Celsius';

            % Create StartExperimentButton_2
            app.StartExperimentButton_2 = uibutton(app.LiveTemperatureDataTab, 'push');
            app.StartExperimentButton_2.ButtonPushedFcn = createCallbackFcn(app, @StartExperimentButtonPushed, true);
            app.StartExperimentButton_2.BackgroundColor = [0 1 0];
            app.StartExperimentButton_2.Enable = 'off';
            app.StartExperimentButton_2.Position = [1131 316 120 30];
            app.StartExperimentButton_2.Text = 'Start Experiment';

            % Create StopExperimentButton_2
            app.StopExperimentButton_2 = uibutton(app.LiveTemperatureDataTab, 'push');
            app.StopExperimentButton_2.ButtonPushedFcn = createCallbackFcn(app, @StopExperimentButtonPushed, true);
            app.StopExperimentButton_2.BackgroundColor = [1 0 0];
            app.StopExperimentButton_2.Enable = 'off';
            app.StopExperimentButton_2.Position = [1131 236 120 30];
            app.StopExperimentButton_2.Text = 'Stop Experiment';

            % Create SkipCurrentStageButton_2
            app.SkipCurrentStageButton_2 = uibutton(app.LiveTemperatureDataTab, 'push');
            app.SkipCurrentStageButton_2.BackgroundColor = [0.9294 0.6902 0.1294];
            app.SkipCurrentStageButton_2.Enable = 'off';
            app.SkipCurrentStageButton_2.Position = [1131 276 120 30];
            app.SkipCurrentStageButton_2.Text = 'Skip Current Stage';

            % Create AnalysisTab
            app.AnalysisTab = uitab(app.TabGroup);
            app.AnalysisTab.Title = 'Analysis';

            % Create UIAxesDataAnalysis
            app.UIAxesDataAnalysis = uiaxes(app.AnalysisTab);
            title(app.UIAxesDataAnalysis, 'Differential Heat Flow Rate vs. Time')
            xlabel(app.UIAxesDataAnalysis, 'Time (sec)')
            ylabel(app.UIAxesDataAnalysis, 'Heat Flow Rate (W/g)')
            app.UIAxesDataAnalysis.PlotBoxAspectRatio = [2.20714285714286 1 1];
            app.UIAxesDataAnalysis.Box = 'on';
            app.UIAxesDataAnalysis.XGrid = 'on';
            app.UIAxesDataAnalysis.YGrid = 'on';
            app.UIAxesDataAnalysis.Position = [271 6 980 480];

            % Create ImportDataFromOperationButton
            app.ImportDataFromOperationButton = uibutton(app.AnalysisTab, 'push');
            app.ImportDataFromOperationButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataFromOperationButtonPushed, true);
            app.ImportDataFromOperationButton.BackgroundColor = [1 1 1];
            app.ImportDataFromOperationButton.FontSize = 16;
            app.ImportDataFromOperationButton.Position = [11 496 250 30];
            app.ImportDataFromOperationButton.Text = 'Import Data From Operation';

            % Create ImportDataFromMATFileButton
            app.ImportDataFromMATFileButton = uibutton(app.AnalysisTab, 'push');
            app.ImportDataFromMATFileButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataFromMATFileButtonPushed, true);
            app.ImportDataFromMATFileButton.BackgroundColor = [1 1 1];
            app.ImportDataFromMATFileButton.FontSize = 16;
            app.ImportDataFromMATFileButton.Position = [11 536 250 30];
            app.ImportDataFromMATFileButton.Text = 'Import Data From MAT File';

            % Create DataSetOpttionsPanel
            app.DataSetOpttionsPanel = uipanel(app.AnalysisTab);
            app.DataSetOpttionsPanel.Title = 'Data Set Opttions';
            app.DataSetOpttionsPanel.Position = [11 396 250 90];

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
            app.XAxisDataButtonGroup = uibuttongroup(app.AnalysisTab);
            app.XAxisDataButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @XAxisDataButtonGroupSelectionChanged, true);
            app.XAxisDataButtonGroup.Title = 'X-Axis Data';
            app.XAxisDataButtonGroup.Position = [11 286 250 100];

            % Create TimesecButton
            app.TimesecButton = uiradiobutton(app.XAxisDataButtonGroup);
            app.TimesecButton.Text = 'Time (sec)';
            app.TimesecButton.Position = [11 54 78 22];
            app.TimesecButton.Value = true;

            % Create TemperatureCButton_X
            app.TemperatureCButton_X = uiradiobutton(app.XAxisDataButtonGroup);
            app.TemperatureCButton_X.Text = 'Temperature (C)';
            app.TemperatureCButton_X.Position = [11 32 109 22];

            % Create TemperatureKButton_X
            app.TemperatureKButton_X = uiradiobutton(app.XAxisDataButtonGroup);
            app.TemperatureKButton_X.Text = 'Temperature (K)';
            app.TemperatureKButton_X.Position = [11 10 109 22];

            % Create YAxisDataButtonGroup
            app.YAxisDataButtonGroup = uibuttongroup(app.AnalysisTab);
            app.YAxisDataButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @YAxisDataButtonGroupSelectionChanged, true);
            app.YAxisDataButtonGroup.Title = 'Y-Axis Data';
            app.YAxisDataButtonGroup.Position = [11 156 250 120];

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
            app.TempErrorInstructionsTextArea = uitextarea(app.AnalysisTab);
            app.TempErrorInstructionsTextArea.Editable = 'off';
            app.TempErrorInstructionsTextArea.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TempErrorInstructionsTextArea.Position = [11 106 250 50];
            app.TempErrorInstructionsTextArea.Value = {'* "Temperature Error" refers to the difference between the measured temperature for a given sample and the target temperature.'};

            % Create RefreshPlotButton
            app.RefreshPlotButton = uibutton(app.AnalysisTab, 'push');
            app.RefreshPlotButton.ButtonPushedFcn = createCallbackFcn(app, @RefreshPlotButtonPushed, true);
            app.RefreshPlotButton.BackgroundColor = [1 1 1];
            app.RefreshPlotButton.FontSize = 16;
            app.RefreshPlotButton.Position = [11 16 250 30];
            app.RefreshPlotButton.Text = 'Refresh Plot';

            % Create DataLoadingTextArea
            app.DataLoadingTextArea = uitextarea(app.AnalysisTab);
            app.DataLoadingTextArea.Editable = 'off';
            app.DataLoadingTextArea.HorizontalAlignment = 'center';
            app.DataLoadingTextArea.FontSize = 48;
            app.DataLoadingTextArea.Visible = 'off';
            app.DataLoadingTextArea.Position = [431 256 400 120];
            app.DataLoadingTextArea.Value = {'Data Loading...'; 'Please wait'};

            % Create ReferenceSamplePropertiesPanel
            app.ReferenceSamplePropertiesPanel = uipanel(app.AnalysisTab);
            app.ReferenceSamplePropertiesPanel.Title = 'Reference Sample Properties';
            app.ReferenceSamplePropertiesPanel.FontWeight = 'bold';
            app.ReferenceSamplePropertiesPanel.Position = [641 496 310 120];

            % Create ReferenceSampleMassgramsSpinnerLabel
            app.ReferenceSampleMassgramsSpinnerLabel = uilabel(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSampleMassgramsSpinnerLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleMassgramsSpinnerLabel.Position = [11 38 190 22];
            app.ReferenceSampleMassgramsSpinnerLabel.Text = 'Reference Sample Mass (grams)';

            % Create ReferenceSampleMassgramsSpinner
            app.ReferenceSampleMassgramsSpinner = uispinner(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSampleMassgramsSpinner.Step = 0.001;
            app.ReferenceSampleMassgramsSpinner.ValueDisplayFormat = '%.3f';
            app.ReferenceSampleMassgramsSpinner.ValueChangedFcn = createCallbackFcn(app, @ReferenceSampleMassgramsSpinnerValueChanged, true);
            app.ReferenceSampleMassgramsSpinner.Position = [211 38 90 22];
            app.ReferenceSampleMassgramsSpinner.Value = 0.001;

            % Create ReferenceSpecificHeatJgKSpinner_2Label
            app.ReferenceSpecificHeatJgKSpinner_2Label = uilabel(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSpecificHeatJgKSpinner_2Label.HorizontalAlignment = 'right';
            app.ReferenceSpecificHeatJgKSpinner_2Label.Position = [18 8 183 22];
            app.ReferenceSpecificHeatJgKSpinner_2Label.Text = 'Reference Specific Heat (J/(g*K))';

            % Create ReferenceSpecificHeatJgKSpinner_2
            app.ReferenceSpecificHeatJgKSpinner_2 = uispinner(app.ReferenceSamplePropertiesPanel);
            app.ReferenceSpecificHeatJgKSpinner_2.Step = 0.001;
            app.ReferenceSpecificHeatJgKSpinner_2.ValueDisplayFormat = '%.3f';
            app.ReferenceSpecificHeatJgKSpinner_2.ValueChangedFcn = createCallbackFcn(app, @ReferenceSpecificHeatJgKSpinner_2ValueChanged, true);
            app.ReferenceSpecificHeatJgKSpinner_2.Position = [211 8 90 22];
            app.ReferenceSpecificHeatJgKSpinner_2.Value = 1;

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
            app.TestSamplePropertiesPanel = uipanel(app.AnalysisTab);
            app.TestSamplePropertiesPanel.Title = 'Test Sample Properties';
            app.TestSamplePropertiesPanel.FontWeight = 'bold';
            app.TestSamplePropertiesPanel.Position = [961 496 300 120];

            % Create TestSampleMassgramsSpinnerLabel
            app.TestSampleMassgramsSpinnerLabel = uilabel(app.TestSamplePropertiesPanel);
            app.TestSampleMassgramsSpinnerLabel.HorizontalAlignment = 'right';
            app.TestSampleMassgramsSpinnerLabel.Position = [11 38 180 22];
            app.TestSampleMassgramsSpinnerLabel.Text = 'Test Sample Mass (grams)';

            % Create TestSampleMassgramsSpinner
            app.TestSampleMassgramsSpinner = uispinner(app.TestSamplePropertiesPanel);
            app.TestSampleMassgramsSpinner.Step = 0.001;
            app.TestSampleMassgramsSpinner.ValueDisplayFormat = '%.3f';
            app.TestSampleMassgramsSpinner.ValueChangedFcn = createCallbackFcn(app, @TestSampleMassgramsSpinnerValueChanged, true);
            app.TestSampleMassgramsSpinner.Position = [201 38 90 22];
            app.TestSampleMassgramsSpinner.Value = 0.001;

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

            % Create SaveAnalysisDataToExcelFileButton
            app.SaveAnalysisDataToExcelFileButton = uibutton(app.AnalysisTab, 'push');
            app.SaveAnalysisDataToExcelFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveAnalysisDataToExcelFileButtonPushed, true);
            app.SaveAnalysisDataToExcelFileButton.BackgroundColor = [0 1 1];
            app.SaveAnalysisDataToExcelFileButton.FontSize = 16;
            app.SaveAnalysisDataToExcelFileButton.Position = [271 576 250 30];
            app.SaveAnalysisDataToExcelFileButton.Text = 'Save Data To Excel File';

            % Create ImportDataFromExcelFileButton
            app.ImportDataFromExcelFileButton = uibutton(app.AnalysisTab, 'push');
            app.ImportDataFromExcelFileButton.ButtonPushedFcn = createCallbackFcn(app, @ImportDataFromExcelFileButtonPushed, true);
            app.ImportDataFromExcelFileButton.BackgroundColor = [1 1 1];
            app.ImportDataFromExcelFileButton.FontSize = 16;
            app.ImportDataFromExcelFileButton.Position = [11 576 250 30];
            app.ImportDataFromExcelFileButton.Text = 'Import Data From Excel File';

            % Create SaveAnalysisDataToMATFileButton
            app.SaveAnalysisDataToMATFileButton = uibutton(app.AnalysisTab, 'push');
            app.SaveAnalysisDataToMATFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveAnalysisDataToMATFileButtonPushed, true);
            app.SaveAnalysisDataToMATFileButton.BackgroundColor = [0 1 1];
            app.SaveAnalysisDataToMATFileButton.FontSize = 16;
            app.SaveAnalysisDataToMATFileButton.Position = [271 536 250 30];
            app.SaveAnalysisDataToMATFileButton.Text = 'Save Data To MAT File';

            % Create MaintenanceTab
            app.MaintenanceTab = uitab(app.TabGroup);
            app.MaintenanceTab.Title = 'Maintenance';

            % Create LoadConfigFileButton
            app.LoadConfigFileButton = uibutton(app.MaintenanceTab, 'push');
            app.LoadConfigFileButton.ButtonPushedFcn = createCallbackFcn(app, @LoadConfigFileButtonPushed, true);
            app.LoadConfigFileButton.BackgroundColor = [0.302 0.749 0.9294];
            app.LoadConfigFileButton.FontSize = 16;
            app.LoadConfigFileButton.Position = [11 576 160 30];
            app.LoadConfigFileButton.Text = 'Load Config File';

            % Create LoadDefaultConfigButton
            app.LoadDefaultConfigButton = uibutton(app.MaintenanceTab, 'push');
            app.LoadDefaultConfigButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDefaultConfigButtonPushed, true);
            app.LoadDefaultConfigButton.BackgroundColor = [1 1 0];
            app.LoadDefaultConfigButton.FontSize = 16;
            app.LoadDefaultConfigButton.Position = [351 576 160 30];
            app.LoadDefaultConfigButton.Text = 'Load Default Config';

            % Create DAQBoxConfigurationPanel
            app.DAQBoxConfigurationPanel = uipanel(app.MaintenanceTab);
            app.DAQBoxConfigurationPanel.Title = 'DAQ Box Configuration';
            app.DAQBoxConfigurationPanel.FontWeight = 'bold';
            app.DAQBoxConfigurationPanel.Position = [11 336 420 230];

            % Create InitializeDAQBoxButton_2
            app.InitializeDAQBoxButton_2 = uibutton(app.DAQBoxConfigurationPanel, 'push');
            app.InitializeDAQBoxButton_2.ButtonPushedFcn = createCallbackFcn(app, @StartDAQSessionsButtonPushed, true);
            app.InitializeDAQBoxButton_2.Position = [281 170 120 30];
            app.InitializeDAQBoxButton_2.Text = 'Initialize DAQ Box';

            % Create DAQBoxStatusLabel
            app.DAQBoxStatusLabel = uilabel(app.DAQBoxConfigurationPanel);
            app.DAQBoxStatusLabel.HorizontalAlignment = 'right';
            app.DAQBoxStatusLabel.Position = [281 138 93 22];
            app.DAQBoxStatusLabel.Text = 'DAQ Box Status';

            % Create DAQStatusLamp
            app.DAQStatusLamp = uilamp(app.DAQBoxConfigurationPanel);
            app.DAQStatusLamp.Position = [381 140 20 20];
            app.DAQStatusLamp.Color = [1 0 0];

            % Create TemperatureSensorSelectionButtonGroup
            app.TemperatureSensorSelectionButtonGroup = uibuttongroup(app.DAQBoxConfigurationPanel);
            app.TemperatureSensorSelectionButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @TemperatureSensorSelectionButtonGroupSelectionChanged, true);
            app.TemperatureSensorSelectionButtonGroup.Title = 'Temperature Sensor Selection';
            app.TemperatureSensorSelectionButtonGroup.FontWeight = 'bold';
            app.TemperatureSensorSelectionButtonGroup.Position = [11 140 240 60];

            % Create ThermocoupleButton
            app.ThermocoupleButton = uiradiobutton(app.TemperatureSensorSelectionButtonGroup);
            app.ThermocoupleButton.Text = 'Thermocouple';
            app.ThermocoupleButton.Position = [21 8 99 22];
            app.ThermocoupleButton.Value = true;

            % Create PlatinumRTDButton
            app.PlatinumRTDButton = uiradiobutton(app.TemperatureSensorSelectionButtonGroup);
            app.PlatinumRTDButton.Enable = 'off';
            app.PlatinumRTDButton.Text = 'Platinum RTD';
            app.PlatinumRTDButton.Position = [131 8 96 22];

            % Create ThermocoupleConfigurationPanel
            app.ThermocoupleConfigurationPanel = uipanel(app.DAQBoxConfigurationPanel);
            app.ThermocoupleConfigurationPanel.Title = 'Thermocouple Configuration';
            app.ThermocoupleConfigurationPanel.FontWeight = 'bold';
            app.ThermocoupleConfigurationPanel.Position = [10 10 260 120];

            % Create ThermocoupleTypeDropDownLabel
            app.ThermocoupleTypeDropDownLabel = uilabel(app.ThermocoupleConfigurationPanel);
            app.ThermocoupleTypeDropDownLabel.HorizontalAlignment = 'right';
            app.ThermocoupleTypeDropDownLabel.Position = [11 68 112 22];
            app.ThermocoupleTypeDropDownLabel.Text = 'Thermocouple Type';

            % Create ThermocoupleTypeDropDown
            app.ThermocoupleTypeDropDown = uidropdown(app.ThermocoupleConfigurationPanel);
            app.ThermocoupleTypeDropDown.Items = {'Type J', 'Type K'};
            app.ThermocoupleTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @ThermocoupleTypeDropDownValueChanged, true);
            app.ThermocoupleTypeDropDown.Enable = 'off';
            app.ThermocoupleTypeDropDown.Position = [138 68 100 22];
            app.ThermocoupleTypeDropDown.Value = 'Type K';

            % Create PlatinumRTDConfigurationPanel
            app.PlatinumRTDConfigurationPanel = uipanel(app.DAQBoxConfigurationPanel);
            app.PlatinumRTDConfigurationPanel.Title = 'Platinum RTD Configuration';
            app.PlatinumRTDConfigurationPanel.Visible = 'off';
            app.PlatinumRTDConfigurationPanel.FontWeight = 'bold';
            app.PlatinumRTDConfigurationPanel.Position = [10 10 260 120];

            % Create RTDResistenceohmSpinnerLabel
            app.RTDResistenceohmSpinnerLabel = uilabel(app.PlatinumRTDConfigurationPanel);
            app.RTDResistenceohmSpinnerLabel.HorizontalAlignment = 'right';
            app.RTDResistenceohmSpinnerLabel.Position = [21 8 127 22];
            app.RTDResistenceohmSpinnerLabel.Text = 'RTD Resistence (ohm)';

            % Create RTDResistenceohmSpinner
            app.RTDResistenceohmSpinner = uispinner(app.PlatinumRTDConfigurationPanel);
            app.RTDResistenceohmSpinner.ValueChangedFcn = createCallbackFcn(app, @RTDResistenceohmSpinnerValueChanged, true);
            app.RTDResistenceohmSpinner.Enable = 'off';
            app.RTDResistenceohmSpinner.Position = [151 8 100 22];
            app.RTDResistenceohmSpinner.Value = 100;

            % Create RTDTypeDropDownLabel
            app.RTDTypeDropDownLabel = uilabel(app.PlatinumRTDConfigurationPanel);
            app.RTDTypeDropDownLabel.HorizontalAlignment = 'right';
            app.RTDTypeDropDownLabel.Position = [79 68 56 22];
            app.RTDTypeDropDownLabel.Text = 'RTDType';

            % Create RTDTypeDropDown
            app.RTDTypeDropDown = uidropdown(app.PlatinumRTDConfigurationPanel);
            app.RTDTypeDropDown.Items = {'Pt3750', 'Pt3851', 'Pt3911', 'Pt3916', 'Pt3920', 'Pt3928'};
            app.RTDTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @RTDTypeDropDownValueChanged, true);
            app.RTDTypeDropDown.Enable = 'off';
            app.RTDTypeDropDown.Position = [150 68 100 22];
            app.RTDTypeDropDown.Value = 'Pt3851';

            % Create RTDConfigurationDropDownLabel
            app.RTDConfigurationDropDownLabel = uilabel(app.PlatinumRTDConfigurationPanel);
            app.RTDConfigurationDropDownLabel.HorizontalAlignment = 'right';
            app.RTDConfigurationDropDownLabel.Position = [30 38 105 22];
            app.RTDConfigurationDropDownLabel.Text = 'RTD Configuration';

            % Create RTDConfigurationDropDown
            app.RTDConfigurationDropDown = uidropdown(app.PlatinumRTDConfigurationPanel);
            app.RTDConfigurationDropDown.Items = {'TwoWire', 'ThreeWire', 'FourWire'};
            app.RTDConfigurationDropDown.ValueChangedFcn = createCallbackFcn(app, @RTDConfigurationDropDownValueChanged, true);
            app.RTDConfigurationDropDown.Enable = 'off';
            app.RTDConfigurationDropDown.Position = [150 38 100 22];
            app.RTDConfigurationDropDown.Value = 'ThreeWire';

            % Create TemperatureControlsPanel
            app.TemperatureControlsPanel = uipanel(app.MaintenanceTab);
            app.TemperatureControlsPanel.Title = 'Temperature Controls';
            app.TemperatureControlsPanel.FontWeight = 'bold';
            app.TemperatureControlsPanel.Position = [11 126 310 70];

            % Create MaxTempLimitCelsiusSpinnerLabel
            app.MaxTempLimitCelsiusSpinnerLabel = uilabel(app.TemperatureControlsPanel);
            app.MaxTempLimitCelsiusSpinnerLabel.HorizontalAlignment = 'right';
            app.MaxTempLimitCelsiusSpinnerLabel.Position = [11 18 180 22];
            app.MaxTempLimitCelsiusSpinnerLabel.Text = 'Max Temp Limit (Celsius)';

            % Create MaxTempLimitCelsiusSpinner
            app.MaxTempLimitCelsiusSpinner = uispinner(app.TemperatureControlsPanel);
            app.MaxTempLimitCelsiusSpinner.Step = 0.01;
            app.MaxTempLimitCelsiusSpinner.ValueDisplayFormat = '%.2f';
            app.MaxTempLimitCelsiusSpinner.ValueChangedFcn = createCallbackFcn(app, @MaxTempLimitCelsiusSpinnerValueChanged, true);
            app.MaxTempLimitCelsiusSpinner.Position = [201 18 100 22];
            app.MaxTempLimitCelsiusSpinner.Value = 150;

            % Create SensorCalibrationPanel
            app.SensorCalibrationPanel = uipanel(app.MaintenanceTab);
            app.SensorCalibrationPanel.Title = 'Sensor Calibration';
            app.SensorCalibrationPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.SensorCalibrationPanel.FontWeight = 'bold';
            app.SensorCalibrationPanel.Position = [801 26 450 580];

            % Create TakeMeasurementButton
            app.TakeMeasurementButton = uibutton(app.SensorCalibrationPanel, 'push');
            app.TakeMeasurementButton.ButtonPushedFcn = createCallbackFcn(app, @TakeMeasurementButtonPushed, true);
            app.TakeMeasurementButton.BackgroundColor = [0.502 1 0.502];
            app.TakeMeasurementButton.Enable = 'off';
            app.TakeMeasurementButton.Position = [11 519 210 30];
            app.TakeMeasurementButton.Text = 'Take Measurement';

            % Create CalibrationSamplePanel
            app.CalibrationSamplePanel = uipanel(app.SensorCalibrationPanel);
            app.CalibrationSamplePanel.Title = 'Sensor Reading';
            app.CalibrationSamplePanel.FontWeight = 'bold';
            app.CalibrationSamplePanel.Position = [11 419 210 90];

            % Create CalibrationSampleCelsiusEditFieldLabel
            app.CalibrationSampleCelsiusEditFieldLabel = uilabel(app.CalibrationSamplePanel);
            app.CalibrationSampleCelsiusEditFieldLabel.Position = [81 38 45 22];
            app.CalibrationSampleCelsiusEditFieldLabel.Text = 'Celsius';

            % Create CalibrationSampleCelsiusEditField
            app.CalibrationSampleCelsiusEditField = uieditfield(app.CalibrationSamplePanel, 'numeric');
            app.CalibrationSampleCelsiusEditField.ValueDisplayFormat = '%.2f';
            app.CalibrationSampleCelsiusEditField.Editable = 'off';
            app.CalibrationSampleCelsiusEditField.Position = [11 38 60 22];

            % Create CalibrationSampleKelvinEditFieldLabel
            app.CalibrationSampleKelvinEditFieldLabel = uilabel(app.CalibrationSamplePanel);
            app.CalibrationSampleKelvinEditFieldLabel.Position = [81 8 38 22];
            app.CalibrationSampleKelvinEditFieldLabel.Text = 'Kelvin';

            % Create CalibrationSampleKelvinEditField
            app.CalibrationSampleKelvinEditField = uieditfield(app.CalibrationSamplePanel, 'numeric');
            app.CalibrationSampleKelvinEditField.ValueDisplayFormat = '%.2f';
            app.CalibrationSampleKelvinEditField.Editable = 'off';
            app.CalibrationSampleKelvinEditField.Position = [11 8 60 22];

            % Create CalibrationActualTempPanel
            app.CalibrationActualTempPanel = uipanel(app.SensorCalibrationPanel);
            app.CalibrationActualTempPanel.Title = 'Actual Temperature (K)';
            app.CalibrationActualTempPanel.FontWeight = 'bold';
            app.CalibrationActualTempPanel.Position = [231 419 210 120];

            % Create CalibrationSampleKelvinEditFieldLabel_2
            app.CalibrationSampleKelvinEditFieldLabel_2 = uilabel(app.CalibrationActualTempPanel);
            app.CalibrationSampleKelvinEditFieldLabel_2.Position = [81 38 38 22];
            app.CalibrationSampleKelvinEditFieldLabel_2.Text = 'Kelvin';

            % Create CalibrationActualTempEditField
            app.CalibrationActualTempEditField = uieditfield(app.CalibrationActualTempPanel, 'numeric');
            app.CalibrationActualTempEditField.ValueDisplayFormat = '%.2f';
            app.CalibrationActualTempEditField.ValueChangedFcn = createCallbackFcn(app, @CalibrationActualTempEditFieldValueChanged, true);
            app.CalibrationActualTempEditField.Position = [11 38 60 22];

            % Create CalibrationActualLabel
            app.CalibrationActualLabel = uilabel(app.CalibrationActualTempPanel);
            app.CalibrationActualLabel.Position = [11 68 123 22];
            app.CalibrationActualLabel.Text = 'Enter the actual temp:';

            % Create OffsetdeltaKLabel
            app.OffsetdeltaKLabel = uilabel(app.CalibrationActualTempPanel);
            app.OffsetdeltaKLabel.Position = [81 8 90 22];
            app.OffsetdeltaKLabel.Text = 'Offset (delta K)';

            % Create ActualTempOffsetEditField
            app.ActualTempOffsetEditField = uieditfield(app.CalibrationActualTempPanel, 'numeric');
            app.ActualTempOffsetEditField.ValueDisplayFormat = '%+5.2f';
            app.ActualTempOffsetEditField.Editable = 'off';
            app.ActualTempOffsetEditField.Position = [11 8 60 22];

            % Create CalibrationDataPanel
            app.CalibrationDataPanel = uipanel(app.SensorCalibrationPanel);
            app.CalibrationDataPanel.Title = 'Calibration Data';
            app.CalibrationDataPanel.FontWeight = 'bold';
            app.CalibrationDataPanel.Position = [11 159 430 180];

            % Create CalibrationDataUITable
            app.CalibrationDataUITable = uitable(app.CalibrationDataPanel);
            app.CalibrationDataUITable.ColumnName = {'Measured Temp (K)'; 'Actual Temp (K)'; 'Offset'};
            app.CalibrationDataUITable.RowName = {};
            app.CalibrationDataUITable.CellSelectionCallback = createCallbackFcn(app, @CalibrationDataUITableCellSelection, true);
            app.CalibrationDataUITable.Position = [11 50 410 100];

            % Create RemoveLatestEntryButton
            app.RemoveLatestEntryButton = uibutton(app.CalibrationDataPanel, 'push');
            app.RemoveLatestEntryButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveLatestEntryButtonPushed, true);
            app.RemoveLatestEntryButton.Position = [11 8 200 31];
            app.RemoveLatestEntryButton.Text = 'Remove Latest Entry';

            % Create ClearCalibrationDataButton
            app.ClearCalibrationDataButton = uibutton(app.CalibrationDataPanel, 'push');
            app.ClearCalibrationDataButton.ButtonPushedFcn = createCallbackFcn(app, @ClearCalibrationDataButtonPushed, true);
            app.ClearCalibrationDataButton.Position = [221 8 200 31];
            app.ClearCalibrationDataButton.Text = 'Clear Calibration Data';

            % Create AddtoCalibrationDataButton
            app.AddtoCalibrationDataButton = uibutton(app.SensorCalibrationPanel, 'push');
            app.AddtoCalibrationDataButton.ButtonPushedFcn = createCallbackFcn(app, @AddtoCalibrationDataButtonPushed, true);
            app.AddtoCalibrationDataButton.Position = [231 379 210 30];
            app.AddtoCalibrationDataButton.Text = 'Add to Calibration Data';

            % Create CalibrationOffsetPanel
            app.CalibrationOffsetPanel = uipanel(app.SensorCalibrationPanel);
            app.CalibrationOffsetPanel.Title = 'Calibration Offset';
            app.CalibrationOffsetPanel.FontWeight = 'bold';
            app.CalibrationOffsetPanel.Position = [11 19 430 100];

            % Create SaveCalibrationOffsetButton
            app.SaveCalibrationOffsetButton = uibutton(app.CalibrationOffsetPanel, 'push');
            app.SaveCalibrationOffsetButton.ButtonPushedFcn = createCallbackFcn(app, @SaveCalibrationOffsetButtonPushed, true);
            app.SaveCalibrationOffsetButton.FontSize = 16;
            app.SaveCalibrationOffsetButton.Position = [11 40 410 30];
            app.SaveCalibrationOffsetButton.Text = 'Save Calibration Offset';

            % Create CalibrationOffsetLabel
            app.CalibrationOffsetLabel = uilabel(app.CalibrationOffsetPanel);
            app.CalibrationOffsetLabel.HorizontalAlignment = 'right';
            app.CalibrationOffsetLabel.Position = [11 8 340 22];
            app.CalibrationOffsetLabel.Text = 'Reference Sample Temperature Calibration Offset (delta K):';

            % Create CalibrationOffsetEditField
            app.CalibrationOffsetEditField = uieditfield(app.CalibrationOffsetPanel, 'numeric');
            app.CalibrationOffsetEditField.ValueDisplayFormat = '%+5.2f';
            app.CalibrationOffsetEditField.Position = [361 8 60 22];

            % Create AutoCalibrateButton
            app.AutoCalibrateButton = uibutton(app.SensorCalibrationPanel, 'push');
            app.AutoCalibrateButton.ButtonPushedFcn = createCallbackFcn(app, @AutoCalibrateButtonPushed, true);
            app.AutoCalibrateButton.Position = [11 379 210 30];
            app.AutoCalibrateButton.Text = 'Auto Calibrate';

            % Create SaveConfigToFileButton
            app.SaveConfigToFileButton = uibutton(app.MaintenanceTab, 'push');
            app.SaveConfigToFileButton.ButtonPushedFcn = createCallbackFcn(app, @SaveConfigToFileButtonPushed, true);
            app.SaveConfigToFileButton.BackgroundColor = [0 1 1];
            app.SaveConfigToFileButton.FontSize = 16;
            app.SaveConfigToFileButton.Position = [181 576 160 30];
            app.SaveConfigToFileButton.Text = 'Save Config To File';

            % Create ApplyConfigChangesButton
            app.ApplyConfigChangesButton = uibutton(app.MaintenanceTab, 'push');
            app.ApplyConfigChangesButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyConfigChangesButtonPushed, true);
            app.ApplyConfigChangesButton.BackgroundColor = [0.502 1 0.502];
            app.ApplyConfigChangesButton.FontSize = 16;
            app.ApplyConfigChangesButton.Position = [21 16 200 30];
            app.ApplyConfigChangesButton.Text = 'Apply Config Changes';

            % Create SystemStatusLamp
            app.SystemStatusLamp = uilamp(app.MaintenanceTab);
            app.SystemStatusLamp.Position = [231 16 30 30];

            % Create PIDGainConstantsPanel
            app.PIDGainConstantsPanel = uipanel(app.MaintenanceTab);
            app.PIDGainConstantsPanel.Title = 'PID Gain Constants';
            app.PIDGainConstantsPanel.FontWeight = 'bold';
            app.PIDGainConstantsPanel.Position = [11 206 310 120];

            % Create KpproportionalgainSpinnerLabel
            app.KpproportionalgainSpinnerLabel = uilabel(app.PIDGainConstantsPanel);
            app.KpproportionalgainSpinnerLabel.HorizontalAlignment = 'right';
            app.KpproportionalgainSpinnerLabel.Position = [11 68 180 22];
            app.KpproportionalgainSpinnerLabel.Text = 'Kp - proportional gain';

            % Create KpproportionalgainSpinner
            app.KpproportionalgainSpinner = uispinner(app.PIDGainConstantsPanel);
            app.KpproportionalgainSpinner.Step = 0.0001;
            app.KpproportionalgainSpinner.ValueDisplayFormat = '%.5f';
            app.KpproportionalgainSpinner.ValueChangedFcn = createCallbackFcn(app, @KpproportionalgainSpinnerValueChanged, true);
            app.KpproportionalgainSpinner.Position = [201 68 100 22];

            % Create KiintegralgainSpinnerLabel
            app.KiintegralgainSpinnerLabel = uilabel(app.PIDGainConstantsPanel);
            app.KiintegralgainSpinnerLabel.HorizontalAlignment = 'right';
            app.KiintegralgainSpinnerLabel.Position = [11 38 180 22];
            app.KiintegralgainSpinnerLabel.Text = 'Ki - integral gain';

            % Create KiintegralgainSpinner
            app.KiintegralgainSpinner = uispinner(app.PIDGainConstantsPanel);
            app.KiintegralgainSpinner.Step = 0.0001;
            app.KiintegralgainSpinner.ValueDisplayFormat = '%.5f';
            app.KiintegralgainSpinner.ValueChangedFcn = createCallbackFcn(app, @KiintegralgainSpinnerValueChanged, true);
            app.KiintegralgainSpinner.Position = [201 38 100 22];

            % Create KdderivativegainSpinnerLabel
            app.KdderivativegainSpinnerLabel = uilabel(app.PIDGainConstantsPanel);
            app.KdderivativegainSpinnerLabel.HorizontalAlignment = 'right';
            app.KdderivativegainSpinnerLabel.Position = [11 8 180 22];
            app.KdderivativegainSpinnerLabel.Text = 'Kd - derivative gain';

            % Create KdderivativegainSpinner
            app.KdderivativegainSpinner = uispinner(app.PIDGainConstantsPanel);
            app.KdderivativegainSpinner.Step = 0.0001;
            app.KdderivativegainSpinner.ValueDisplayFormat = '%.5f';
            app.KdderivativegainSpinner.ValueChangedFcn = createCallbackFcn(app, @KdderivativegainSpinnerValueChanged, true);
            app.KdderivativegainSpinner.Position = [201 8 100 22];

            % Create SavedCalibrationOffsetsPanel
            app.SavedCalibrationOffsetsPanel = uipanel(app.MaintenanceTab);
            app.SavedCalibrationOffsetsPanel.Title = 'Saved Calibration Offsets';
            app.SavedCalibrationOffsetsPanel.FontWeight = 'bold';
            app.SavedCalibrationOffsetsPanel.Position = [371 26 420 150];

            % Create ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel = uilabel(app.SavedCalibrationOffsetsPanel);
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.Position = [5 97 336 22];
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKLabel.Text = 'Reference Sample Temperature Calibration Offset (delta K):';

            % Create ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField = uieditfield(app.SavedCalibrationOffsetsPanel, 'numeric');
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.ValueDisplayFormat = '%+5.2f';
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Editable = 'off';
            app.ReferenceSampleTemperatureCalibrationOffsetdeltaKEditField.Position = [351 97 60 22];

            % Create TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel = uilabel(app.SavedCalibrationOffsetsPanel);
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.HorizontalAlignment = 'right';
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.Position = [11 67 330 22];
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditFieldLabel.Text = 'Test Sample Temperature Calibration Offset (delta K):';

            % Create TestSampleTemperatureCalibrationOffsetdeltaKEditField
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField = uieditfield(app.SavedCalibrationOffsetsPanel, 'numeric');
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.ValueDisplayFormat = '%+5.2f';
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Editable = 'off';
            app.TestSampleTemperatureCalibrationOffsetdeltaKEditField.Position = [352 67 60 22];

            % Create ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel = uilabel(app.SavedCalibrationOffsetsPanel);
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.HorizontalAlignment = 'right';
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Position = [11 37 330 22];
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Text = 'Reference Sample Current Calibration Offset (delta A):';

            % Create ReferenceSampleCurrentCalibrationOffsetdeltaAEditField
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField = uieditfield(app.SavedCalibrationOffsetsPanel, 'numeric');
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.ValueDisplayFormat = '%+5.2f';
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Editable = 'off';
            app.ReferenceSampleCurrentCalibrationOffsetdeltaAEditField.Position = [351 37 60 22];

            % Create TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel = uilabel(app.SavedCalibrationOffsetsPanel);
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.HorizontalAlignment = 'right';
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Position = [11 7 330 22];
            app.TestSampleCurrentCalibrationOffsetdeltaAEditFieldLabel.Text = 'Test Sample Current Calibration Offset (delta A):';

            % Create TestSampleCurrentCalibrationOffsetdeltaAEditField
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField = uieditfield(app.SavedCalibrationOffsetsPanel, 'numeric');
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.ValueDisplayFormat = '%+5.2f';
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Editable = 'off';
            app.TestSampleCurrentCalibrationOffsetdeltaAEditField.Position = [352 7 60 22];

            % Create SelectSensortoCalibrateButtonGroup
            app.SelectSensortoCalibrateButtonGroup = uibuttongroup(app.MaintenanceTab);
            app.SelectSensortoCalibrateButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @SelectSensortoCalibrateButtonGroupSelectionChanged, true);
            app.SelectSensortoCalibrateButtonGroup.Title = 'Select Sensor to Calibrate';
            app.SelectSensortoCalibrateButtonGroup.FontWeight = 'bold';
            app.SelectSensortoCalibrateButtonGroup.Position = [581 426 210 180];

            % Create TemperatureReferenceSampleButton
            app.TemperatureReferenceSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.TemperatureReferenceSampleButton.Text = 'Temperature: Reference Sample';
            app.TemperatureReferenceSampleButton.Position = [11 125 190 24];
            app.TemperatureReferenceSampleButton.Value = true;

            % Create TemperatureTestSampleButton
            app.TemperatureTestSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.TemperatureTestSampleButton.Text = 'Temperature: Test Sample';
            app.TemperatureTestSampleButton.Position = [11 95 190 24];

            % Create CurrentReferenceSampleButton
            app.CurrentReferenceSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.CurrentReferenceSampleButton.Text = 'Current: Reference Sample';
            app.CurrentReferenceSampleButton.Position = [11 45 190 24];

            % Create CurrentTestSampleButton
            app.CurrentTestSampleButton = uitogglebutton(app.SelectSensortoCalibrateButtonGroup);
            app.CurrentTestSampleButton.Text = 'Current: Test Sample';
            app.CurrentTestSampleButton.Position = [11 15 190 24];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DSC_GUI_APP_exported

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