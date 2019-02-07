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

classdef SampleData < handle
    %SampleData Represents a matertial sample used in the DSC experiment
    %   Responsible to storing information about the material sample
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        Material
        Mass
        SpecificHeat
    end
    
    methods
        function obj = SampleData(material, mass, specificHeat)
            %SampleData Construct an instance of this class
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            if nargin > 0
                obj.Material = material;
                if nargin > 1
                    obj.Mass = mass;
                    if nargin > 2
                        obj.SpecificHeat = specificHeat;
                    end
                end
            end
        end
    end
end

