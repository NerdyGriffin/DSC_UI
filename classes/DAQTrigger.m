classdef DAQTrigger < handle
    %DAQTrigger Represents the DSC trigger timers
    %   Responsible for maintaining and interacting with the DAQ trigger
    %   connections or timer objects that are used to trigger data
    %   aquisition
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        device = []
        
        UseDAQHardware logical = false
        
        Running = 'off'
        
        TriggerSemaphore Semaphore
        
        StopTriggerInProgress = false
        
        % MATLAB timer class object
        TriggerTimer timer
        TimerExecutionMode = 'fixedRate'
        TimerPeriod = 0.2
        
        % daq.ni.Session objects
        
        % The session for sending trigger connection signals at regular
        % intervals
        TriggerSession daq.ni.Session
        
        TriggerOutputChannel
        
        TriggerConnection
        
        
        
        % The time in seconds between executions of the trigger
        TriggerPeriod = 0.1;
        
    end
    
    properties (Constant)
        % The device ID of the DAQ Box
        DEVICE_ID = 'Dev1';
        
        % The channel ID's for each sensor
        CHANNEL_ID_TRIGGER = 'ctr0';
        
        % The PWM frequency of the PWM channels
        PWM_FREQUENCY = 1e6;
        
        % The maximum number of seconds to wait for the trigger to stop
        MAX_WAIT_TIMEOUT = 1e3;
    end
    
    methods
        function obj = DAQTrigger(device, varargin)
            %DAQTrigger Construct an instance of this class
            %   Detailed explanation goes here
            
            obj.UseDAQHardware = false;
            
            if nargin > 0
                obj.device = device;
            else
                % Check for DAQ devices before attempting to create
                % sessions
                fprintf('\nChecking for DAQ devices...\n')
                obj.device = daq.getDevices;
                if isempty(obj.device)
                    disp('No DAQ devices have been detected.')
                    obj.UseDAQHardware = false;
                else
                    disp('DAQ device found')
                    obj.UseDAQHardware = true;
                end
            end
            
            obj.createTriggerSession();
            
            obj.TriggerSemaphore = Semaphore;
            obj.TriggerSemaphore.lock();
            obj.TriggerSemaphore.release();
            
        end
        
        function obj = createTriggerSession(obj)
            %createTriggerSession
            %   Creates and configures the session that is used to trigger
            %   data aquisition
            
            if isempty(obj.device)
                % Delete the session object if no DAQ devices are found
                delete(obj.TriggerSession)
                
                obj.UseDAQHardware = false;
                
                % Inform the user that no devices were detected
                fprintf(['\nNo DAQ devices have been detected.\n'...
                    'To allow for UI testing, MATLAB timer objects will be used to trigger the data acquisition\n'])
            else
                disp('DAQ device found')
                
                % Release any existing sessions
                try
                    release(obj.TriggerSession)
                catch
                    % Do nothing in the event of an error
                end
                
                fprintf('\nCreating trigger session...\n')
                % Create the session for the input measurements
                obj.TriggerSession = daq.createSession('Ni');
                disp('Trigger session was successfully created')
                
                fprintf('\nConfiguring trigger session channels...\n')
                
                %Add the counter output channel for the trigger connection
                obj.TriggerOutputChannel = addCounterOutputChannel(obj.TriggerSession,...
                    obj.DEVICE_ID, obj.CHANNEL_ID_TRIGGER, 'PulseGeneration');
                obj.TriggerOutputChannel.Frequency = obj.PWM_FREQUENCY;
                obj.TriggerOutputChannel.Name = 'DAQ Trigger Output';
                disp('Created: counter output channel for DAQ trigger')
                
                fprintf('\nCreating trigger connection...\n')
                % Create a trigger connection
                
                % TRIGGER CONNECTION CODE HERE TRIGGER CONNECTION CODE HERE
                % TRIGGER CONNECTION CODE HERE
                warning(['Trigger connection code is not yet implemented.'...
                    'MATLAB timer objects will be used to trigger the data acquisition instead'])
                
                % CHANGE THE FOLLOWING LINE TO TRUE ONCE THE TRIGGER
                % CONNECTION CODE IS IMPLEMENTED
                obj.UseDAQHardware = false; %------------------------------
                
                % Confirm that the session was created successfully (for
                % debug purposes)
                disp(obj.TriggerSession)
                
            end
        end
        
        function startSingleTargetHeating(obj, stageController)
            %startSingleTargetHeating
            %   Configure the trigger to perform single target heating
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            if obj.UseDAQHardware
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                
            else
                % Delete ay existing timers
                try
                    delete(obj.TriggerTimer)
                catch ME
                    warning('failed to delete')
                    rethrow(ME)
                    % Do nothing in the event of an error
                end
                
                % Create a new timer object if DAQ hardware is not present
                obj.TriggerTimer = timer(...
                    'ExecutionMode', obj.TimerExecutionMode, ...
                    'Period', obj.TimerPeriod, ...
                    'TimerFcn', {@singleTargetTimerFcn, stageController});
                
                % Start the timer object
                start(obj.TriggerTimer)
                
            end
            
            obj.Running = 'on';
        end
        
        function startRampUpHeating(obj, stageController)
            %startRampUpHeating
            %   Configure the trigger to perform ramp up heating
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            if obj.UseDAQHardware
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                
            else
                % Delete ay existing timers
                try
                    delete(obj.TriggerTimer)
                catch
                    % Do nothing in the event of an error
                end
                
                % Create a new timer object if DAQ hardware is not present
                obj.TriggerTimer = timer(...
                    'ExecutionMode', obj.TimerExecutionMode, ...
                    'Period', obj.TimerPeriod, ...
                    'TimerFcn', {@rampUpTimerFcn, stageController});
                
                % Start the timer object
                start(obj.TriggerTimer)
                
            end
            
            obj.Running = 'on';
        end
        
        function startHoldTempHeating(obj, stageController)
            %startHoldTempHeating
            %   Configure the trigger to perform hold temp heating
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            if obj.UseDAQHardware
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                
            else
                % Delete ay existing timers
                try
                    delete(obj.TriggerTimer)
                catch
                    % Do nothing in the event of an error
                end
                
                % Create a new timer object if DAQ hardware is not present
                obj.TriggerTimer = timer(...
                    'ExecutionMode', obj.TimerExecutionMode, ...
                    'Period', obj.TimerPeriod, ...
                    'TimerFcn', {@holdTempTimerFcn, stageController});
                
                % Start the timer object
                start(obj.TriggerTimer)
                
            end
            
            obj.Running = 'on';
        end
        
        function waitForTrigger(obj)
            %waitForTrigger
            %   Wait for the trigger to be stopped
            
            obj.TriggerSemaphore.wait();
            
            disp('Done waiting for trigger')
        end
        
        function stop(obj)
            %stop
            %   Stop running the current trigger
            
            if obj.UseDAQHardware
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                % DAQ Box trigger connection stuff goes here
                
                
            else
                % Stop the trigger timer object if DAQ hardware
                % is not present
                for i=1:10
                    try
                        stop(obj.TriggerTimer)
                        delete(obj.TriggerTimer)
                        break
                    catch ME
                        if isvalid(obj.TriggerTimer)
                            if isequal(obj.TriggerTimer.Running, 'on')
                                rethrow(ME)
                            end
                        end
                    end
                end
            end
            
            obj.TriggerSemaphore.release();
            
            obj.Running = 'off';
            
            disp('Trigger stopped')
        end
    end
end

%--------------------------------------------------------------------------
% The following functions are the TimerFcn callback functions for the
% trigger timer object, which is used to trigger the procedure when DAQ
% hardware is not present

function singleTargetTimerFcn(~, ~, stageController)
%singleTarget_TimerFcn
%   The TimerFcn callback for single target heating
stageController.singleTargetHeating();
end

function rampUpTimerFcn(~, ~, stageController)
%rampUp_TimerFcn
%   The TimerFcn callback for ramp up heating
stageController.rampUpHeating();
end

function holdTempTimerFcn(~, ~, stageController)
%holdTemp_TimerFcn
%   The TimerFcn callback for hold temp heating
stageController.holdTempHeating();
end

