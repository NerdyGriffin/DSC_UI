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

classdef DSCData < handle
    % DSCData
    %   Responsible for storing the data that is recorded from DSC
    %   experiements
    %
    %   Author: Christian Kunis (Nov 27, 2018)
    
    properties
        % An object of the DSCSample class which represents the reference
        % sample and stores information about the reference sample
        ReferenceSampleData SampleData
        
        % An object of the DSCSample class which represents the test sample
        % and stores information about the test sample
        TestSampleData SampleData
        
        
        % The start time of the experiment recorded as a serial date number
        %  (A serial date number represents the whole and fractional number
        %  of days from a fixed, preset date (January 0, 0000) in the
        %  proleptic ISO calendar.)
        ExpStartSerialDate
        
        % The start times of each stage recorded as serial date numbers
        % since the experiment start time
        %  (A serial date number represents the whole and fractional number
        %  of days from a fixed, preset date (January 0, 0000) in the
        %  proleptic ISO calendar.)
        StageStartSerialDates(1,:) = []
        
        % Array for the time at which each reading is taken, recorded as
        % serial date numbers since the experiment start time
        SerialDateData(1,:) = []
        
        
        % Array of temp target values, used for temperature control and
        % error analysis [degrees Celsius]
        TargetTempData(1,:) = []
        
        
        % Arrays for the measured temperatures from each reading [degrees
        % Celsius]
        TempData_Ref(1,:) = []
        TempData_Samp(1,:) = []
        
        % Arrays for the error (difference) comparing the measured
        % temperatures and the target temperature from each reading
        % [{Delta} degrees Celsius]
        TempErrorData_Ref(1,:) = []
        TempErrorData_Samp(1,:) = []
        
        
        % Arrays for the measured current outputs from each reading [Amps]
        CurrentData_Ref(1,:) = []
        CurrentData_Samp(1,:) = []
        
        % Arrays for the calculated HeatFlow values from each reading
        % [Watts per gram]
        HeatFlowData_Ref(1,:) = []
        HeatFlowData_Samp(1,:) = []
        HeatFlowData_Diff(1,:) = []
        
        
        % Arrays for the PIDOut values calculated by the calculatePID
        % function [percentage]
        PWMDutyCycleData_Ref(1,:) = []
        PWMDutyCycleData_Samp(1,:) = []
        
    end
    
    properties (Dependent)
        AllData
        
        DataLength(1,1)
        
        ExpStartTime
        
        LatestStageSerialDate
        
        StageStartTimes
        
        LatestStageStartTime
        
        LatestSerialDate
        
        LatestTime
        
        TimeData
        
        LatestTimeDiff
        
        TimeDataRange
        
        LatestTargetTemp
        
        LatestTemp_Ref
        LatestTemp_Samp
        
        TempDataRange
        
        LatestTempError_Ref
        LatestTempError_Samp
        
        LatestTempErrorDiff_Ref
        LatestTempErrorDiff_Samp
        
        LatestCurrent_Ref
        LatestCurrent_Samp
        
        LatestHeatFlow_Ref
        LatestHeatFlow_Samp
        LatestHeatFlow_Diff
        
        LatestPWMDutyCycle_Ref
        LatestPWMDutyCycle_Samp
        
        TempData_Interpolated
        
        HeatFlowData_Ref_Interpolated
        HeatFlowData_Samp_Interpolated
        
        HeatFlowData_Diff_Interpolated
    end
    
    properties (Constant)
        DEFAULT_MAT_LOAD_PATH = './saveData/*.mat'
        
        DEFAULT_XLSX_LOAD_PATH = './saveData/*.xlsx'
        
        DEFAULT_MAT_SAVE_PATH = './saveData/dscData.mat'
        
        DEFAULT_XLSX_SAVE_PATH = './saveData/dscData.xlsx'
        
        INTERP_METHOD = 'spline'
    end
    
    methods
        function obj = DSCData(referenceSampleData, testSampleData)
            %DSCData Construct an instance of this class
            %   Detailed explanation goes here
            
            % Add the DSC subdirectories to the MATLAB search path
            updatepath();
            
            if nargin > 1
                obj.ReferenceSampleData = referenceSampleData;
            else
                obj.ReferenceSampleData = SampleData('Unknown Reference Sample', 0.1, 1);
            end
            
            if nargin > 2
                obj.TestSampleData = testSampleData;
            else
                obj.TestSampleData = SampleData('Unknown Test Sample', 0.1, 1);
            end
        end
        
        function allData = get.AllData(obj)
            %get.AllData
            %   Return a matrix containing all of the stored data, with
            %   each variable as a column of the matrix
            
            cellArray = {obj.SerialDateData;... % 1
                obj.TimeData;...                % 2
                obj.TargetTempData;...          % 3
                obj.TempData_Ref;...            % 4
                obj.TempData_Samp;...           % 5
                obj.TempErrorData_Ref;...       % 6
                obj.TempErrorData_Samp;...      % 7
                obj.CurrentData_Ref;...         % 8
                obj.CurrentData_Samp;...        % 9
                obj.HeatFlowData_Ref;...        % 10
                obj.HeatFlowData_Samp;...       % 11
                obj.HeatFlowData_Diff;...       % 12
                obj.PWMDutyCycleData_Ref;...    % 13
                obj.PWMDutyCycleData_Samp};     % 14
            
            maxSize = max(cellfun(@numel, cellArray));
            padZeros = @(x) [x, zeros(1, maxSize-numel(x))];
            allData = cellfun(padZeros, cellArray, 'UniformOutput', false);
            allData = vertcat(allData{:})';
        end
        
        function dataLength = get.DataLength(obj)
            %get.DataLength
            %   Return the number of data points currently recorded
            dataLength = length(obj.SerialDateData);
        end
        
        function latestStageSerialData = get.LatestStageSerialDate(obj)
            %get.LatestStageSerialDate
            %   Return the serial date from the most recent stage
            if ~isempty(obj.StageStartSerialDates)
                latestStageSerialData = obj.StageStartSerialDates(end);
            else
                latestStageSerialData = 0;
            end
        end
        
        function stageStartTimes = get.StageStartTimes(obj)
            %get.StageStartTimes
            %   Return a row vector containing the start times of each
            %   stage measured as the number of seconds since the
            %   experiment start time
            
            stageStartTimes = date2sec(...
                obj.StageStartSerialDates - obj.ExpStartSerialDate);
        end
        
        function latestStageStartTime = get.LatestStageStartTime(obj)
            %get.LatestStageSerialDate
            %   Return the start time from the most recent stage, measured
            %   in seconds since the experiment start time
            if ~isempty(obj.StageStartSerialDates)
                latestStageStartTime = date2sec(...
                    obj.StageStartSerialDates(end));
            else
                latestStageStartTime = 0;
            end
        end
        
        function latestSerialDate = get.LatestSerialDate(obj)
            %get.LatestSerialDate
            %   Return the latest recorded elapsed time, measures as the
            %   number of seconds since the experiment start time
            
            if obj.DataLength > 0
                latestSerialDate = obj.SerialDateData(end);
            else
                latestSerialDate = datenum(datetime);
            end
        end
        
        function latestTime = get.LatestTime(obj)
            %get.LatestTime
            %   Return the latest recorded elapsed time, measures as the
            %   number of seconds since the experiment start time
            
            latestTime = date2sec(...
                obj.LatestSerialDate - obj.ExpStartSerialDate);
        end
        
        function timeData = get.TimeData(obj)
            %get.TimeData
            %   Return a row vector containing  the time at which each
            %   reading is taken, recorded as the number of seconds since
            %   the experiment start time
            
            timeData = date2sec(...
                obj.SerialDateData - obj.ExpStartSerialDate);
        end
        
        function latestTimeDiff = get.LatestTimeDiff(obj)
            %get.LatestTimeDiff
            %   Return the difference of the values from the two most
            %   recent time measurements
            if length(obj.TimeData) > 1
                latestTimeDiff = diff(obj.TimeData(end-1:end));
            else
                latestTimeDiff = 1;
            end
        end
        
        function timeDataRange = get.TimeDataRange(obj)
            %get.TimeDataRange
            %   Return a row vector containing the minimum and maximum
            %   recorded time values
            
            minTime = floor(min(obj.TimeData));
            maxTime = ceil(max(obj.TimeData));
            
            timeDataRange = [minTime, maxTime];
            
            if isempty(timeDataRange)
                timeDataRange = [0 0];
            end
        end
        
        function latestTargetTemp = get.LatestTargetTemp(obj)
            %get.LatestTargetTemp
            %   Return the value from the most recent target temperature
            if ~isempty(obj.TargetTempData)
                latestTargetTemp = obj.TargetTempData(end);
            else
                latestTargetTemp = 0;
            end
        end
        
        function latestTemp_Ref = get.LatestTemp_Ref(obj)
            %get.LatestTemp_Ref
            %   Return the value from the most recent measurement of the
            %   reference sample temperature
            if ~isempty(obj.TempData_Ref)
                latestTemp_Ref = obj.TempData_Ref(end);
            else
                latestTemp_Ref = 0;
            end
        end
        
        function latestTemp_Samp = get.LatestTemp_Samp(obj)
            %get.LatestTemp_Samp
            %   Return the value from the most recent measurement of the
            %   test sample temperature
            if ~isempty(obj.TempData_Samp)
                latestTemp_Samp = obj.TempData_Samp(end);
            else
                latestTemp_Samp = 0;
            end
        end
        
        function tempDataRange = get.TempDataRange(obj)
            %get.TempDataRange
            %   Return a row vector containing the minimum and maximum
            %   recorded celsius temperature values
            
            tempData_Combined = [obj.TempData_Ref, obj.TempData_Samp];
            
            minTemp = floor(min(tempData_Combined));
            maxTemp = ceil(max(tempData_Combined));
            
            tempDataRange = [minTemp, maxTemp];
            
            if isempty(tempData_Combined)
                tempDataRange = [0, 0];
            end
        end
        
        function latestTempError_Ref = get.LatestTempError_Ref(obj)
            %get.LatestTempError_Ref
            %   Return the error from the most recent measurement of the
            %   reference sample temperature
            if ~isempty(obj.TempErrorData_Ref)
                latestTempError_Ref = obj.TempErrorData_Ref(end);
            else
                latestTempError_Ref = 0;
            end
        end
        
        function latestTempError_Samp = get.LatestTempError_Samp(obj)
            %get.LatestTempError_Samp
            %   Return the error from the most recent measurement of the
            %   test sample temperature
            if ~isempty(obj.TempErrorData_Samp)
                latestTempError_Samp = obj.TempErrorData_Samp(end);
            else
                latestTempError_Samp = 0;
            end
        end
        
        function latestTempErrorDiff_Ref = get.LatestTempErrorDiff_Ref(obj)
            %get.LatestTempError_Ref
            %   Return the difference of the errors values from the two
            %   most recent measurements of the reference sample
            %   temperature
            if length(obj.TempErrorData_Ref) > 1
                latestTempErrorDiff_Ref = diff(obj.TempErrorData_Ref(end-1:end));
            else
                latestTempErrorDiff_Ref = 0;
            end
        end
        
        function latestTempErrorDiff_Samp = get.LatestTempErrorDiff_Samp(obj)
            %get.LatestTempError_Samp
            %   Return the difference of the errors values from the two
            %   most recent measurements of the test sample temperature
            if length(obj.TempErrorData_Samp) > 1
                latestTempErrorDiff_Samp = diff(obj.TempErrorData_Samp(end-1:end));
            else
                latestTempErrorDiff_Samp = 0;
            end
        end
        
        function latestCurrent_Ref = get.LatestCurrent_Ref(obj)
            %get.LatestCurrent_Ref
            %   Return the value from the most recent measurement of the
            %   reference sample heating coil current
            if ~isempty(obj.CurrentData_Ref)
                latestCurrent_Ref = obj.CurrentData_Ref(end);
            else
                latestCurrent_Ref = 0;
            end
        end
        
        function latestCurrent_Samp = get.LatestCurrent_Samp(obj)
            %get.LatestCurrent_Samp
            %   Return the value from the most recent measurement of the
            %   test sample heaitng coil current
            if ~isempty(obj.CurrentData_Samp)
                latestCurrent_Samp = obj.CurrentData_Samp(end);
            else
                latestCurrent_Samp = 0;
            end
        end
        
        function latestHeatFlow_Ref = get.LatestHeatFlow_Ref(obj)
            %get.LatestHeatFlow_Ref
            %   Return the value from the most recent calculation of the
            %   reference sample heat flow
            if ~isempty(obj.HeatFlowData_Ref)
                latestHeatFlow_Ref = obj.HeatFlowData_Ref(end);
            else
                latestHeatFlow_Ref = 0;
            end
        end
        
        function latestHeatFlow_Samp = get.LatestHeatFlow_Samp(obj)
            %get.LatestHeatFlow_Samp
            %   Return the value from the most recent calculation of the
            %   test sample heat flow
            if ~isempty(obj.HeatFlowData_Samp)
                latestHeatFlow_Samp = obj.HeatFlowData_Samp(end);
            else
                latestHeatFlow_Samp = 0;
            end
        end
        
        function latestHeatFlow_Diff = get.LatestHeatFlow_Diff(obj)
            %get.LatestHeatFlow_Diff
            %   Return the value from the most recent calculation of the
            %   differential heat flow
            if ~isempty(obj.HeatFlowData_Samp)
                latestHeatFlow_Diff = obj.HeatFlowData_Samp(end);
            else
                latestHeatFlow_Diff = 0;
            end
        end
        
        function latestPWMDutyCycle_Ref = get.LatestPWMDutyCycle_Ref(obj)
            %get.LatestPWMDutyCycle_Ref
            %   Return the value from the most recent measurement of the
            %   reference sample heating coil PWM duty cycle
            if ~isempty(obj.PWMDutyCycleData_Ref)
                latestPWMDutyCycle_Ref = obj.PWMDutyCycleData_Ref(end);
            else
                latestPWMDutyCycle_Ref = 0;
            end
        end
        
        function latestPWMDutyCycle_Samp = get.LatestPWMDutyCycle_Samp(obj)
            %get.LatestPWMDutyCycle_Samp
            %   Return the value from the most recent measurement of the
            %   test sample heaitng coil PWM duty cycle
            if ~isempty(obj.PWMDutyCycleData_Samp)
                latestPWMDutyCycle_Samp = obj.PWMDutyCycleData_Samp(end);
            else
                latestPWMDutyCycle_Samp = 0;
            end
        end
        
        function tempData_Interpolated = get.TempData_Interpolated(obj)
            %get.TempData_Interpolated
            %   Return the interpolated celsius temperature data,
            %   calculated over the full range of existing temperature data
            if length(obj.TempData_Ref) > 2
                %[minTemp, maxTemp] = obj.TempDataRange;
                minTemp = obj.TempDataRange(1);
                maxTemp = obj.TempDataRange(2);
                
                tempData_Interpolated = linspace(minTemp, maxTemp,...
                    2 * length(obj.TempData_Ref));
            else
                tempData_Interpolated = obj.TempDataRange;
            end
        end
        
        function heatFlowData_Ref_Interpolated = get.HeatFlowData_Ref_Interpolated(obj)
            %get.HeatFlowData_Ref_Interpolated
            %   Return the interpolated reference sample heat flow data,
            %   calculated using the original reference sample heat flow
            %   data and the interpolated temperature data
            n = obj.DataLength; %length(obj.HeatFlowData_Ref);
            switch n
                case 0
                    heatFlowData_Ref_Interpolated = [0, 0];
                case 1
                    heatFlowData_Ref_Interpolated...
                        = [min(obj.HeatFlowData_Ref), max(obj.HeatFlowData_Ref)];
                case 2
                    heatFlowData_Ref_Interpolated = obj.HeatFlowData_Ref;
                otherwise
                    % Interpolation requires that sample points must be
                    % unique and sorted in ascending order
                    
                    % Store corresponding temperature and heat flow data
                    unsortedData = [obj.TempData_Ref', obj.HeatFlowData_Ref'];
                    % Sort the data by temperature
                    sortedData = sortrows(unsortedData);
                    % Find unique x values
                    [~,idx] = unique(sortedData(:,1));
                    % Remove rows with duplicate x values
                    uniqueData = sortedData(idx,:);
                    % Store the sorted data in separate arrays
                    sortedTempData_Ref = uniqueData(:,1);
                    sortedHeatFlowData_Ref = uniqueData(:,2);
                    % Interpolate the heat flow data
                    heatFlowData_Ref_Interpolated...
                        = interp1(sortedTempData_Ref, sortedHeatFlowData_Ref,...
                        obj.TempData_Interpolated, obj.INTERP_METHOD);
            end
        end
        
        function heatFlowData_Samp_Interpolated = get.HeatFlowData_Samp_Interpolated(obj)
            %get.HeatFlowData_Samp_Interpolated
            %   Return the interpolated test sample heat flow data,
            %   calculated using the original test sample heat flow data
            %   and the interpolated temperature data
            n = obj.DataLength; %length(obj.HeatFlowData_Samp);
            switch n
                case 0
                    heatFlowData_Samp_Interpolated = [0, 0];
                case 1
                    heatFlowData_Samp_Interpolated...
                        = [min(obj.HeatFlowData_Samp), max(obj.HeatFlowData_Samp)];
                case 2
                    heatFlowData_Samp_Interpolated = obj.HeatFlowData_Samp;
                otherwise
                    % Interpolation requires that sample points must be
                    % unique and sorted in ascending order
                    
                    % Store corresponding temperature and heat flow data
                    unsortedData = [obj.TempData_Samp', obj.HeatFlowData_Samp'];
                    % Sort the data by temperature
                    sortedData = sortrows(unsortedData);
                    % Find unique x values
                    [~,idx] = unique(sortedData(:,1));
                    % Remove rows with duplicate x values
                    uniqueData = sortedData(idx,:);
                    % Store the sorted data in separate arrays
                    sortedTempData_Samp = uniqueData(:,1);
                    sortedHeatFlowData_Samp = uniqueData(:,2);
                    % Interpolate the heat flow data
                    heatFlowData_Samp_Interpolated...
                        = interp1(sortedTempData_Samp, sortedHeatFlowData_Samp,...
                        obj.TempData_Interpolated, obj.INTERP_METHOD);
            end
        end
        
        function heatFlowData_Diff_Interpolated = get.HeatFlowData_Diff_Interpolated(obj)
            %get.HeatFlowData_Diff_Interpolated
            %   Return the interpolated differential heat flow data,
            %   calculated from the interpolated reference sample heat flow
            %   rate data and the interpolated test sample heat flow data
            heatFlowData_Diff_Interpolated...
                = obj.HeatFlowData_Samp_Interpolated...
                - obj.HeatFlowData_Ref_Interpolated;
        end
        
        function set.LatestStageSerialDate(obj, newSerialDate)
            %set.LatestStageSerialDate
            %   concatinate the newSerialData value onto the end of the
            %   StageStartSerialDates row vector
            obj.StageStartSerialDates(end+1) = newSerialDate;
        end
        
        function set.LatestSerialDate(obj, newSerialDate)
            %set.LatestSerialDate
            %   converts the newSerialDate value to the time in seconds
            %   since the start of the experiment and concatinate this
            %   value onto the end of the TimeData row vector
            obj.SerialDateData(end+1) = newSerialDate;
        end
        
        function set.LatestTime(obj, newTime)
            %set.LatestTime
            %   concatinate the newTime value onto the end of the TimeData
            %   row vector
            obj.SerialDateData(end+1) = sec2date(newTime)...
                + obj.ExpStartSerialDate;
        end
        
        function set.LatestTargetTemp(obj, newTargetTemp)
            %set.LatestTargetTemp
            %   concatinate the newTargetTemp value onto the end of the
            %   TargetTempData row vector
            obj.TargetTempData(end+1) = newTargetTemp;
        end
        
        function set.LatestTemp_Ref(obj, newTemp_Ref)
            %set.LatestTemp_Ref
            %   concatinate the newTemp_Ref value onto the end of the
            %   TempData_Ref row vector
            obj.TempData_Ref(end+1) = newTemp_Ref;
        end
        
        function set.LatestTemp_Samp(obj, newTemp_Samp)
            %set.LatestTempData_Samp
            %   concatinate the newTemp_Samp value onto the end of the
            %   TempData_Samp row vector
            obj.TempData_Samp(end+1) = newTemp_Samp;
        end
        
        function set.LatestTempError_Ref(obj, newTempError_Ref)
            %set.LatestTempErrorData_Ref
            %   concatinate the newTempError_Ref value onto the end of the
            %   TempErrorData_Ref row vector
            obj.TempErrorData_Ref(end+1) = newTempError_Ref;
        end
        
        function set.LatestTempError_Samp(obj, newTempError_Samp)
            %set.LatestTempErrorData_Samp
            %   concatinate the newTempError_Samp value onto the end of the
            %   TempErrorData_Samp row vector
            obj.TempErrorData_Samp(end+1) = newTempError_Samp;
        end
        
        function set.LatestCurrent_Ref(obj, newCurrent_Ref)
            %set.LatestCurrentData_Ref
            %   concatinate the newCurrent_Ref value onto the end of the
            %   CurrentData_Ref row vector
            obj.CurrentData_Ref(end+1) = newCurrent_Ref;
        end
        
        function set.LatestCurrent_Samp(obj, newCurrent_Samp)
            %set.LatestCurrentData_Samp
            %   concatinate the newCurrent_Samp value onto the end of the
            %   CurrentData_Samp row vector
            obj.CurrentData_Samp(end+1) = newCurrent_Samp;
        end
        
        function set.LatestHeatFlow_Ref(obj, newHeatFlow_Ref)
            %set.LatestHeatFlowData_Ref
            %   concatinate the newHeatFlow_Ref value onto the end of the
            %   HeatFlowData_Ref row vector
            obj.HeatFlowData_Ref(end+1) = newHeatFlow_Ref;
        end
        
        function set.LatestHeatFlow_Samp(obj, newHeatFlow_Samp)
            %set.LatestHeatFlowData_Samp
            %   concatinate the newHeatFlow_Samp value onto the end of the
            %   HeatFlowData_Samp row vector
            obj.HeatFlowData_Samp(end+1) = newHeatFlow_Samp;
        end
        
        function set.LatestHeatFlow_Diff(obj, newHeatFlow_Diff)
            %set.LatestHeatFlowData_Diff
            %   concatinate the newHeatFlow_Diff value onto the end of the
            %   HeatFlowData_Diff row vector
            obj.HeatFlowData_Diff(end+1) = newHeatFlow_Diff;
        end
        
        function set.LatestPWMDutyCycle_Ref(obj, newPWMDutyCycle_Ref)
            %set.LatestPWMDutyCycleData_Ref
            %   concatinate the newPWMDutyCycle_Ref value onto the end of
            %   the PWMDutyCycleData_Ref row vector
            obj.PWMDutyCycleData_Ref(end+1) = newPWMDutyCycle_Ref;
        end
        
        function set.LatestPWMDutyCycle_Samp(obj, newPWMDutyCycle_Samp)
            %set.LatestPWMDutyCycleData_Samp
            %   concatinate the newPWMDutyCycle_Samp value onto the end of
            %   the PWMDutyCycleData_Samp row vector
            obj.PWMDutyCycleData_Samp(end+1) = newPWMDutyCycle_Samp;
        end
        
        function dataLoadStatus = loadMATFile(obj,...
                fileName, filePath, varargin)
            %loadMATFile
            %   Read the values from a selected .mat file and store
            %   them in the appropriate properties
            
            if nargin > 1
                dataFileName = fileName;
                if nargin > 2
                    dataFilePath = filePath;
                else
                    dataFilePath = '';
                end
            else
                % Prompt the user to select a file
                [dataFileName, dataFilePath] = uigetfile(obj.DEFAULT_MAT_LOAD_PATH);
            end
            
            switch dataFileName
                case 0
                    % Cancel the read operation and return status as false
                    % if the user closes the file selection window
                    dataLoadStatus = false;
                    return
                    
                otherwise
                    % Create fully-formed filename as a string
                    dataFullPath = fullfile(dataFilePath, dataFileName);
                    
                    % Load the .mat files into a temporary struct variable
                    S = load(dataFullPath);
                    
                    if ~isfield(S, 'dscData')
                        warning('The selected .mat file does not contain a DSCData object.')
                        
                        dataLoadStatus = false;
                        
                        return
                        
                    end
                    
                    % Get each of the properties from the temporary struct
                    % and store them in the appropriate properties
                    obj.ReferenceSampleData = S.dscData.ReferenceSampleData;
                    obj.TestSampleData = S.dscData.TestSampleData;
                    obj.ExpStartSerialDate = S.dscData.ExpStartSerialDate;
                    obj.StageStartSerialDates = S.dscData.StageStartSerialDates;
                    obj.SerialDateData = S.dscData.SerialDateData;
                    obj.TargetTempData = S.dscData.TargetTempData;
                    obj.TempData_Ref = S.dscData.TempData_Ref;
                    obj.TempData_Samp = S.dscData.TempData_Samp;
                    obj.TempErrorData_Ref = S.dscData.TempErrorData_Ref;
                    obj.TempErrorData_Samp = S.dscData.TempErrorData_Samp;
                    obj.CurrentData_Ref = S.dscData.CurrentData_Ref;
                    obj.CurrentData_Samp = S.dscData.CurrentData_Samp;
                    obj.HeatFlowData_Ref = S.dscData.HeatFlowData_Ref;
                    obj.HeatFlowData_Samp = S.dscData.HeatFlowData_Samp;
                    obj.HeatFlowData_Diff = S.dscData.HeatFlowData_Diff;
                    obj.PWMDutyCycleData_Ref = S.dscData.PWMDutyCycleData_Ref;
                    obj.PWMDutyCycleData_Samp = S.dscData.PWMDutyCycleData_Samp;
            end
        end
        
        function dataLoadStatus = loadXlsxFile(obj,...
                fileName, filePath, varargin)
            %loadXlsxFile
            %   Read the values from a selected xlsx data file and store
            %   them in the appropriate properties
            
            if nargin > 1
                dataFileName = fileName;
                if nargin > 2
                    dataFilePath = filePath;
                else
                    dataFilePath = '';
                end
            else
                % Prompt the user to select a file
                [dataFileName, dataFilePath] = uigetfile(obj.DEFAULT_XLSX_LOAD_PATH);
            end
            
            switch dataFileName
                case 0
                    % Cancel the read operation and return status as false
                    % if the user closes the file selection window
                    dataLoadStatus = false;
                    return
                    
                otherwise
                    % Create fully-formed filename as a string
                    dataFullPath = fullfile(dataFilePath, dataFileName);
                    
                    % Read the data from the selected .xlsx file and store
                    % it temporarily in a array
                    dataArray = xlsread(dataFullPath, 'A:N');
                    
                    % Separate the data values into the appropriate
                    % variables
                    obj.SerialDateData = dataArray(:,1);
                    obj.TargetTempData = dataArray(:,3);
                    obj.TempData_Ref = dataArray(:,4);
                    obj.TempData_Samp = dataArray(:,5);
                    obj.TempErrorData_Ref = dataArray(:,6);
                    obj.TempErrorData_Samp = dataArray(:,7);
                    obj.CurrentData_Ref = dataArray(:,8);
                    obj.CurrentData_Samp = dataArray(:,9);
                    obj.HeatFlowData_Ref = dataArray(:,10);
                    obj.HeatFlowData_Samp = dataArray(:,11);
                    obj.HeatFlowData_Diff = dataArray(:,12);
                    obj.PWMDutyCycleData_Ref = dataArray(:,13);
                    obj.PWMDutyCycleData_Samp = dataArray(:,14);
                    
                    serialDateArray = xlsread(dataFullPath, 'P:Q');
                    
                    % Separate the serial date values into the appropriate
                    % variables
                    obj.ExpStartSerialDate = serialDateArray(1,1);
                    obj.StageStartSerialDates = serialDateArray(:,2);
                    
                    % Read the sample info from the last two columns of the
                    % spreadsheet
                    [~, ~, sampleInfoCellArray] = xlsread(dataFileName, 'T2:U4');
                    
                    obj.ReferenceSampleData.Material = sampleInfoCellArray{1,1};
                    obj.ReferenceSampleData.Mass = sampleInfoCellArray(2,1);
                    obj.ReferenceSampleData.SpecificHeat = sampleInfoCellArray{3,1};
                    
                    obj.TestSampleData.Material = sampleInfoCellArray(1,2);
                    obj.TestSampleData.Mass = sampleInfoCellArray(2,2);
                    obj.TestSampleData.SpecifcHeat = sampleInfoCellArray(3,2);
                    
                    dataLoadStatus = true;
            end
        end
        
        function dataSaveStatus = saveMATFile(obj,...
                fileName, filePath, varargin)
            %saveMATFile
            %   Save the current DSCData object as a .mat file
            
            if nargin > 1
                dataFileName = fileName;
                if nargin > 2
                    dataFilePath = filePath;
                else
                    dataFilePath = '';
                end
            else
                % Prompt the user to select a file
                [dataFileName, dataFilePath] = uiputfile(...
                    '*.mat', 'Save Data File', obj.DEFAULT_MAT_SAVE_PATH);
            end
            
            switch dataFileName
                case 0
                    % Cancel the save operation if the user closes the file
                    % selection window
                    dataSaveStatus = false;
                    return
                    
                otherwise
                    % Create fully-formed filename as a string
                    dataFullPath = fullfile(dataFilePath, dataFileName);
                    
                    % Copy the current DSCData object into a temporary
                    % variable
                    dscData = obj;
                    
                    % Save a .mat file
                    save(dataFullPath, 'dscData');
                    
                    dataSaveStatus = true;
            end
        end
        
        function dataSaveStatus = saveXlsxFile(obj,...
                fileName, filePath, varargin)
            %saveXlsxFile
            %   Save the measured data from a DSC experiment to a .xlsx
            %   file
            
            if nargin > 1
                dataFileName = fileName;
                if nargin > 2
                    dataFilePath = filePath;
                else
                    dataFilePath = '';
                end
            else
                % Prompt the user to select a file
                [dataFileName, dataFilePath] = uiputfile(...
                    '*.xlsx', 'Save Data File', obj.DEFAULT_XLSX_SAVE_PATH);
            end
            
            switch dataFileName
                case 0
                    % Cancel the save operation if the user closes the file
                    % selection window
                    dataSaveStatus = false;
                    return
                    
                otherwise
                    % Save a .mat file backup
                    obj.saveMATFile([dataFileName, '.mat'], dataFilePath);
                    
                    % Create fully-formed filename as a string
                    dataFullPath = fullfile(dataFilePath, dataFileName);
                    
                    % Create a row cell array of the column headers
                    columnHeaders = {'Timestamps (Serial Date)'...
                        'Elapsed Time (sec)',...
                        'Target Temperature (*C)',...
                        'Reference Sample Temperature (*C)',...
                        'Test Sample Temperature (*C)',...
                        'Reference Sample Temperature Error (delta C)',...
                        'Test Sample Temperature Error (delta C)',...
                        'Reference Sample Current (A)',...
                        'Test Sample Current (A)',...
                        'Reference Sample Heat Flow (W/g)',...
                        'Test Sample Heat Flow (W/g)',...
                        'Differential Heat Flow (W/g)',...
                        'Reference Sample PWM Duty Cycle (%)',...
                        'Test Sample PWM Duty Cycle (%)',...
                        '',...
                        'Experiment Start Serial Date',...
                        'Stage Start Serial Date',...
                        '',...
                        'Additional Sample Information:',...
                        'Reference Sample',...
                        'Test Sample'};
                    
                    % Convert the AllData matrix to a cell array
                    dataCellArray = num2cell(obj.AllData);
                    
                    % Create a cell array of empty char vectors that will
                    % be used to separate the sample information from the
                    % measured data
                    paddingColumn = {''};
                    
                    % Get the serial date from the start of the experiment
                    % and put it at the top row of a cell array
                    expStartSerialDataCellArray = num2cell(obj.ExpStartSerialDate);
                    
                    % Get the serial dates for the stage start times and
                    % put them in a cell array
                    stageStartSerialDataCellArray = num2cell(obj.StageStartSerialDates');
                    
                    % Create a column cell array of row headers for the
                    % additional sample information
                    sampleInfoRowHeaders = {'Sample Material';...
                        'Sample Mass (grams)';...
                        'Specific Heat Capacity (J/(g*K))'};
                    
                    % Get the sample info from the app and organize it into
                    % a cell array
                    sampleInfoCellArray =...
                        {obj.ReferenceSampleData.Material, obj.TestSampleData.Material;...
                        obj.ReferenceSampleData.Mass, obj.TestSampleData.Mass;...
                        obj.ReferenceSampleData.SpecificHeat, obj.TestSampleData.SpecificHeat};
                    
                    % Correct for differences in the number of rows in each
                    % cell array
                    if size(stageStartSerialDataCellArray, 1) < size(dataCellArray, 1)...
                            && size(sampleInfoRowHeaders, 1) < size(dataCellArray, 1)
                        MaxRowIndex = size(dataCellArray, 1);
                        
                        paddingColumn{MaxRowIndex, 1} = '';
                        expStartSerialDataCellArray{MaxRowIndex, 1} = [];
                        stageStartSerialDataCellArray{MaxRowIndex, 1} = [];
                        sampleInfoRowHeaders{MaxRowIndex, 1} = '';
                        sampleInfoCellArray{MaxRowIndex, 2} = [];
                        
                    elseif size(dataCellArray, 1) < size(stageStartSerialDataCellArray, 1)...
                            && size(sampleInfoRowHeaders, 1) < size(stageStartSerialDataCellArray, 1)
                        MaxRowIndex = size(stageStartSerialDataCellArray, 1);
                        
                        paddingColumn{MaxRowIndex, 1} = '';
                        dataCellArray{MaxRowIndex, 2} = [];
                        expStartSerialDataCellArray{MaxRowIndex, 1} = [];
                        sampleInfoRowHeaders{MaxRowIndex, 1} = '';
                        sampleInfoCellArray{MaxRowIndex, 2} = [];
                        
                    elseif size(dataCellArray, 1) < size(sampleInfoRowHeaders, 1)...
                            && size(stageStartSerialDataCellArray, 1) < size(sampleInfoRowHeaders, 1)
                        MaxRowIndex = size(sampleInfoRowHeaders, 1);
                        
                        paddingColumn{MaxRowIndex, 1} = '';
                        dataCellArray{MaxRowIndex, 2} = [];
                        expStartSerialDataCellArray{MaxRowIndex, 1} = [];
                        stageStartSerialDataCellArray{MaxRowIndex, 1} = [];
                        
                    end
                    
                    % Join the cell arrays to add the column headers to the
                    % respective data
                    outputCellArray = [columnHeaders;...
                        dataCellArray, paddingColumn,...
                        expStartSerialDataCellArray,...
                        stageStartSerialDataCellArray,...
                        paddingColumn,...
                        sampleInfoRowHeaders,...
                        sampleInfoCellArray];
                    
                    % Write the data to the desired .xlsx file
                    [dataSaveStatus, message] = xlswrite(dataFullPath, outputCellArray);
                    if (~isempty(message) && (length(message) > 0))
                        disp('xlswrite message output (DEBUG INFO)')
                        disp(message)
                    end
            end
        end
        
        function obj = calculateLatestHeatFlow(obj, heatingCoilVoltage)
            %calculateHeatFlow
            %   Calculate and store the heat flow values for the latest
            %   current readings using the sample mass values stored in the
            %   SampleData objects and the heatingCoilVoltage value given
            
            % Calculate the heat flow for the reference sample
            obj.LatestHeatFlow_Ref = obj.LatestCurrent_Ref .* heatingCoilVoltage...
                .* obj.LatestPWMDutyCycle_Ref / obj.ReferenceSampleData.Mass;
            
            % Calculate the heat flow for the test sample
            obj.LatestHeatFlow_Samp = obj.LatestCurrent_Samp .* heatingCoilVoltage...
                .* obj.LatestPWMDutyCycle_Samp / obj.TestSampleData.Mass;
            
            % Calculate the differential heat flow
            obj.LatestHeatFlow_Diff = obj.LatestHeatFlow_Samp - obj.LatestHeatFlow_Ref;
            
        end
        
        function obj = recalculateHeatFlow(obj, heatingCoilVoltage)
            %recalculateHeatFlow
            %   Recalculate the Heat Flow values using the sample mass
            %   values stored in the SampleData objects and the CurrentData
            
            % Calculate the new heat flow data for the reference sample
            obj.HeatFlowData_Ref = obj.CurrentData_Ref .* heatingCoilVoltage...
                .* obj.PWMDutyCycleData_Ref / obj.ReferenceSampleData.Mass;
            
            % Calculate the new heat flow data for the test sample
            obj.HeatFlowData_Samp = obj.CurrentData_Samp .* heatingCoilVoltage...
                .* obj.PWMDutyCycleData_Samp / obj.TestSampleData.Mass;
            
            % Calculate the new differential heat flow data
            obj.HeatFlowData_Diff = obj.HeatFlowData_Samp - obj.HeatFlowData_Ref;
            
        end
    end
end
