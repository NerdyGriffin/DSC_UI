% DSC: UI and control systems for prototype DSC system
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

classdef DSC_CUI_APP < handle
    %DSC_CUI_APP
    %   Responsible for providing a command-line user interface (CUI) for
    %   running or testing the DSC system without the GUI
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        cleanupObj
        
        stageController StageController % An object of the StageController class which is responsible for managing the temperature control and staging procedure during live experiments
        
        daqBox DAQBox % An object of the DAQBox class which represents the DAQ Box and provides support for inputs and outputs
        
        liveData DSCData % An object of the DSCData class which is responsible to storing and maintaining data while an experiment is running
        
        analysisData DSCData % An object of the DSCData class which is responsible to storing and maintaining data that is being utilized by the Analysis Tab
        
        
        
        
        % System Status Variables
        % ________________________________________________________________________________________________________________________________
        
        DAQStatus = false % Status of whether the DAQ Box has been configured
        
        SystemConfigStatus = false % Status of whether the system is fully configured
        
        ConfigSaveStatus = false % Status of whether the current system config has been saved to a file
        
        StagingSaveStatus = false % Status of whether the temperature control staging table have been saved to a file
        
        ExperimentLock = false % Used to lock out functionality of the "Start Experiment" button when the experiment startup is already in progress
        
        DataSaveStatus = true % Status of whether the current data on the Operation Tab has been saved to a file
        
        AnalysisDataSaveStatus = true % Status of whether the current data on the Analysis Tab has been saved to a file
        
        
        
        
        % Temperature Calibration Variables
        % ________________________________________________________________________________________________________________________________
        
        Calibration_Measured = 0 % The temperature measured during the calibration procedure
        Calibration_Actual = 0 % The temperature entered by the user during the calibration procedure
        Calibration_Offset = 0 % The offset calculated from the CalibrationTemp_Actual and the CalibrationTemp_Measured
        
        CalibrationData_Measured = []
        CalibrationData_Actual = []
        CalibrationData_Offset = []
        
        CalibrationData = []
        
        
        
        
        % Operation Variables
        % ________________________________________________________________________________________________________________________________
        
        UIFigure
        
        UIAxesDifferential
        UIAxesSamples
        
        UIAxesDataAnalysis
        
        DifferentialLine
        ZeroLine
        
        RefSampleLine
        TestSampleLine
        
        XAxisUnits = 'Time'
        
        TemperatureUnits = 'Celsius'
        
    end
    
    properties (Access = private)
        % Command-Line User Interface Properties
        % ________________________________________________________________________________________________________________________________
        
        LicenseFileName = './LICENSE'
        
        HelpFileName = './text/cui_help.txt'
        
        CopyrightFileName = './text/cui_copyright.txt'
        
        WarrantyFileName = './text/warranty.txt'
        
    end
    
    methods
        function app = DSC_CUI_APP(varargin)
            %DSC_CUI_APP Construct an instance of this class
            %   Detailed explanation goes here
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            copyright = fileread(app.CopyrightFileName)
            
            disp('Starting DSC App. Please Wait...')
            
            s = 0;
            n = 6;
            
            % Create a waitbar
            cuiWaitbar(s/n,'Please wait...');
            
            
            message = 'Starting Stage Controller...';
            s = s + 1;
            cuiWaitbar(s/n,message);
            % Create a new StageController object
            app.stageController = StageController(app);
            
            
            message = 'Creating Live Data Object...';
            s = s + 1;
            % Update the cuiWaitbar progress and label
            cuiWaitbar(s/n,message);
            % Create a new DSCData object
            app.liveData = app.stageController.createLiveData;
            
            
            message = 'Creating Analysis Data Object...';
            s = s + 1;
            % Update the cuiWaitbar progress and label
            cuiWaitbar(s/n,message);
            % Create a new DSCData object
            app.analysisData = DSCData;
            
            
            message = 'Creating Plot Axes...';
            s = s + 1;
            % Update the cuiWaitbar progress and label
            cuiWaitbar(s/n,message);
            % Create the figure windows and plot axes
            app.UIFigure = figure(42);
            app.UIFigure.Visible = 'off';
            app.UIFigure.WindowState = 'minimized';
            app.UIFigure.NumberTitle = 'off';
            app.UIFigure.Name = 'DSC Figure Window';
            app.UIFigure.Position = [680*0.1, 558*0.8, 560*2, 420*1.2];
            app.UIAxesSamples = axes(app.UIFigure,...
                'OuterPosition', [0 0 0.5 1]);
            app.UIAxesDifferential = axes(app.UIFigure,...
                'OuterPosition', [0.5 0 0.5 1]);
            
            
            message = 'Creating Animated Lines...';
            s = s + 1;
            % Update the cuiWaitbar progress and label
            cuiWaitbar(s/n,message);
            % Create the animatedline objects
            app.DifferentialLine = animatedline(app.UIAxesDifferential, 'Color', 'blue', 'LineStyle', '-');
            app.ZeroLine = animatedline(app.UIAxesDifferential, 'Color', 'black', 'LineStyle', ':');
            
            app.RefSampleLine = animatedline(app.UIAxesSamples, 'Color', 'blue', 'LineStyle', '--');
            app.TestSampleLine = animatedline(app.UIAxesSamples, 'Color', 'red', 'LineStyle', '-.');
            
            % Create a legend for the samples plot
            legend(app.UIAxesSamples, 'Reference Sample', 'Test Sample', 'Location', 'best')
            
            
            % Update the cuiWaitbar progress and label
            cuiWaitbar(1,'App is now Ready');
            
            pause(0.5)
            
            if nargin > 0
                for i = 1:nargin
                    try
                        inputArg = lower(varargin{i});
                    catch
                        warning('Debug Warning Occurred: using function "lower" on "varargin" caused an error')
                        inputArg = varargin{i};
                    end
                    
                    switch inputArg
                        case {'start daqbox', 'start daq box'}
                            disp('Starting DAQ Box configuration...')
                            app.startDAQBox;
                            
                        case 'start experiment'
                            disp('Starting DSC Experiment...')
                            app.startExperiment;
                        otherwise
                            % Maybe there should be an otherwise case
                    end
                end
            end
            
            disp(' ')
            disp(' ')
            disp(' ')
            disp(' ')
            
            % Run the main loop of the command user interface
            app.runUI;
        end
        
        function runUI(app)
            %runUI
            %   The main program loop of the command user interface
            
            % create a clean up object
            app.cleanupObj = onCleanup(@()cuiCleanup(app));
            
            % Set the command window format
            format compact
            
            copyright = fileread(app.CopyrightFileName)
            
            % Start the command-line user interface
            %disp('DSC Command-Line User Interface - Dev Build (v1.2.0, Nov 27 2018, 21:58:42) [Author: Christian Kunis]')
            disp('Type "help", "copyright", or "credits" for more information.')
            while true
                try
                    userInput = input('DSC_CUI>> ','s');
                catch
                    warning('An error has occur with the command-line user interface.\n The UI will now attempt to save the current data and exit')
                    userInput = 'exit';
                end
                
                switch lower(userInput)
                    case 'help'
                        help = fileread(app.HelpFileName)
                        
                    case 'copyright'
                        copyright = fileread(app.CopyrightFileName)
                        
                    case 'show w'
                        warranty = fileread(app.WarrantyFileName)
                        
                    case 'show c'
                        license = fileread(app.LicenseFileName)
                        
                    case 'credits'
                        disp('Author: Christian Kunis')
                        disp('Email: ckunis.contact@gmail.com')
                        
                    case {'start daqbox', 'start daq box'}
                        disp('Starting DAQ Box configuration...')
                        app.startDAQBox();
                        
                    case 'start experiment'
                        disp('Starting DSC Experiment...')
                        app.startExperiment();
                        
                    case 'exit'
                        % debug message
                        disp('Exit command recieved')
                        
                        % have the program attempt to save the data to a
                        % backup file
                        return
                        
                    otherwise
                        try
                            eval(userInput)
                        catch
                            fprintf(['\nError: The term "%s" is not recognized '...
                                'as the name of a command, function, or variable\n'],...
                                userInput)
                        end
                end
                
            end
            
            function cuiCleanup(app)
                %cuiCleanup
                %   This function is run when the main function terminates
                
                % debug message
                disp('the cleanup function was run successfully when the program was exited')
                
                try
                    app.stopExperiment;
                catch
                end
                
                % Stop the PWM outputs before closing the app
                app.stopPWM;
            end
        end
        
        function outputArg = method1(app, inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = app.Property1 + inputArg;
        end
        
        function startDAQBox(app)
            % Create the DAQBox object
            app.daqBox = app.stageController.startDAQBox();
            
            app.SystemConfigStatus = true;
            app.DAQStatus = true;
        end
        
        function startExperiment(app)
            %startExperiment
            %   Have the stage controller run the experiment
            
            % Prevent this function from running more than once at a time
            if app.stageController.ExperimentInProgress
                return
                
            else
                app.ExperimentLock = true;
                
                if isempty(app.daqBox) || ~isvalid(app.daqBox)
                    app.SystemConfigStatus = false;
                    
                    warndlg('The DAQ Box Session must be start before running the measurement procedure.')
                    
                    pause(1)
                    app.ExperimentLock = false;
                else
                    app.SystemConfigStatus = true;
                    
                    app.UIFigure.Visible = 'on';
                    app.UIFigure.WindowState = 'normal';
                    
                    % Have the stage controller start the experiment
                    app.stageController.runExperimentStaging();
                    
                    pause(1)
                    app.ExperimentLock = false;
                end
            end
        end
        
        function stopExperiment(app)
            if app.stageController.ExperimentInProgress
                app.stageController.forceStop();
                drawnow
            end
            
            app.ExperimentLock = false;
            
            app.updateOperationUI();
        end
        
        function stopPWM(app)
            % Stop the PWM outputs
            if ~isempty(app.daqBox) && isvalid(app.daqBox)
                switch app.daqBox.PWMRunning
                    case 'on'
                        app.daqBox.stopDAQPWM();
                        drawnow
                end
            end
        end
        
        function updateOperationClock(app, givenSerialDate, varargin)
            disp(' ')
            disp('Total Elapsed Time:')
            if nargin > 1
                currentSerialDate = givenSerialDate;
            else
                currentSerialDate = app.daqBox.getCurrentSerialDate;
            end
            
            elapsedSerialDate = currentSerialDate - app.liveData.ExpStartSerialDate;
            elapsedTime = datestr(elapsedSerialDate, 'HH:MM:SS.FFF');
            
            fprintf('%f seconds\n', elapsedTime)
        end
        
        function updateOperationPlots(app)
            clearpoints(app.DifferentialLine)
            clearpoints(app.ZeroLine)
            clearpoints(app.RefSampleLine)
            clearpoints(app.TestSampleLine)
            
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
                            % Plot the data as Heat Flow Rate vs.
                            % Temperature
                            addpoints(app.DifferentialLine,...
                                app.liveData.TempData_Interpolated,...
                                app.liveData.HeatFlowRateData_Diff_Interpolated)
                            
                            addpoints(app.ZeroLine, app.liveData.TempData_Range, [0, 0])
                            
                            addpoints(app.RefSampleLine,...
                                app.liveData.TempData_Ref,...
                                app.liveData.HeatFlowData_Ref)
                            
                            addpoints(app.TestSampleLine,...
                                app.liveData.TempData_Samp,...
                                app.liveData.HeatFlowData_Samp)
                            
                        case 'Kelvin'
                            % Plot the data as Heat Flow Rate vs.
                            % Temperature
                            addpoints(app.DifferentialLine,...
                                cel2kel(app.liveData.TempData_Interpolated),...
                                app.liveData.HeatFlowRateData_Diff_Interpolated)
                            
                            addpoints(app.ZeroLine, cel2kel(app.liveData.TempData_Range), [0, 0])
                            
                            addpoints(app.RefSampleLine,...
                                cel2kel(app.liveData.TempData_Ref),...
                                app.liveData.HeatFlowData_Ref)
                            
                            addpoints(app.TestSampleLine,...
                                cel2kel(app.liveData.TempData_Samp),...
                                app.liveData.HeatFlowData_Samp)
                    end
            end
            
            legend(app.UIAxesSamples, 'Location', 'best')
            
            drawnow limitrate nocallbacks
            
        end
        
        function delete(app)
            % attempt to save then follow standard exit procedure
            if app.DataSaveStatus
                SaveCheck = 'No';
            else
                SaveCheck = questdlg(sprintf('WARNING: All unsaved data will be lost\nWould you like to save the current data?'));
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
        end
    end
    
    methods (Static)
        function updateOperationUI(varargin)
            % Do nothing
        end
        
        function updateStagingInfo(varargin)
            % Do nothing
        end
        
        function updateStagingTable(varargin)
            % Do nothing
        end
        
        function updateOperationUnits(varargin)
            % Do nothing
        end
        
        function updateOperationGauges(varargin)
            % Do nothing
        end
        
        function updateAnalysisUI(varargin)
            % Do nothing
        end
        
        function updateAnalysisPlot(varargin)
            % Do nothing
        end
        
        function updateMaintenanceUI(varargin)
            % Do nothing
        end
    end
end

