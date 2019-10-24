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

classdef DAQTrigger < handle
    %DAQTrigger Represents the DSC trigger timers
    %   Responsible for maintaining and interacting with the DAQ trigger
    %   connections or timer objects that are used to trigger data
    %   aquisition
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        device = []
        
        % Boolean variable indicating whether to interact with a physical
        % DAQ Box (true) or simulate the hardware (false).
        UseDAQHardware logical = false
        
        % Boolean variable indicating whether the trigger is running
        Running = 'off'
        
        TriggerSemaphore Semaphore
        
        StopTimerInProgress = false
        
        % MATLAB timer class object
        TriggerTimer timer
        TimerExecutionMode = 'fixedRate'
        TimerPeriod = 0.2
    end
    
    % daq.ni.Session objects
    properties
        % The session for sending trigger connection signals at regular
        % intervals
        TriggerSession daq.ni.Session
        
        TriggerOutputChannel
        
        TriggerConnection
    end
    
    % Trigger Properties
    properties
        % The time in seconds between executions of the trigger
        TriggerPeriod = 0.2;
        
    end
    
    properties (Constant)
        % The device ID of the DAQ Box
        DEVICE_ID = 'Dev1';
        
        % The channel ID's for each sensor
        CHANNEL_ID_TRIGGER = 'ctr2';
        
        % The PWM frequency of the PWM channels
        PWM_FREQUENCY = 1e6;
        
        % The maximum number of seconds to wait for the trigger to stop
        MAX_WAIT_TIMEOUT = 1e3;
    end
    
    methods
        function obj = DAQTrigger(device, varargin)
            %DAQTrigger Construct an instance of this class
            %   Detailed explanation goes here
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            obj.UseDAQHardware = false;
            
            if nargin > 0
                obj.device = device;
            else
                % Check for DAQ devices before attempting to create
                % sessions
                fprintf('\nChecking for DAQ devices...\n')
                obj.device = daq.getDevices;
            end
            
            if isempty(obj.device)
                disp('No DAQ devices have been detected.')
                obj.UseDAQHardware = false;
            else
                disp('DAQ device found')
                obj.UseDAQHardware = true;
            end
            
            obj.TriggerSemaphore = Semaphore;
            obj.TriggerSemaphore.lock();
            obj.TriggerSemaphore.release();
            
        end
        
        function startSingleTargetHeating(obj, stageController)
            %startSingleTargetHeating
            %   Configure the trigger to perform single target heating
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            % Delete any existing timers
            try
                delete(obj.TriggerTimer)
            catch ME
                warning('failed to delete')
                % Force the experiment to stop in the event of a
                % timer error
                stageController.forceStop();
                rethrow(ME)
            end
            
            % Create a new timer object if DAQ hardware is not present
            obj.TriggerTimer = timer(...
                'ExecutionMode', obj.TimerExecutionMode, ...
                'Period', obj.TimerPeriod, ...
                'TimerFcn', {@singleTargetTimerFcn, obj, stageController});
            
            % Start the timer object
            start(obj.TriggerTimer)
            
            obj.Running = 'on';
        end
        
        function startRampUpHeating(obj, stageController)
            %startRampUpHeating
            %   Configure the trigger to perform ramp up heating
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            % Delete any existing timers
            try
                delete(obj.TriggerTimer)
            catch ME
                warning('failed to delete')
                % Force the experiment to stop in the event of a
                % timer error
                stageController.forceStop();
                rethrow(ME)
            end
            
            % Create a new timer object if DAQ hardware is not present
            obj.TriggerTimer = timer(...
                'ExecutionMode', obj.TimerExecutionMode, ...
                'Period', obj.TimerPeriod, ...
                'TimerFcn', {@rampUpTimerFcn, obj, stageController});
            
            % Start the timer object
            start(obj.TriggerTimer)
            
            obj.Running = 'on';
        end
        
        function startHoldTempHeating(obj, stageController)
            %startHoldTempHeating
            %   Configure the trigger to perform hold temp heating
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            % Delete any existing timers
            try
                delete(obj.TriggerTimer)
            catch ME
                warning('failed to delete')
                % Force the experiment to stop in the event of a
                % timer error
                stageController.forceStop();
                rethrow(ME)
            end
            
            % Create a new timer object if DAQ hardware is not present
            obj.TriggerTimer = timer(...
                'ExecutionMode', obj.TimerExecutionMode, ...
                'Period', obj.TimerPeriod, ...
                'TimerFcn', {@holdTempTimerFcn, obj, stageController});
            
            % Start the timer object
            start(obj.TriggerTimer)
            
            obj.Running = 'on';
        end
        
        function waitForTrigger(obj)
            %waitForTrigger
            %   Wait for the trigger to be stopped
            
            obj.TriggerSemaphore.wait();
            
        end
        
        function stop(obj)
            %stop
            %   Stop running the current trigger
            % Stop the trigger timer object if DAQ hardware
            % is not present
            obj.StopTimerInProgress = true;
            
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
            
            obj.StopTimerInProgress = false;
            
            obj.TriggerSemaphore.release();
            
            obj.Running = 'off';
            
        end
        
        function delete(obj)
            %Object Destructor Method
            % This is run automatically when an object of this class is deleted
            
            % Attempt to stop the trigger
            try
                obj.stop();
            catch
                warning('Failed to stop trigger before DAQTrigger object was deleted.')
            end
        end
    end
end

%--------------------------------------------------------------------------
% The following functions are the TimerFcn callback functions for the
% trigger timer object, which is used to trigger the procedure when DAQ
% hardware is not present

function singleTargetTimerFcn(obj, event, daqTrigger, stageController)
%singleTarget_TimerFcn
%   The TimerFcn callback for single target heating
StopTimerInProgress = daqTrigger.StopTimerInProgress;

if StopTimerInProgress
    obj.stop();
else
    stageController.singleTargetHeating(event);
end
end

function rampUpTimerFcn(~, event, daqTrigger, stageController)
%rampUp_TimerFcn
%   The TimerFcn callback for ramp up heating
StopTimerInProgress = daqTrigger.StopTimerInProgress;

if StopTimerInProgress
    obj.stop();
else
    stageController.rampUpHeating(event);
end
end

function holdTempTimerFcn(~, event, daqTrigger, stageController)
%holdTemp_TimerFcn
%   The TimerFcn callback for hold temp heating
StopTimerInProgress = daqTrigger.StopTimerInProgress;

if StopTimerInProgress
    obj.stop();
else
    stageController.holdTempHeating(event);
end
end
