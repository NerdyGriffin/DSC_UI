function updatepath()
%UPDATEPATH Add the DSC subdirectories to the search path
%   This function will iteratively check if the current directory is the
%   DSC folder. If so, the current directory and its subdirectories will be
%   added to the search path. Otherwise, the current directory is changed
%   to its parent directory and tries again
%
%   Author: Christian Kunis (Jan 27, 2019)

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

end

