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

function seconds = date2sec(serialdate)
%date2sec
%   Return the time represented by the give serial date, measured in
%   seconds

seconds = serialdate .* 24 .* 60 .* 60;

end

