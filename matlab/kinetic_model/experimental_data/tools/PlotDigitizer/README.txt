README for:  Plot Digitizer
Written by:  Joseph A. Huwaldt <jhuwaldt@users.sourceforge.net>
Version:  2.5.0
Date:  June 5, 2010
Web site:  http://plotdigitizer.sourceforge.net


Plot Digitizer is a Java program used to digitize scanned plots of functional data. Often data is found presented in reports and references as functional X-Y type scatter or line plots. In order to use this data, it must somehow be digitized. This program will allow you to take a scanned image of a plot (in GIF, JPEG, or PNG format)  and quickly digitize values off the plot just by clicking the mouse on  each data point. The numbers can then be saved to a text file and used where ever you need them. Plot Digitizer works with both linear and logarithmic axis scales.Ê Besides digitizing points off of data plots, this  program can be used to digitize other types of scanned data (such as  scaled drawings or orthographic photos).

To make the digitizing task easier, this program includes many handy features.  For example:  You can recalibrate the Y axis without having to recalibrate the X axis (multiple sets of data are commonly plotted with the same X axis).  You can insert points between two already digitized points by right clicking and choosing "Insert" from the pop-up menu.  You can delete points by right-clicking on the points and choosing "Delete".  You can move points by clicking and dragging them.  You can compute the length of a digitized curve and you can compute the area of a digitized polygon. Finally, there is also unlimited undo/redo.

A special feature of this program is the ability to semi-automatically digitize lines off a plot.  The user simply indicates where the line is on the plot with a thick paint brush and the program attempts to automatically sort out the data from grid lines, etc.  This auto-digitizing feature depends on an image vectorization program called "autotrace".  In order to use the auto-digitizing feature, you must have autotrace installed.  More information on autotrace can be found here: http://sourceforge.net/projects/autotrace/

Will the auto-digitizing feature digitize any plot?Ê Short answer:Ê no. ÊLong answer:Ê The auto-digitizing feature  works best with black and white, 300 dpi images of continuous data which does not run vertically (vertical lines give it fits), does not repeatedly cross other data lines, is not close to and parallel to grid lines, is not extremely noisy and which does not have plot symbols.Ê After using the program a while you begin to learn what it can and can't auto-digitize.Ê However, even in cases where it doesn't auto-digitize the entire line, you can sometimes do a piece of it automatically, then manually digitize a piece, and then do another piece automatically,  etc. ÊI've found this feature to be pretty useful on digitizing plots of experimental test time histories, but your mileage may vary.

To use this program, first scan a plot with your favorite scanning system, then save the plot as a GIF, JPEG, or PNG format file. Run Plot Digitizer, open the scanned image file from the "Open" command in the "File" menu. Then follow the instructions at the bottom of the window to calibrate the plot and then digitize the points.

Most of the source code for Plot Digitizer is protected either by the General Public License (GPL) or by the Lesser General Public License (Lesser GPL).  Copies of both licenses are provided.


Installation Instructions:

MacOS X:
You should have received this application as a compressed disk image file (PlotDigitizer_#.#.#_MacOSX.dmg).Ê This disk image file, when mounted (by double-clicking on it), should contain the application icon (Plot Digitizer.app, this readme file (README.txt), and some license related legalese.

To install this program, simply drag the Plot Digitizer.app icon to a convenient location on your hard drive.Ê In MacOS X this is usually the "Applications" directory, but you are free to put it anywhere you want.

The application file should work properly on MacOS X 10.5 or later right out of the box.Ê No additional software required.

If you want to use the auto-digitize feature, you must acquire and install the autotrace program separately.  Also, the autotrace program must appear on the System search path.  I recommend you use either the fink (http://www.finkproject.org/) or MacPorts (http://www.macports.org/) package managers to install autotrace.  Plot Digitizer will find autotrace automatically if one of those package managers are used.  Otherwise, if you install autotrace from source or from a binary distribution, make sure the executable is found in /usr/local/bin or /usr/bin.


Windows:
You will first have to make sure that you have the J2SE 1.5 or later installed on your computer.  If you do not, you can get it from:  http://java.sun.com

You should have received this application as a ZIP archive file (PlotDigitizer_#.#.#_Windows.zip).Ê Uncompress this archive.  It contains an executable file named PlotDigitizer.exe.

To install this program, simply drag the PlotDigitizer.exe icon to a convenient location on your hard drive.  It should work from anywhere.

If you want to use the auto-digitize feature, you must acquire and install the autotrace program separately.  Also, the autotrace program must appear on the user's search path.  After installing or building autotrace, edit the search path.  To do this, from the "Start" menu choose "Settings" and then "Control Panel" and from the Control Panel window double-click on "System."  Then click on the "Advanced" tab and then the "Environment Variables" button.  Under "User variables" either select the PATH variable and click on the "Edit" button.  Enter the path to the directory containing the autotrace executable (path items are separated by semi-colon (";") characters).  Otherwise, click on the "New" button, enter "PATH" for the variable name and enter the path to the directory containing autotrace for the variable value.


Linux (and many flavors of UNIX):
You will first have to make sure that you have the J2SE 1.5 or later installed on your computer and on your search path.  If you do not, you can get it from:  http://java.sun.com

You should have received this application as a compressed archive file (PlotDigitizer_#.#.#_Linux.tgz).Ê After decompressing this file using "tar -xvzf PlotDigitizer_#.#.#_Linux.tgz", you will get a file named PlotDigitizer.jar.  This is a "double-clickable" jar file, or you can run it from the command line using:

java -Xmx128m -jar PlotDigitizer.jar

You may want to create a shell script to do this for you.

If you want to use the auto-digitize feature, you must acquire and install the autotrace program separately.  Also, the autotrace program must appear on the user's search path.


Revision History:
Version: 2.5.0    05-JUN-2010
* The autotrace program no longer ships with Plot Digitizer and must now be installed separately.  Most users didn't use it and it was a pain to maintain autotrace in the distribution for the few people who used it.  If Plot Digitizer can not find autotrace, the semi-auto button is disabled.
* Eliminated the use of the installer on Windows and Linux.  It was fragile and the primary source of problems for users.  The Windows platform now ships as a native Windows executable and the Linux version ships as a simple double-clickable JAR file (which will actually work on ALL platforms).
* Modified to use an ant based build system.
* Modified code-base to make use of features found in Java 1.5 and to generally clean it up.
* Picked up latest versions of underlying libraries.

Version: 2.4.1    15-OCT-2005
* Fixed a bug with computing polygon areas.

Version: 2.4.0    15-JAN-2005
* Added immediate mouse position feedback display.
* Added "shift+drag" method for rapidly digitizing many points.

Version: 2.3.1    01-OCT-2004
* Fixed a bug that caused Y-axes with logarithmic scales to not be digitized properly.

Version: 2.3.0    04-SEP-2004
* Fixed a bug that prevented the auto-digitizing feature from working in some non-US locales.
* Added the ability to compute the length of a digitized curve and the area of a digitized polygon.
* Added the ability to optionally use the x-axis calibration for the the y-axis as well.
* The output CSV file will now always output the numbers in scientific notation to retain the maximum number of significant digits.
* The tabular view of the digitized points will now use scientific notation if any of the numbers are small.

Version: 2.2.1    04-JUL-2004
* Fixed a bug that prevented the user from being able to select PNG files on certain platforms.
* Recompiled the Linux version of the autotrace program so that it would not require the imageMagick libraries to be present.
* Modified the About Box to use an external text file for it's content.

Version: 2.2.0    19-JUN-2004
* Added the ability to digitize data from plots with logarithmic axis scales (either on the ordinate, or the abscissa or both).
* Switched to a new version of the installer that will now work with Windows XP.
* Picked up a new version of the library that writes the CSV format data files output from Plot Digitizer.
* Removed the last Mac specific source file from this program (I had forgotten about it before).

Version: 2.1.0    20-MAY-2004
* Added user preferences for setting the color of lines, symbols, etc.  The preferences also introduce a new feature (turned off by default) to output the untransformed pixels of each of the selected points in addition to the transformed coordinates.
* Started using a new library that improves MacOS X integration.  As a side-effect, the application on any platform can now have multiple digitization sessions (windows) open at a time and there is a "Windows" menu that can be used to navigate between all open windows.

Version: 2.0.0    21-JAN-2004
Major rewrite of Plot Digitizer from top to bottom. ÊMajor new feature: Êsemi-automatic plot digitizing using "autotrace". ÊAlso added unlimited undo/redo functionality, the ability to insert points between two that have already been digitized, the ability to delete points (by right-clicking on the point), and the ability to move already digitized points by dragging them.

Version: 1.4.0    27-JUN-2003
Fixed minor display bugs. ÊAdded  the ability to recalibrate the Y axis while keeping the existing X axis calibration. ÊSaves a lot of time when you have multiple plots that share the same X axis.

Version: 1.3.1    10-NOV-2002
Fixed a bug that caused an incompatibility with Java 1.4 or later.

Version: 1.3.0    22-AUG-2002
There used to be a limit of 100 data points that could be digitized at a time. That limit has been removed. You can now digitize as many data points as your heart desires.
Made it possible to copy the contents of the table window (the table showing the numbers resulting from digitizing) to the clipboard in a tab-delimited format that works well for pasting into Excel or any other spreadsheet like program. Now you don't have to save the results to a file and then load them into Excel as a separate step.

27-JUN-2002
Fixed a major bug in the transformation of the coordinates  from screen coordinates to plot coordinates. The bug would show up when trying to digitize plots with significant rotation angles.
Dropped support for MacOS 8/9.

23-NOV-2001
Added support for MacOS X application bundles. Program now remembers location of last plot opened during a session.

14-JUN-2001
Fixed a bug with working on plots that are rotated.

7-JUN-2001
Fixed bug that made app MacOS specific. Added ability to edit numbers in table window.

3-JUN-2001
Original reslease of my Plot Digitizer application.


Legal Notice:
Plot Digitizer is a program for digitizing data from scanned plots.
Copyright (C) 2000-2005  Joseph A. Huwaldt

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.  Or visit the Free Software Foundation's web site:
    http://www.gnu.org/copyleft/gpl.html

The source code for this program is available for download here:
http://plotdigitizer.sourceforge.net/

Feel free to contact me if you have any problems or questions about this program.

Ad astra,

Joseph A. Huwaldt
jhuwaldt@users.sourceforge.net
