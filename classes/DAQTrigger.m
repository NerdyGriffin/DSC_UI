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
        devicesList = []
        
        % Boolean variable indicating whether to interact with a physical
        % DAQ Box (true) or simulate the hardware (false).
        UseDAQHardware logical = false
        
        TriggerSemaphore Semaphore
        
        % MATLAB timer class object
        TriggerTimer timer
        TimerExecutionMode = 'fixedRate'
        TimerPeriod = 0.1
    end
    
    methods
        function obj = DAQTrigger(devicesList, varargin)
            %DAQTrigger Construct an instance of this class
            %   Detailed explanation goes here
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            obj.UseDAQHardware = false;
            
            if nargin > 0
                obj.devicesList = devicesList;
            else
                % Check for DAQ devices before attempting to create
                % sessions
                fprintf('\nChecking for DAQ devices...\n')
                obj.devicesList = daqlist;
            end
            
            if isempty(obj.devicesList)
                disp('No DAQ devices have been detected.')
                obj.UseDAQHardware = false;
            else
                disp('DAQ device found')
                obj.UseDAQHardware = true;
                error('DAQTrigger should not be used when hardware is connected')
            end
            
            obj.TriggerSemaphore = Semaphore;
            obj.TriggerSemaphore.lock();
            obj.TriggerSemaphore.release();
            
        end
        
        function startHeating(obj, stageController, heatingType)
            %startHeating
            %   Configure the listener to perform the heating procedure
            
            obj.TriggerSemaphore.wait();
            obj.TriggerSemaphore.lock();
            
            % Delete any existing timers
            try
                delete(obj.TriggerTimer)
            catch ME
                warning('Failed to delete TriggerTimer')
                % Force the experiment to stop in the event of a
                % timer error
                stageController.forceStop();
                rethrow(ME)
            end
            
            % Create a new timer object using the callback corresponding to the
            % heatingType
            switch heatingType
                case 'singleTarget'
                    obj.TriggerTimer = timer(...
                        'ExecutionMode', obj.TimerExecutionMode, ...
                        'Period', obj.TimerPeriod, ...
                        'TimerFcn', @stageController.singleTargetDataFcn);
                case 'rampUp'
                    obj.TriggerTimer = timer(...
                        'ExecutionMode', obj.TimerExecutionMode, ...
                        'Period', obj.TimerPeriod, ...
                        'TimerFcn', @stageController.rampUpDataFcn);
                case 'holdTemp'
                    obj.TriggerTimer = timer(...
                        'ExecutionMode', obj.TimerExecutionMode, ...
                        'Period', obj.TimerPeriod, ...
                        'TimerFcn', @stageController.holdTempDataFcn);
                otherwise
                    error('Invalid heatingType = %s', heatingType)
            end
            
            % Start the timer object
            start(obj.TriggerTimer)
        end
        
        function waitForTrigger(obj)
            %waitForTrigger
            %   Wait for the trigger to be stopped
            
            obj.TriggerSemaphore.wait();
        end
        
        function stop(obj)
            %stop
            %   Stop running the current trigger
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
            
            obj.TriggerSemaphore.release();
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
