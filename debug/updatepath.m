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
            case 'DSC_UI'
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

