% DSC_UI: UI and control systems for prototype DSC system
%     Copyright (C) 2019  Christian Kunis
%
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or (at
%     your option) any later version.
%
%     This program is distributed in the hope that it will be useful, but
%     WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%     General Public License for more details.
%
%     You should have received a copy of the GNU General Public License
%     along with this program. If not, see <https://www.gnu.org/licenses/>.
%
%     You may contact the author at ckunis.contact@gmail.com

classdef DAQBox < handle
    %DAQBox
    %   Represents the DAQ Box and stores the sessions and configuration
    %   information
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        devicesList = [];
        
        % An object of the DAQTrigger class which represents the DAQ
        % triggers, which are used to trigger the data acquisition at
        % regular intervals
        daqTrigger DAQTrigger
        
        % An object of the DSCData class which is responsible to storing
        % and maintaining data while an experiment is running
        liveData DSCData
        
        daqSemaphore Semaphore
        
        % Boolean variable indicating whether to interact with a physical
        % DAQ Box (true) or simulate the hardware (false).
        UseDAQHardware logical = false
        
        TempSensorSelection = 'Thermocouple'
    end
    
    % DataAcquisition objects
    properties
        
        % The DataAcquisition object for reading temperature and power data
        dqInput daq.interfaces.DataAcquisition
        
        % The DataAcquisition object for controlling the power output to the heating coils
        dqOutput daq.interfaces.DataAcquisition
        
        % The device ID of the DAQ Box
        DeviceID = 'Dev1';
        
        % daq.ni.AnalogInputVoltageChannel objects
        ch_Temp_Ref
        ch_Temp_Samp
        ch_Current_Ref
        ch_Current_Samp
        
        % The counter output channel for sending PWM to the reference
        % sample heating coil
        ctr_PWM_Ref
        % The counter output channel for sending PWM to the test sample
        % heating coil
        ctr_PWM_Samp
    end
    
    % Calibration Offsets
    properties
        
        % The offset used to calibrate the temperature readings for the
        % reference sample
        TempCalibrationOffset_Ref(1,1) = 0
        % The offset used to calibrate the temperature readings for the
        % test sample
        TempCalibrationOffset_Samp(1,1) = 0
        
        % The offset used to calibrate the current readings for the
        % reference sample
        CurrentCalibrationOffset_Ref(1,1) = 0
        % The offset used to calibrate the current readings for the test
        % sample
        CurrentCalibrationOffset_Samp(1,1) = 0
    end
    
    % Configuration Properties
    properties
        PID_Kp = 0.01 % PID proportional gain constant
        PID_Ki = 0 % PID integral gain constant
        PID_Kd = 0 % PID derivative gain constant
        
        MaxTempLimit = 300
        
        % Status of whether the current system config has been saved to a
        % file
        ConfigSaveStatus logical = false
    end
    
    % Simulated Hardware Data
    properties
        % The simulated temperature and current values, used for debugging
        % when not connected to a DAQ Box
        SimulatedTemp_Ref(1,1) = 20
        SimulatedTemp_Samp(1,1) = 20
        SimulatedCurrent_Ref(1,1) = 0
        SimulatedCurrent_Samp(1,1) = 0
    end
    
    % Dependent Properties % TODO Update this comment
    properties %(Dependent)
        PWMDutyCycle_Ref
        PWMDutyCycle_Samp
    end
    
    % Constant Variables
    properties (Constant)
        % The file path to load the default config file
        DEFAULT_CONFIG = './config/defaultConfig.cfg';
        
        % The file path for loading new config files
        CONFIG_LOAD_PATH = './config/*.cfg';
        
        % The file path for saving new config files
        CONFIG_SAVE_PATH = './config/newConfig';
        
        CONFIG_XL_RANGE = 'B2:B10';
        
        % The channel ID's for each sensor
        CHANNEL_ID_TEMP_REF = 'ai3'; %'ai5';
        CHANNEL_ID_TEMP_SAMP = 'ai6'; %'ai6';
        CHANNEL_ID_CURRENT_REF = 'ai4'; %'ai3';
        CHANNEL_ID_CURRENT_SAMP = 'ai5'; %'ai4';
        CHANNEL_ID_PWM_REF = 'ctr0'; %'ctr0';
        CHANNEL_ID_PWM_SAMP = 'ctr1'; %'ctr1';
        
        % The scan rate used during sensor readings (default: 1000)
        INPUT_SCAN_RATE = 1000;
        
        % The number of scans to hold in the buffer before activating the
        % ScansAvailableFcn callback (default: 100)
        SCANS_AVAILABLE_FCN_COUNT = 100
        
        % The scan rate used by the mimiced PWM (default: 1000)
        % OUTPUT_SCAN_RATE = 1000 % TODO Remove this
        
        % The number of scans at which to generate more data for the output
        % (default: 500)
        % SCANS_REQUIRED_FCN_COUNT = 500; % TODO Remove this
        
        % The duration in seconds of the sensor readings
        %INPUT_DURATION_IN_SECONDS = 60; % TODO Delete this
        
        % The duration in seconds of the PWM outputs (if not manually
        % stopped)
        %OUTPUT_DURATION = 1; % TODO Remove this
        
        % The minimum duty cycle allowed for both PWM channels
        PWM_MIN_DUTY_CYCLE = 1e-3;
        
        % The maximum duty cycle allowed for both PWM channels
        PWM_MAX_DUTY_CYCLE = 1 - 1e-3;
        
        % The PWM frequency of the PWM channels
        PWM_FREQUENCY = 100;
        
        MAX_PWM_ATTEMPTS = 10;
        
        AMPLIFIER_VOLTAGE_OFFSET = -1.25;
        
        AMPLIFIER_CONVERSION_FACTOR = 0.005; % 5 mV/C = 0.005 V/C
        
        CURRENT_SENSOR_SENS = 0.1; % Sensitivity (Sens) 100 mV/A = 0.1 V/A
        
        HEATING_COIL_VOLTAGE = 24; % The constant voltage supplied to the heating coils
        
        % Used to simulate the ambient temperate of the lab while running
        % the software without a physical DAQ Box
        SIMULATED_AMBIENT_TEMP = 20;
        
        % Used to simulate the cooling of the samples when the heating
        % coils are off
        SIMULATED_TEMP_COOLING_CONSTANT = -0.001;
        
        % Used to simulate the heating of the samples when running the
        % software without a physical DAQ Box
        SIMULATED_HEATING_COEFFICIENT = 1.5;
        
        % Used to simulate random variance in the temperature
        SIMULATED_TEMP_SPREAD_COEFFICIENT = 0.001;
        
        % Used to convert PWMDutyCycle to SimulatedCurrent when running the
        % software without a physical DAQ Box
        SIMULATED_CURRENT_COEFFICIENT = 1;
    end
    
    % Class Constructor
    methods
        function obj = DAQBox
            %DAQBox Construct an instance of this class
            %   Automatically creates the input and output sessions used
            %   for measurements and PWM pulse generation
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            % Declare a nested helper function
            function [s, n, f] = refreshWaitbar(s, n, f, message)
                try
                    s = s + 1;
                    % Attempt to update the waitbar progress and label
                    waitbar(s/n,f,message);
                    % Update the CLI_Waitbar progress and label
                    CLI_Waitbar(s/n,message);
                catch
                    % Recreate the waitbar if was closed by the user
                    f = waitbar(s/n,message);
                    CLI_Waitbar(s/n,message);
                end
            end
            
            s = 0;
            n = 6;
            
            % Create a waitbar
            f = waitbar(s/n,'Please wait...');
            CLI_Waitbar(s/n,'Please wait...');
            
            obj.UseDAQHardware = false;
            
            % Check whether a DAQ Box is connected to the computer
            message = 'Checking for DAQ devices...';
            [s, n, f] = refreshWaitbar(s, n, f, message);
            if isempty(obj.devicesList)
                % Check for DAQ devices before attempting to create
                % sessions
                fprintf('\nChecking for DAQ devices...\n')
                daqreset;
                obj.devicesList = daqlist("ni");
                if isempty(obj.devicesList)
                    disp('No DAQ devices have been detected.')
                    obj.UseDAQHardware = false;
                else
                    disp('DAQ device found')
                    obj.DeviceID = obj.devicesList.DeviceID(1);
                    obj.UseDAQHardware = true;
                end
            end
            
            % Create the daq.DataAcquisition for measuring inputs from sensors
            message = 'Setting up DataAcquisition Input...';
            [s, n, f] = refreshWaitbar(s, n, f, message);
            obj.initializeInput();
            
            % Create the daq.DataAcquisition for producing PWM output
            message = 'Setting up DataAcquisition Output...';
            [s, n, f] = refreshWaitbar(s, n, f, message);
            obj.initializeOutput();
            
            % Load the DAQ Box config file
            message = 'Loading Default DAQ Box Configuration...';
            [s, n, f] = refreshWaitbar(s, n, f, message);
            obj.loadConfigFile('default');
            
            % Only setup the DAQTrigger if hardware is NOT present
            if obj.UseDAQHardware
                s = s + 1;
            else
                message = 'Creating DAQ Trigger...';
                [s, n, f] = refreshWaitbar(s, n, f, message);
                % Create the DAQTrigger object
                obj.daqTrigger = DAQTrigger(obj.devicesList);
            end
            
            % Indicate to user that the setup is complete
            if obj.UseDAQHardware
                message = 'DAQ Box configuration complete';
            else
                message = 'Simulated DAQ Box is ready';
            end
            [~, ~, f] = refreshWaitbar(s, n, f, message);
            
            pause(0.5)
            
            % Attempt to close the waitbar
            try close(f); catch, end
            
            obj.daqSemaphore = Semaphore;
            obj.daqSemaphore.lock();
            obj.daqSemaphore.release();
            
            disp(' ')
            disp(' ')
            disp(' ')
            disp(' ')
        end
    end
    
    % % Dependant Properties Accessor Methods
    % methods
    %     function pwmDutyCycle_Ref = get.PWMDutyCycle_Ref(obj)
    %         % Return the PWM duty cycle currently set for the reference
    %         % sample heating coil output channel
    %         pwmDutyCycle_Ref = obj.ctr_PWM_Ref.DutyCycle;
    %     end
    
    %     function pwmDutyCycle_Samp = get.PWMDutyCycle_Samp(obj)
    %         % Return the PWM duty cycle currently set for the test sample
    %         % heating coil output channel
    %         pwmDutyCycle_Samp = obj.ctr_PWM_Samp.DutyCycle;
    %     end
    % end
    
    % % Dependant Properties Mutator Methods
    % methods
    %     function set.PWMDutyCycle_Ref(obj, newPWMDutyCycle_Ref)
    %         if obj.dqOutput.Running
    %             obj.ctr_PWM_Ref.DutyCycle = newPWMDutyCycle_Ref;
    %         end
    %     end
    
    %     function set.PWMDutyCycle_Samp(obj, newPWMDutyCycle_Samp)
    %         if obj.dqOutput.Running
    %             obj.ctr_PWM_Samp.DutyCycle = newPWMDutyCycle_Samp;
    %         end
    %     end
    % end
    
    % daq.createSession Methods
    methods
        function obj = initializeInput(obj)
            %initializeInput
            %   Creates and configures the session that is used to take
            %   measurements from the temperature and power sensors
            
            if obj.UseDAQHardware
                % Stop and flush any existing DataAcquisition objects
                try
                    stop(obj.dqInput);
                    flush(obj.dqInput);
                catch
                    if isvalid(obj.dqInput)
                        warning('Failed to release existing Input DataAcquisition')
                    end
                end
                
                fprintf('\nCreating Input DataAcquisition...\n')
                % Create the DataAcquisition object for the input measurements
                obj.dqInput = daq("ni");
                disp('Input DataAcquistion was successfully created')
                
                fprintf('\nConfiguring input DataAcquisition channels...\n')
                % Add the input channels
                switch obj.TempSensorSelection
                    case 'Thermocouple'
                        %Add the temperature sensor input channel for the
                        %reference sample
                        obj.ch_Temp_Ref = addinput(obj.dqInput, obj.DeviceID,...
                            obj.CHANNEL_ID_TEMP_REF, "Voltage");
                        obj.ch_Temp_Ref.TerminalConfig = "SingleEnded";
                        obj.ch_Temp_Ref.Name = "Temp_Ref_Voltage";
                        disp('Created: analog input channel for reference sample temperature sensor')
                        
                        %Add the temperature sensor input channel for the
                        %test sample
                        obj.ch_Temp_Samp = addinput(obj.dqInput, obj.DeviceID,...
                            obj.CHANNEL_ID_TEMP_SAMP, "Voltage");
                        obj.ch_Temp_Samp.TerminalConfig = "SingleEnded";
                        obj.ch_Temp_Samp.Name = "Temp_Samp_Voltage";
                        disp('Created: analog input channel for test sample temperature sensor')
                        
                    case 'RTD' % NOT YET IMPLEMENTED
                        warndlg('RTD support is not yet implemented')
                        error('RTD support is not yet implemented')
                        
                end
                
                %Add the current sensor input channel for the reference
                %sample
                obj.ch_Current_Ref = addinput(obj.dqInput, obj.DeviceID,...
                    obj.CHANNEL_ID_CURRENT_REF, "Voltage");
                obj.ch_Current_Ref.TerminalConfig = "SingleEnded";
                obj.ch_Current_Ref.Name = "Current_Ref_Voltage";
                disp('Created: analog input channel for reference sample current sensor')
                
                %Add the current sensor input channel for the test sample
                obj.ch_Current_Samp = addinput(obj.dqInput, obj.DeviceID,...
                    obj.CHANNEL_ID_CURRENT_SAMP, "Voltage");
                obj.ch_Current_Samp.TerminalConfig = "SingleEnded";
                obj.ch_Current_Samp.Name = "Current_Samp_Voltage";
                disp('Created: analog input channel for test sample current sensor')
                
                obj.dqInput.Rate = obj.INPUT_SCAN_RATE;
                
                obj.dqInput.ScansAvailableFcnCount = obj.SCANS_AVAILABLE_FCN_COUNT;
            else
                % Delete the DataAcquisition object if no DAQ devices are found
                delete(obj.dqInput)
                
                % Inform the user that no devices were detected
                fprintf('\nTo allow for UI testing, temperature and power data will be simulated\n')
            end
        end
        
        function obj = initializeOutput(obj)
            %initializeOutput
            %   Creates and configures the session that is used to send
            %   outputs to the heating coils via PWM pulse generation
            
            if obj.UseDAQHardware
                % Stop and flush any existing DataAcquisition objects
                try
                    stop(obj.dqOutput);
                    flush(obj.dqOutput);
                catch
                    if isvalid(obj.dqOutput)
                        warning('Failed to release existing Output DataAcquisition')
                    end
                end
                
                fprintf('\nCreating Output DataAcquisition...\n')
                % Create the DataAcquisition object for the PWM output to the heating
                % coils
                obj.dqOutput = daq("ni");
                disp('Output DataAcquisition was successfully created')
                
                fprintf('\nConfiguring output DataAcquisition channels...\n')
                
                %Add the heating coil output channel for the reference
                %sample
                obj.ctr_PWM_Ref = addoutput(obj.dqOutput, obj.DeviceID,...
                    obj.CHANNEL_ID_PWM_REF, "PulseGeneration");
                obj.ctr_PWM_Ref.DutyCycle = obj.PWM_MIN_DUTY_CYCLE; % TODO Remove this
                obj.ctr_PWM_Ref.Frequency = obj.PWM_FREQUENCY; % TODO Remove this
                obj.ctr_PWM_Ref.Name = 'Heating Coil PWM: Reference';
                disp('Created: counter output channel for reference sample heating coil')
                
                %Add the heating coil output channel for the test sample
                obj.ctr_PWM_Samp = addoutput(obj.dqOutput, obj.DeviceID,...
                    obj.CHANNEL_ID_PWM_SAMP, "PulseGeneration");
                obj.ctr_PWM_Samp.DutyCycle = obj.PWM_MIN_DUTY_CYCLE; % TODO Remove this
                obj.ctr_PWM_Samp.Frequency = obj.PWM_FREQUENCY; % TODO Remove this
                obj.ctr_PWM_Samp.Name = 'Heating Coil PWM: Test Sample';
                disp('Created: counter output channel for test sample heating coil')
                
                % obj.dqOutput.Rate = obj.OUTPUT_SCAN_RATE; % TODO Remove this
                
                % obj.dqOutput.ScansRequiredFcnCount = obj.SCANS_REQUIRED_FCN_COUNT; % TODO Remove this
            else
                % Delete the session object if no DAQ devices are found
                delete(obj.dqOutput)
                
                % Inform the user that no devices were detected
                fprintf('\nTo allow for UI testing, PWM outputs will be simulated\n')
            end
        end
    end
    
    % Config File Load/Save Methods
    methods
        function configLoadStatus = loadConfigFile(obj, loadPreset, varargin)
            %loadConfigFile
            %   Read the values from a selected config file and store them
            %   in the appropriate parameters
            if nargin > 2
                error('Too many input arguments.')
                
            elseif nargin > 1
                switch loadPreset
                    case 'default'
                        configFileName = obj.DEFAULT_CONFIG;
                        
                    otherwise
                        % Inform the user that the give preset was not
                        % recognized
                        warndlg(sprintf(['The given preset name "%s" '...
                            'was not recognized.\n'...
                            'Please select a config file manually'],...
                            loadPreset))
                        warning(['The given preset name "%s" '...
                            'was not recognized.\n'...
                            'Please select a config file manually'],...
                            loadPreset)
                        disp(' ')
                        
                        % Prompt the user to select a file
                        [configFileName, configFilePath] = uigetfile(obj.CONFIG_LOAD_PATH);
                end
                
            else
                % Prompt the user to select a file
                [configFileName, configFilePath] = uigetfile(obj.CONFIG_LOAD_PATH);
            end
            
            switch configFileName
                case 0
                    % Cancel the read operation and return empty variables
                    % if the user closes the file selection window
                    configLoadStatus = false;
                    return
                    
                case obj.DEFAULT_CONFIG
                    % Read the values from the defaultConfig.cfg file
                    [~, ~, configCellArray] = xlsread(configFileName, obj.CONFIG_XL_RANGE);
                    
                otherwise
                    % Concatinate the file name and path name to get the
                    % full file path
                    configFullPath = fullfile(configFilePath, configFileName);
                    
                    % Read the values from the selected .cfg file
                    [~, ~, configCellArray] = xlsread(configFullPath, obj.CONFIG_XL_RANGE);
            end
            
            % Separate the config values into the appropriate variables
            [obj.TempSensorSelection,...
                obj.TempCalibrationOffset_Ref,...
                obj.TempCalibrationOffset_Samp,...
                obj.CurrentCalibrationOffset_Ref,...
                obj.CurrentCalibrationOffset_Samp,...
                obj.PID_Kp,...
                obj.PID_Ki,...
                obj.PID_Kd,...
                obj.MaxTempLimit]...
                = configCellArray{:};
            
            configLoadStatus = true;
            
        end
        
        function configSaveStatus = saveConfigFile(obj)
            %saveConfigFile
            %   Save the given configuration values to a .cfg file
            
            % Prompt the user to select a file
            [configFileName, configFilePath] = uiputfile(...
                '*.cfg', 'Save Config File', obj.CONFIG_SAVE_PATH);
            
            switch configFileName
                case 0
                    % Cancel the save operation if the user closes the file
                    % selection window
                    configSaveStatus = false;
                    return
                    
                otherwise
                    % Concatinate the file name and path name to get the
                    % full file path
                    configFullPath = fullfile(configFilePath, configFileName);
                    
                    % Create a row cell array of the column headers
                    columnHeaders = {'Variable Description', 'Value'};
                    
                    
                    % Create a column array of row headers
                    rowHeaders = {'Temperature Sensor Type';...
                        'Reference Sample Temperature Calibration Offset (delta C)';...
                        'Test Sample Temperature Calibration Offset (delta C)';...
                        'Reference Sample Current Calibration Offset (delta A)';...
                        'Test Sample Current Calibration Offset (delta A)';...
                        'Kp - proportional gain constant';...
                        'Ki - integral gain constant';...
                        'Kd - derivative gain constant';...
                        'Max Temp Limit (Celsius)'};
                    
                    % Combine the config variables into a cell array
                    configCellArray = {obj.TempSensorSelection;...
                        obj.TempCalibrationOffset_Ref;...
                        obj.TempCalibrationOffset_Samp;...
                        obj.CurrentCalibrationOffset_Ref;...
                        obj.CurrentCalibrationOffset_Samp;...
                        obj.PID_Kp;...
                        obj.PID_Ki;...
                        obj.PID_Kd;...
                        obj.MaxTempLimit};
                    
                    % Join the cell arrays to add the row and column
                    % headers to the respective config values
                    outputCellArray = [columnHeaders; rowHeaders, configCellArray];
                    
                    % Write the data to the desired .cfg file
                    configSaveStatus = xlswrite(configFullPath, outputCellArray);
            end
            
            if ~configSaveStatus
                warndlg('Save opertation was aborted')
                warning('Save opertation was aborted')
                disp(' ')
            end
            
            obj.ConfigSaveStatus = configSaveStatus;
        end
    end
    
    % Data Measurement Methods
    methods
        function [serialDate, tempReading_Ref, tempReading_Samp,...
                currentReading_Ref, currentReading_Samp]...
                = getBackgroundData(obj)
            %getBackgroundData
            %   Get temperature and power readings from the background data
            %   acquisition
            
            if obj.UseDAQHardware
                % Get the data from the DataAcquisition object
                [scanData, triggerTime]...
                    = read(obj.dqInput, obj.dqInput.ScansAvailableFcnCount);
                
                % Calculate the serial date from the triggerTime and the first
                % time stamp
                serialDate = datenum(triggerTime) + datenum(scanData.Time(1));
                
                % Convert the raw voltage data into the corresponding
                % temperature and current units
                [tempReading_Ref, tempReading_Samp,...
                    currentReading_Ref, currentReading_Samp]...
                    = obj.extractDaqData(scanData);
                
            else
                % Simulate the input values if a DAQ Box is not connected
                [serialDate, tempReading_Ref, tempReading_Samp,...
                    currentReading_Ref, currentReading_Samp]...
                    = obj.simulateInput();
                
            end
        end
        
        function [serialDate, tempReading_Ref, tempReading_Samp,...
                currentReading_Ref, currentReading_Samp]...
                = getSingleScanData(obj)
            %getSingleScanData
            %   Get temperature and power readings from a single scan
            if obj.UseDAQHardware
                try
                    % Read the input data from the DataAcquisition
                    [scanData, triggerTime]...
                        = read(obj.dqInput);
                catch
                    try
                        pause(0.1)
                        % Read the input data from the DataAcquisition
                        [scanData, triggerTime]...
                            = read(obj.dqInput);
                    catch ME
                        warning('An error occured while trying to read the input data from the DAQ Box')
                        rethrow(ME)
                    end
                end
                
                % Calculate the serial date from the triggerTime and the first
                % time stamp
                serialDate = datenum(triggerTime) + datenum(scanData.Time(1));
                
                % Convert the raw voltage data into the corresponding
                % temperature and current units
                [tempReading_Ref, tempReading_Samp,...
                    currentReading_Ref, currentReading_Samp]...
                    = obj.extractDaqData(scanData);
                
            else
                % Simulate the input values if a DAQ Box is not connected
                [serialDate, tempReading_Ref, tempReading_Samp,...
                    currentReading_Ref, currentReading_Samp]...
                    = obj.simulateInput();
                
            end
        end
        
        function serialDate = getCurrentSerialDate(obj)
            %getCurrentSerialDate
            %   Return the serial date number of the current time using the
            %   DAQ Box clock
            
            if obj.UseDAQHardware
                try
                    % Read the input data from the input DataAcquisition
                    [scanData, triggerTime]...
                        = read(obj.dqInput);
                catch
                    try
                        stop(obj.dqInput);
                        
                        % Read the input data from the input DataAcquisition
                        [scanData, triggerTime]...
                            = read(obj.dqInput);
                        disp('restarted background for time measurement')
                        start(obj.dqInput, "Continuous");
                        
                    catch ME
                        warning('An error occured while trying to read the serial date from the DAQ Box')
                        rethrow(ME)
                    end
                end
                
                % Calculate the serial date from the triggerTime and the first
                % time stamp
                serialDate = datenum(triggerTime) + datenum(scanData.Time(1));
                
            else
                serialDate = datenum(datetime);
                
            end
        end
    end
    
    % Private Data Measurement Helper Methods
    methods (Access = private)
        function [tempReading_Ref, tempReading_Samp,...
                currentReading_Ref, currentReading_Samp]...
                = extractDaqData(obj, scanData)
            %extractEventData
            %   Compute the averages of the raw voltage data and convert these
            %   into the corresponding temperature or current units
            
            % Organize the raw data into separate vectors for each
            % sensor
            rawTempData_Ref = scanData.Temp_Ref_Voltage;
            rawTempData_Samp = scanData.Temp_Samp_Voltage;
            rawCurrentData_Ref = scanData.Current_Ref_Voltage;
            rawCurrentData_Samp = scanData.Current_Samp_Voltage;
            
            % Calculate the average of the measured input values
            rawTempAvg_Ref = mean(rawTempData_Ref);
            rawTempAvg_Samp = mean(rawTempData_Samp);
            rawCurrentAvg_Ref = mean(rawCurrentData_Ref);
            rawCurrentAvg_Samp = mean(rawCurrentData_Samp);
            
            % Convert the average voltage from the raw temp data to the
            % equivalent temperature in degrees Celsius
            switch obj.TempSensorSelection
                case 'Thermocouple'
                    tempReading_Ref = (...
                        (rawTempAvg_Ref + obj.AMPLIFIER_VOLTAGE_OFFSET)...
                        ./ obj.AMPLIFIER_CONVERSION_FACTOR)...
                        + obj.TempCalibrationOffset_Ref;
                    
                    tempReading_Samp = (...
                        (rawTempAvg_Samp + obj.AMPLIFIER_VOLTAGE_OFFSET)...
                        ./ obj.AMPLIFIER_CONVERSION_FACTOR)...
                        + obj.TempCalibrationOffset_Samp;
                    
                case 'RTD' % NOT IMPLEMENTED
                    tempReading_Ref = rawTempAvg_Ref...
                        + obj.TempCalibrationOffset_Ref;
                    
                    tempReading_Samp = rawTempAvg_Samp...
                        + obj.TempCalibrationOffset_Samp;
            end
            
            % Convert the average voltage from the raw power data to
            % the equivalent power in Watts
            currentReading_Ref =...
                (rawCurrentAvg_Ref ./ obj.CURRENT_SENSOR_SENS)...
                + obj.CurrentCalibrationOffset_Ref;
            
            currentReading_Samp =...
                (rawCurrentAvg_Samp ./ obj.CURRENT_SENSOR_SENS)...
                + obj.CurrentCalibrationOffset_Samp;
            
        end
    end
    
    % PWM Control Methods
    methods
        function obj = startPWM(obj)
            %startPWM
            %   Start generating the PWM outputs on the counter channels in
            %   the background (will run for 1 second unless manually
            %   stopped)
            
            if obj.UseDAQHardware
                err_count = 0;
                for try_count = 0:obj.MAX_PWM_ATTEMPTS
                    if try_count ~= err_count
                        break
                    end
                    
                    try
                        % obj.dqOutput.ScansRequiredFcn = @obj.loadMorePWMDataFcn;
                        start(obj.dqOutput, "Continuous")
                        % start(obj.dqOutput,...
                        %    "Duration", seconds(obj.OUTPUT_DURATION));
                    catch
                        warning('An error occured while attempting to start the PWM. Retrying...')
                        err_count = err_count + 1;
                    end
                end
            end
        end
        
        function obj = stopPWM(obj)
            %stopPWM
            %   Stop generating the PWM outputs
            
            if obj.UseDAQHardware
                if obj.dqOutput.Running
                    err_count = 0;
                    for try_count = 0:obj.MAX_PWM_ATTEMPTS
                        if try_count ~= err_count
                            break
                        end
                        
                        try
                            stop(obj.dqOutput);
                            flush(obj.dqOutput);
                        catch
                            warning('An error occured while attempting to stop the PWM. Retrying...')
                            err_count = err_count + 1;
                        end
                    end
                end
            end
        end
        
        function updatePWMDutyCycle(obj,...
                newPWMDutyCycle_Ref, newPWMDutyCycle_Samp)
            %updatePWMDutyCycle
            %   Adjusts the PWM duty cycle for the reference and test
            %   sample heating coil outputs
            
            % Bounds checking on duty cycle for reference sample
            if newPWMDutyCycle_Ref > obj.PWM_MAX_DUTY_CYCLE
                newPWMDutyCycle_Ref = obj.PWM_MAX_DUTY_CYCLE;
            elseif newPWMDutyCycle_Ref < obj.PWM_MIN_DUTY_CYCLE
                newPWMDutyCycle_Ref = obj.PWM_MIN_DUTY_CYCLE;
            end
            
            % Bounds checking on duty cycle for test sample
            if newPWMDutyCycle_Samp > obj.PWM_MAX_DUTY_CYCLE
                newPWMDutyCycle_Samp = obj.PWM_MAX_DUTY_CYCLE;
            elseif newPWMDutyCycle_Samp < obj.PWM_MIN_DUTY_CYCLE
                newPWMDutyCycle_Samp = obj.PWM_MIN_DUTY_CYCLE;
            end
            
            % Assign the new duty cycle values
            obj.PWMDutyCycle_Ref = newPWMDutyCycle_Ref;
            obj.PWMDutyCycle_Samp = newPWMDutyCycle_Samp;
            obj.ctr_PWM_Ref.DutyCycle = newPWMDutyCycle_Ref;
            obj.ctr_PWM_Samp.DutyCycle = newPWMDutyCycle_Samp;
            
            % fprintf("PWMDutyCycle_Ref  = %g\n", obj.PWMDutyCycle_Ref); % TODO Remove this
            % fprintf("PWMDutyCycle_Samp = %g\n", obj.PWMDutyCycle_Samp); % TODO Remove this
            
            if ~obj.UseDAQHardware
                obj.simulateOutput();
                
            end
        end
        
        % function loadMorePWMDataFcn(obj, ~, ~)
        %     %loadMorePWMDataFcn
        %     %   Loads more data of a pregenerated PWM waveform into the
        %     %   buffer of the outputs, using the most recent value defined
        %     %   for the duty cycles
        
        %     numScans = 0.2 * obj.SCANS_REQUIRED_FCN_COUNT;
        
        %     scanData_Ref = zeros(1,numScans);
        %     scanData_Samp = zeros(1,numScans);
        
        %     period = obj.OUTPUT_SCAN_RATE / obj.PWM_FREQUENCY;
        
        %     for i=1:numScans
        %         proportion = mod(1,period)/period;
        %         if proportion < obj.PWMDutyCycle_Ref
        %             scanData_Ref(i) = 5;
        %         else
        %             scanData_Ref(i) = -5;
        %         end
        %         if proportion < obj.PWMDutyCycle_Samp
        %             scanData_Samp(i) = 5;
        %         else
        %             scanData_Samp(i) = -5;
        %         end
        %     end
        
        %     % PWM_Length_Ref = round(numScans * obj.PWMDutyCycle_Ref);
        %     % PWM_Length_Samp = round(numScans * obj.PWMDutyCycle_Samp);
        
        %     % PWM_scanData_Ref = [ones(1,PWM_Length_Ref), ...
        %     %     zeros(1,numScans-PWM_Length_Ref)];
        %     % PWM_scanData_Samp = [ones(1,PWM_Length_Samp), ...
        %     %     zeros(1,numScans-PWM_Length_Samp)];
        
        %     PWM_scanData = [PWM_scanData_Ref', PWM_scanData_Samp'];
        
        %     preload(obj.dqOutput,PWM_scanData);
        % end
    end
    
    % PID Controller Methods
    methods
        function [newDutyCycle_Ref, newDutyCycle_Samp]...
                = runPIDAlgorithm(obj, liveData)
            %runPIDAlgorithm
            %   Perform the PID calculations to determine the new duty
            %   cycles for the PWM pulse generation
            
            % Implementation Notes: Since TempErrorData is recorded as
            % CurrentTemp - TargetTemp, this function will take the
            % negative of that data, in order to get error values in the
            % form of TargetTemp - CurrentTemp
            
            % Bounds checking for the reference sample temperature
            if liveData.LatestTemp_Ref > obj.MaxTempLimit
                % Set the new duty cycle to 0 (OFF) if the current temp
                % exceeds the maximum temperature limit
                newDutyCycle_Ref = 0;
                
            else
                % porportional term
                proportionalTerm_Ref = -liveData.LatestTempError_Ref;
                Pp_Ref = obj.PID_Kp * proportionalTerm_Ref;
                
                if liveData.DataLength > 1
                    % intergral term
                    integralTerm_Ref = trapz(liveData.TimeData, -liveData.TempErrorData_Ref, 2);
                    Pi_Ref = obj.PID_Ki * integralTerm_Ref;
                    
                else
                    % Set the integral term to zero if there is not enough
                    % data to calculate this term
                    Pi_Ref = 0;
                    
                end
                
                % derivative term
                derivativeTerm_Ref = -liveData.LatestTempErrorDiff_Ref...
                    ./ liveData.LatestTimeDiff;
                Pd_Ref = obj.PID_Kd * derivativeTerm_Ref;
                
                % Calculate the new duty cycles for the reference sample
                % and the test sample
                newDutyCycle_Ref = Pp_Ref + Pi_Ref + Pd_Ref;
                
            end
            
            % Bounds checking for the test sample temperature
            if liveData.LatestTemp_Samp > obj.MaxTempLimit
                % Set the new duty cycle to 0 (OFF) if the current temp
                % exceeds the maximum temperature limit
                newDutyCycle_Samp = 0;
                
            else
                % porportional term
                proportionalTerm_Samp = -liveData.LatestTempError_Samp;
                Pp_Samp = obj.PID_Kp * proportionalTerm_Samp;
                
                if liveData.DataLength > 1
                    % intergral term
                    integralTerm_Samp = trapz(liveData.TimeData, -liveData.TempErrorData_Samp, 2);
                    Pi_Samp = obj.PID_Ki * integralTerm_Samp;
                    
                else
                    % Set the integral term to zero if there is not enough
                    % data to calculate this term
                    Pi_Samp = 0;
                    
                end
                
                % derivative term
                derivativeTerm_Samp = -liveData.LatestTempErrorDiff_Samp...
                    ./ liveData.LatestTimeDiff;
                Pd_Samp = obj.PID_Kd * derivativeTerm_Samp;
                
                % Calculate the new duty cycles for the reference sample
                % and the test sample
                newDutyCycle_Samp = Pp_Samp + Pi_Samp + Pd_Samp;
                
            end
            
            % Refresh the PWM duty cycle values of pulse generators using
            % the newly calculated values
            obj.updatePWMDutyCycle(newDutyCycle_Ref, newDutyCycle_Samp);
            
        end
    end
    
    % Data Listener Interface Methods
    methods
        function startCalibrationMeasurement(obj, stageController)
            %startHeating
            %   Configure the listener to perform the heating procedure
            
            if obj.UseDAQHardware
                obj.dqInput.ScansAvailableFcn = @stageController.calibrationDataFcn;
                
                start(obj.dqInput, "Continuous");
                
                obj.daqSemaphore.lock();
                
            else
                % TODO: make the simulated equivalent
                % obj.daqTrigger.startHeating(stageController, heatingType)
                warning('background calibration data is not implemented for simulated data');
            end
        end
        
        function startHeating(obj, stageController, heatingType)
            %startHeating
            %   Configure the listener to perform the heating procedure
            
            if obj.UseDAQHardware
                switch heatingType
                    case 'singleTarget'
                        obj.dqInput.ScansAvailableFcn = @stageController.singleTargetDataFcn;
                    case 'rampUp'
                        obj.dqInput.ScansAvailableFcn = @stageController.rampUpDataFcn;
                    case 'holdTemp'
                        obj.dqInput.ScansAvailableFcn = @stageController.holdTempDataFcn;
                    otherwise
                        error('Invalid heatingType = %s', heatingType)
                end
                
                start(obj.dqInput, "Continuous");
                
                start(obj.dqOutput, "Continuous");
                % start(obj.dqOutput, "Duration", obj.OUTPUT_DURATION);
                
                obj.daqSemaphore.lock();
                
            else
                obj.daqTrigger.startHeating(stageController, heatingType)
            end
        end
        
        function waitForDAQ(obj)
            %waitForDAQ
            %   Wait for the background data acquisition to be stopped
            
            pause(0.1);
            
            if obj.UseDAQHardware
                obj.daqSemaphore.wait();
                
            else
                obj.daqTrigger.waitForTrigger();
                
            end
        end
        
        function stopDAQ(obj)
            %stopDAQ
            %   Stop the background data aquisition
            
            if obj.UseDAQHardware
                stop(obj.dqInput);
                
                flush(obj.dqInput);
                
                obj.daqSemaphore.release();
                
            else
                obj.daqTrigger.stop();
                
            end
        end
    end
    
    % DSCData Interface Methods
    methods
        function recalculateHeatFlow(obj, dscData)
            %recalculateData
            %   Recalculate the Heat Flow values using the sample mass
            %   values stored in the SampleData objects and the CurrentData
            
            % Call the recalculateHeatFlow method from the DSCData ojbject
            dscData.recalculateHeatFlow(obj.HEATING_COIL_VOLTAGE);
        end
    end
    
    methods
        function plotSimulatedTempDistribution(obj)
            %plotSimulatedTempDistribution
            %   Plot a histogram of the simulated temperature error
            %   distrubtion
            t = zeros(1,1e6);
            for i=1:1e6
                t(i) = randn * obj.SIMULATED_TEMP_SPREAD_COEFFICIENT...
                    + obj.SIMULATED_TEMP_COOLING_CONSTANT;
            end
            histogram(t)
            xlabel("Temperature (\circC)")
        end
    end
    
    % Class Destructor Method
    methods
        function delete(obj)
            %Object Destructor Method
            %   This is run automatically when an object of this class is
            %   deleted
            
            % Attempt to stop the background data acquisition
            try
                obj.stopDAQ();
            catch
                warning('Failed to stop background data acquisition before Input DataAcquisition object was deleted.')
            end
            
            % Attempt to stop the heating coil PWM output
            try
                obj.stopPWM();
            catch
                warning('Failed to stop PWM output before Output DataAcquisition object was deleted.')
            end
        end
    end
    
    methods (Access = private)
        function [serialDate, tempReading_Ref, tempReading_Samp,...
                currentReading_Ref, currentReading_Samp]...
                = simulateInput(obj)
            %simulateInput
            %   Return simulated input values (for testing when not
            %   connected to a DAQ box)
            
            serialDate = datenum(datetime);
            
            tempReading_Ref = obj.SimulatedTemp_Ref;
            tempReading_Samp  = obj.SimulatedTemp_Samp;
            currentReading_Ref = obj.SimulatedCurrent_Ref;
            currentReading_Samp = obj.SimulatedCurrent_Samp;
        end
        
        function obj = simulateOutput(obj)
            %simulateOutput
            %   Produce simulated output values (for testing when not
            %   connected to a DAQ box)
            
            % Perform a rough simulation of the temperature change and
            % corresponding power data
            
            % Reference sample temperature simulation
            obj.SimulatedTemp_Ref = obj.SimulatedTemp_Ref...
                + obj.SIMULATED_TEMP_COOLING_CONSTANT...
                .* (...
                obj.SimulatedTemp_Ref - obj.SIMULATED_AMBIENT_TEMP...
                )...
                + (...
                obj.PWMDutyCycle_Ref...
                .* obj.SIMULATED_HEATING_COEFFICIENT...
                )...
                + randn * obj.SIMULATED_TEMP_SPREAD_COEFFICIENT;
            
            % Test sample temperature simulation
            obj.SimulatedTemp_Samp = obj.SimulatedTemp_Samp...
                + obj.SIMULATED_TEMP_COOLING_CONSTANT...
                .* (...
                obj.SimulatedTemp_Samp - obj.SIMULATED_AMBIENT_TEMP...
                )...
                + (...
                obj.PWMDutyCycle_Samp...
                .* obj.SIMULATED_HEATING_COEFFICIENT...
                )...
                + randn * obj.SIMULATED_TEMP_SPREAD_COEFFICIENT;
            
            % Reference sample current simulation
            obj.SimulatedCurrent_Ref...
                = (obj.PWMDutyCycle_Ref...
                .* obj.SIMULATED_CURRENT_COEFFICIENT);
            
            % Test sample current simulation
            obj.SimulatedCurrent_Samp...
                = (obj.PWMDutyCycle_Samp...
                .* obj.SIMULATED_CURRENT_COEFFICIENT);
            
        end
    end
end
