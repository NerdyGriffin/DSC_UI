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

function cuiWaitbar(x,msg)
%cuiWaitbar
%   Create a waitbar in the command window
%   
%   Author: Christian Kunis (Nov 27, 2018)

if x > 1
    error('Error: Fractional wait bar length, x, cannot be greater than 1')
elseif x < 0
    error(['Error: Fractional wait bar length, x, must be a positive value,\n'...
        'less than or equal to 1'])
end

waitbarLength = 60;

disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
disp(' ')
fprintf('[')
i = 1;
while i < x.*waitbarLength
    fprintf('=')
    i = i + 1;
end
fprintf('>')
i = i + 1;
while i < waitbarLength
    fprintf(' ')
    i = i + 1;
end
fprintf('] %3.0f%%\n',x*100)
disp(msg)
end

