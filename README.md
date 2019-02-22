# DSC_UI
UI and real-time equipment control software for a Differential Scanning Calorimetry Prototype System, as part of my undergraduate physics research. 

DSC_UI: UI and control systems for DSC prototype system
Copyright (C) 2019  Christian Kunis

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.

You may contact the author at ckunis.contact@gmail.com

NOTE: This project is currently a work-in-progress. Not all features have been implemented and all code may be subject to change.

--------Graphic UI Instructions--------

To run the Graphical User Interface (GUI), run the file classes/DSC_GUI_APP.mlapp or type Run_DSC_GUI in the MATLAB command window.


--------Command-Line UI Instructions--------

WARNING: The CUI is not yet full implemented. It is recommended that you use the GUI for any and all testing or experiments.

To run the Command-Line User Interface (CUI), type Run_DSC_CUI in the MATLAB command window

To run an experiment with the CUI,
type "start daq box" to start the daq box sessions,
then type "start experiment" to start the experiment.

The program will allow you to save the data to an Excel file when the experiment is complete
