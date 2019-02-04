%Run_DSC_CUI.m
%   Start the DSC CUI
%   Author: Christian Kunis (Feb 3, 2019)

% Add the DSC subdirectories to the search path
for n = 3:-1:0
    if n > 0
        [~, currentDirectory] = fileparts(pwd);
        switch currentDirectory
            case 'DSC'
                addpath(genpath('.'))
                break
            otherwise
                cd ..
        end
    else
        error("The current working directory is not within the 'DSC' folder")
    end
end

% Run the CUI file
DSC_CUI_APP;