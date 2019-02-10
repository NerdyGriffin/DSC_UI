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

%% This file is used to perform tests of the DSC code

%% This test is deprecated
% This section tests the average time required to measure the inputs from
% all the hardware sensors
updatepath()

[TemperatureSensor_Reference, TemperatureSensor_TestSample,...
    PowerControl_Reference, PowerControl_TestSample,...
    PowerSensor_Reference, PowerSensor_TestSample]...
    = startSampleSessions([], [],...
    [], [],...
    [], [],...
    'Thermocouple')
tic
for i=1:1000
    TemperatureSensor_Reference.startForeground()
    release(TemperatureSensor_Reference)

    TemperatureSensor_TestSample.startForeground()
    release(TemperatureSensor_TestSample)

    PowerSensor_TestSample.startForeground()
    release(PowerSensor_Reference)

    PowerSensor_TestSample.startForeground()
    release(PowerSensor_TestSample)
    
    toc
end

%%
% This section compares the average time required to print information
% using the disp() function versus the fprintf() function
updatepath()

tic
for i=1:100
    disp(' ')
end
t1 = toc/100

tic
for i=1:100
    fprintf('\n')
end
t2 = toc/100

%%
% This section tests a method for combining multiple arrays of different
% length into colunms of a single cell array
updatepath()

tcell = {[1 2 3]; [1 2 3 4 5]; [1 2 3 4 5 6 7 8 9]; [1]; []};  % Sample cell array

maxSize = max(cellfun(@numel, tcell));               % Get the maximum vector size
fcn = @(x) [x, zeros(1, maxSize-numel(x))];          % Create an anonymous function
rmat = cellfun(fcn, tcell, 'UniformOutput', false);  % Pad each cell with NaNs
rmat = vertcat(rmat{:})'                             % Vertically concatenate cells
