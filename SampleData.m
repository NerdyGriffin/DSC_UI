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

