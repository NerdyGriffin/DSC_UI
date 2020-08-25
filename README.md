# DSC_UI

UI and real-time equipment control software for a Differential Scanning Calorimetry Prototype System, as part of my undergraduate physics research.

### DSC_UI: UI and control systems for DSC prototype system

Copyright (C) 2019 Christian Kunis

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.

You may contact the author at ckunis.contact@gmail.com

NOTE: This project is currently a work-in-progress. Not all features have been implemented and all code may be subject to change.

## New version available

This version of the software is now deprecated and the project has be remade for use with Arduino rather than the NI DAQ Box.
### The new version can be found here: https://github.com/NerdyGriffin/DSC_v2

## Setup Instructions

Plug in the DAQ Box to the computer via a USB cable.
Run the command `daqlist("ni")` in the Command Window to ensure the DAQ Box is
detected and the NI drivers/software are installed and running.

If the NI-DAQmx driver is not installed, then the output of this commands will
say `Unable to detect 'ni' hardware:`
In this case, read through the output message in the Command Window and follow 
the `Add-On Explorer` link provided in the last sentence of that message.
This should open the appropriate page of the Add-On Explorer window where you
can click `Install` to allow MATLAB to install the necessary drivers.

## Graphic UI Instructions

To run the Graphical User Interface (GUI), run the file Run_DSC_GUI.m or `cd` to
the project folder and type Run_DSC_GUI in the MATLAB command window.

## Command-Line UI Instructions

WARNING: The CLI is not yet full implemented. It is recommended that you use the GUI for any and all testing or experiments.

To run the Command-Line User Interface (CLI), type Run_DSC_CLI in the MATLAB command window

To run an experiment with the CLI,
type "start daq box" to start the daq box sessions,
then type "start experiment" to start the experiment.

The program will allow you to save the data to an Excel file when the experiment is complete
