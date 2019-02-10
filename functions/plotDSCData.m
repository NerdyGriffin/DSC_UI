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

function plotDSCData(uiAxesDifferential, uiAxesSamples, ...
    liveData, XAxisData, TemperatureUnits)
%plotDSCData Create plots for testing the system

% Clear the previous plot so that the new plot may be drawn
cla(uiAxesDifferential)
cla(uiAxesSamples)

% Turn on "hold" for the data plot
hold(uiAxesDifferential, 'on')
hold(uiAxesSamples, 'on')

% Update the plots
switch XAxisData
    case 'Time'
        % Plot the data as Heat Flow Rate vs. Time
        plot(uiAxesDifferential,...
            liveData.TimeData,...
            liveData.HeatFlowData_Diff,...
            liveData.TimeDataRange, [0, 0], ':');
        
        plot(uiAxesSamples,...
            liveData.TimeData,...
            liveData.HeatFlowData_Ref, '--');
        
        plot(uiAxesSamples,...
            liveData.TimeData,...
            liveData.HeatFlowData_Samp, '-.');
        
        legend(uiAxesSamples, 'Reference Sample', 'Test Sample',...
            'Location', 'southeast')
        
    case 'Temp'
        switch TemperatureUnits
            case 'Celsius'
                % Plot the data as Heat Flow Rate vs. Temperature
                plot(uiAxesDifferential,...
                    liveData.TempData_Interpolated,...
                    liveData.HeatFlowRateData_Diff_Interpolated,...
                    liveData.TempData_Range, [0, 0], ':');
                
                plot(uiAxesSamples,...
                    liveData.TempData_Ref,...
                    liveData.HeatFlowData_Ref, '--');
                
                plot(uiAxesSamples,...
                    liveData.TempData_Samp,...
                    liveData.HeatFlowData_Samp, '-.');
                
                legend(uiAxesSamples, 'Reference Sample', 'Test Sample',...
                    'Location', 'best')
                
            case 'Kelvin'
                % Plot the data as Heat Flow Rate vs. Temperature
                plot(uiAxesDifferential,...
                    cel2kel(liveData.TempData_Interpolated),...
                    liveData.HeatFlowRateData_Diff_Interpolated,...
                    cel2kel(liveData.TempData_Range), [0, 0], ':');
                
                plot(uiAxesSamples,...
                    cel2kel(liveData.TempData_Ref),...
                    liveData.HeatFlowData_Ref, '--');
                
                plot(uiAxesSamples,...
                    cel2kel(liveData.TempData_Samp),...
                    liveData.HeatFlowData_Samp, '-.');
                
                legend(uiAxesSamples, 'Reference Sample', 'Test Sample',...
                    'Location', 'best')
                
        end
end

% Turn off "hold" for the data plots
hold(uiAxesDifferential, 'on')
hold(uiAxesSamples, 'on')

end

