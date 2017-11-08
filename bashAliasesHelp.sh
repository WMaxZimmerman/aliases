function ..?() {
    echo "Navigates back one directory."
}

function ...?() {
    echo "Navigates back two directories."
}

function ....?() {
    echo "Navigates back three directories."
}

function .....?() {
    echo "Navigates back four directories."
}

function e?() {
    echo "Launches the file explorer to the given location."
    echo "Parameters (location)"
    echo "$indentString location: The location to be open in the file explorer."
    echo "NOTE: The parameter is optional"
}

function reload?() {
    echo "Reloads or resets all aliases. (useful if making or pulling changes to the aliase files.)"
}

function imout?() {
    echo "Performs a forced system shutdown."
}

function imoutat?() {
    echo "Schedule a task to force shutdown your system at the specified time."
    echo "Parameters (hour minute)"
    echo "$indentString hour: The hour that you would like your system to shutdown."
    echo "$indentString minute: The minute that you would like your system to shutdown."
    echo "NOTE: The minute parameter is optional and will be considered 0 if omitted."
    echo "The time will be set as PM if the hour is less than 7 otherwise it will be AM."
}

function imin?() {
    echo "Aborts any shutdown that is scheduled."
}

function restart?() {
    echo "Performs a forced system restarts."
}

function lock?() {
    echo "Locks your computer."
}

function clr?() {
    echo "Clears all of the output in the terminal."
}

function grp?() {
    echo "Performs a recursive grep in the current directory searching for the given string and outputing a colored result"
    echo "Parameters (searchString)"
    echo "$indentString searchString: The string to search for."
}

function mcd?() {
    echo "Creates the given directory and then sets that as the current working directory."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you wish to create."
}

function web?() {
    echo "Launches your preferred web browser to the given location."
    echo "Parameters (url)"
    echo "$indentString url: The url that you want opened"
    echo "NOTE: The url parameter is optional and a new browser will be opened to your home page if omitted."
}

function trimString?() {
    echo "Outputs the given string with given amount of characters trimed off of the beginning and end."
    echo "Paramters (string headTrim tailTrim)"
    echo "$indentString string: The string that you whish to trim."
    echo "$indentString headTrim: The number of characters to trim off of the begging of the given string."
    echo "$indentString tailTrim: The number of characters to trim off of the end of the given string."
}

function zip?() {
    echo "Compresses the given folder to a zip file of the same name."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you wish to compress."
}

function unzip?() {
    echo "Uncompress the given zip file to a directory of the same name."
    echo "Parameters (zipFile)"
    echo "$indentString zipFile: The name of the zip file you want to uncompress."
}

function ll?() {
    echo "Outputs a vertical list of the contents of the current directory."
}

function ls?() {
    echo "Outputs a table list of the contents of the current directory."
}

function unlink?() {
    echo "Globally removes the given npm package."
    echo "Parameters (package)"
    echo "$indentString package: The name of the package to be removed."
}

function diffy?() {
    echo "Opens the given two files in the diff tool for comparison."
    echo "Parameters (firstFile secondFile)"
    echo "$indentString firstFile: The name of the first file to be comparred."
    echo "$indentString secondFile: The name of the second file to be comparred."
}

function kill?() {
    echo "Kills all processes for the given application."
    echo "Parameters (application)"
    echo "$indentString application: The name of the application to be killed."
}

function edit?() {
    echo "Opens the given file in a new instance of your preferred text editor."
    echo "Parameters (fileName)"
    echo "$indentString fileName: The name of the file to open."
    echo "NOTE: the fileName paramter is option and if omitted just a new instance of the editor will be opened."
}

function qedit?() {
    echo "Opens the given file in a new instance of your preferred text editor in your terminal."
    echo "Parameters (fileName)"
    echo "$indentString fileName: The name of the file to open."
    echo "NOTE: the fileName paramter is option and if omitted just a new instance of the editor will be opened."
}

function vs?() {
    echo "Launches a new instance of Visual Studio with the given file."
    echo "Parameters (fileName)"
    echo "$indentString fileName: The name of the file (typically a .sln) to be opened."
    echo "NOTE: the fileName parameter is optional and if omitted just a new instance of VS will be opened."
}

function ij?() {
    echo "Launches a new instance of IntelliJ with the given directory."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory to be opened in IntelliJ."
    echo "NOTE: the directory parameter is option and if omitted just a new instance of IJ will be opened."
}

function ide?() {
    echo "Dynamically launches a new instance of Visual Studio or IntelliJ for your current working directory."
}
