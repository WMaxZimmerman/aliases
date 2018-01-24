#Navigation Aliases
alias ..="cd .."
function ..?() {
    echo "Navigates back one directory."
}

alias ...="cd ../.."
function ...?() {
    echo "Navigates back two directories."
}

alias ....="cd ../../.."
function ....?() {
    echo "Navigates back three directories."
}

alias .....="cd ../../../.."
function .....?() {
    echo "Navigates back four directories."
}

#System Aliases
alias e="explorer"
function e?() {
    echo "Launches the file explorer to the given location."
    echo "Parameters (location)"
    echo "$indentString location: The location to be open in the file explorer."
    echo "NOTE: The parameter is optional"
}

alias reload="source ~/.bashrc"
function reload?() {
    echo "Reloads or resets all aliases. (useful if making or pulling changes to the aliase files.)"
}

alias imout="shutdown -s -f -t 0"
function imout?() {
    echo "Performs a forced system shutdown."
}

alias imoutat="'imoutat'"
function imoutat?() {
    echo "Schedule a task to force shutdown your system at the specified time."
    echo "Parameters (hour minute)"
    echo "$indentString hour: The hour that you would like your system to shutdown."
    echo "$indentString minute: The minute that you would like your system to shutdown."
    echo "NOTE: The minute parameter is optional and will be considered 0 if omitted."
    echo "The time will be set as PM if the hour is less than 7 otherwise it will be AM."
}

alias imoutin="'imoutin'"
function imoutin?() {
    echo "Schedule a task to force shutdown your system in the specified amount of time."
    echo "Parameters (hour minute)"
    echo "$indentString hour: The hour that you would like your system to shutdown."
    echo "$indentString minute: The minute that you would like your system to shutdown."
    echo "NOTE: The minute parameter is optional and will be considered 0 if omitted."
}

alias imin="shutdown -a"
function imin?() {
    echo "Aborts any shutdown that is scheduled."
}

alias restart="shutdown -r -f -t 0"
function restart?() {
    echo "Performs a forced system restarts."
}

alias lock="rundll32.exe user32.dll,LockWorkStation"
function lock?() {
    echo "Locks your computer."
}

alias clr="clear"
function clr?() {
    echo "Clears all of the output in the terminal."
}

alias grp="'customGrep'"
function grp?() {
    echo "Performs a recursive grep in the current directory searching for the given string and outputing a colored result"
    echo "Parameters (searchString)"
    echo "$indentString searchString: The string to search for."
}

alias mcd="'mkdirAndCd'"
function mcd?() {
    echo "Creates the given directory and then sets that as the current working directory."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you wish to create."
}

alias web="'web'"
function web?() {
    echo "Launches your preferred web browser to the given location."
    echo "Parameters (url)"
    echo "$indentString url: The url that you want opened"
    echo "NOTE: The url parameter is optional and a new browser will be opened to your home page if omitted."
}

alias trimString="'trimString'"
function trimString?() {
    echo "Outputs the given string with given amount of characters trimed off of the beginning and end."
    echo "Paramters (string headTrim tailTrim)"
    echo "$indentString string: The string that you whish to trim."
    echo "$indentString headTrim: The number of characters to trim off of the begging of the given string."
    echo "$indentString tailTrim: The number of characters to trim off of the end of the given string."
}

alias zip="'zipFolder'"
function zip?() {
    echo "Compresses the given folder to a zip file of the same name."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you wish to compress."
}

alias unzip="'unzipFolder'"
function unzip?() {
    echo "Uncompress the given zip file to a directory of the same name."
    echo "Parameters (zipFile)"
    echo "$indentString zipFile: The name of the zip file you want to uncompress."
}

alias ll="ls -la"
function ll?() {
    echo "Outputs a vertical list of the contents of the current directory."
}

alias ls="ls -A --color"
function ls?() {
    echo "Outputs a table list of the contents of the current directory."
}

alias unlink="npm rm --global"
function unlink?() {
    echo "Globally removes the given npm package."
    echo "Parameters (package)"
    echo "$indentString package: The name of the package to be removed."
}

alias diffy="diff -y"
function diffy?() {
    echo "Opens the given two files in the diff tool for comparison."
    echo "Parameters (firstFile secondFile)"
    echo "$indentString firstFile: The name of the first file to be comparred."
    echo "$indentString secondFile: The name of the second file to be comparred."
}

alias kill="'die'"
function kill?() {
    echo "Kills all processes for the given application."
    echo "Parameters (application)"
    echo "$indentString application: The name of the application to be killed."
}

alias addToPath="'updatePath'"
function addToPath?() {
    echo "Add the given directory to the path environemnt variable."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you want to add to your path variable."
}

alias createEnvVar="'createEnvVariable'"
function createEnvVar?() {
    echo "Creates the given variable and sets it to the given value."
    echo "Parameters (varName varValue)"
    echo "$indentString varName: The name of the environment variable you want to create."
    echo "$indentString varValue: The value that you want the environment variable to have."
}

alias rename="'renameFile'"
function rename?() {
    echo "Renames the file at the given path to the given name."
    echo "Parameters (filePath newName)"
    echo "$indentString filePath: The path of the file that you want to rename."
    echo "$indentString newName: The new name that you want the file to have"
    echo "NOTE: The newName paramter is just the new name you want the file to have."
    echo "This includes the extension but does NOT include the directory path."
}

alias move="'moveFileToDifferentDirectory'"
function move?() {
    echo "Moves the file at the given path to a new directory."
    echo "Parameters (filePath newDir)"
    echo "$indentString filePath: The path of the file that you want to move."
    echo "$indentString newDir: The path of the directory you want to move the file to."
    echo "NOTE: This will not rename the file and will simply move the file to the new directory."
    echo "Both the file name and the extension will remain the same."
}

#Editing
alias edit="'editText'"
function edit?() {
    echo "Opens the given file in a new instance of your preferred text editor."
    echo "Parameters (fileName)"
    echo "$indentString fileName: The name of the file to open."
    echo "NOTE: the fileName paramter is option and if omitted just a new instance of the editor will be opened."
}

alias qedit="'quickEditText'"
function qedit?() {
    echo "Opens the given file in a new instance of your preferred text editor in your terminal."
    echo "Parameters (fileName)"
    echo "$indentString fileName: The name of the file to open."
    echo "NOTE: the fileName paramter is option and if omitted just a new instance of the editor will be opened."
}

alias vs="'visualStudio'"
function vs?() {
    echo "Launches a new instance of Visual Studio with the given file."
    echo "Parameters (fileName)"
    echo "$indentString fileName: The name of the file (typically a .sln) to be opened."
    echo "NOTE: the fileName parameter is optional and if omitted just a new instance of VS will be opened."
}

alias ij="'intelliJ'"
function ij?() {
    echo "Launches a new instance of IntelliJ with the given directory."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory to be opened in IntelliJ."
    echo "NOTE: the directory parameter is option and if omitted just a new instance of IJ will be opened."
}

alias ide="'ide'"
function ide?() {
    echo "Dynamically launches a new instance of Visual Studio or IntelliJ for your current working directory."
}

alias enw="emacs -q -nw -Q"
function enw?() {
    echo "Launches a quick configuration of Emacs in your terminal."
}

alias emc="'launchEmacs'"
function emc?() {
    echo "Launches a stand alone Emacs application with all personal configurations."
}

alias nugetUpdate="'udpateNugetPackage'"
function nugetUpdate?(){
    echo "Builds and publishes a new version of a NuGet Packages."
    echo "Parameters (csproj apiKey)"
    echo "$indentString csproj: The path to the csproj file you want to publish"
    echo "$indentString apiKey: The api key for your NuGet account."
}

#Functions
function visualStudio(){
    c:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe $1 &
}

function intelliJ(){
    c:/Program\ Files/JetBrains/IntelliJ\ IDEA\ 2017.1.4/bin/idea64.exe $1 &
}

function ide(){
    solution=$(find . -type f -name '*.sln')

    if [[ $solution != "" ]];
    then
        visualStudio $solution
    else
        intelliJ .
    fi
}

function customGrep() {
    grep -r -n -Z --color "$1" .
}

function mkdirAndCd() {
    mkdir -p $1
    cd $1
}

function trimString(){
    string=$1
    headTrim=$2
    tailTrim=$3

    oLength=${#string}
    cLength=$[headTrim+tailTrim]
    nLength=$[oLength-cLength]
    string=${string:headTrim:nLength}

    echo $string
}

function imoutat(){
    cHour=$(date +%-H)
    cMinute=$(date +%-M)
    cSecond=$(date +%-S)
    iHour=$1
    iMinute=$2

    if [ $iHour -lt 7 ]
    then
        iHour=$((iHour+12))
    fi

    dMinute=$((iMinute-cMinute))
    dHour=$((iHour-cHour))
    dHour=$((dHour*60))
    dMinute=$((dMinute+dHour))
    dSecond=$((dMinute*60))
    dSecond=$((dSecond-cSecond))

    shutdown -s -f -t $dSecond
}

function zipFolder(){
    fileName=$1
    7z a "$1.zip" "$1"
}

function unzipFolder(){
    fileName=$1
    7z e $fileName
}

function web(){
    /c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe $1 &
}

function updatePath(){
    newDir="$1"
    currPath="$testtest"
    newPath="$currPath;$newDir"

    echo "$newPath"
    set testtest "$newPath"
    setx testtest "$newPath" -m
}

function die(){
    iProgramName=${1,,}
    actualProgram=""

    case "$iProgramName" in
        "visualstudio")
            actualProgram="devenv.exe"
            ;;
        "intellij")
            actualProgram="idea64.exe"
            ;;
        *)
            actualProgram="$iProgramName.exe"
            ;;
    esac

    taskkill -im "$actualProgram" -f
}

function udpateNugetPackage(){
    csProj=$1
    apiKey=$2
    tempFile="$TEMP/updateNugetPackageTemp.txt"
    packageFile=""

    nuget pack $csProj > $tempFile

    searchString="\\\\"
    replaceString="\/"
    sed -i "s/$searchString/$replaceString/g" $tempFile
    searchString="Successfully created package '"
    replaceString=""
    sed -i "s/.*$searchString/$replaceString/g" $tempFile
    searchString="'"
    replaceString=""
    sed -i "s/$searchString.*$/$replaceString/g" $tempFile

    while read line; do
        if [[ "$line" = "C:/"* ]]; then
            packageFile=$(echo "$line")
        fi
    done < $tempFile

    #echo "$packageFile"
    nuget push "$packageFile" $apiKey -Source https://www.nuget.org/api/v2/package

    #echo $tempFile
    rm -rf $tempFile
}

function launchEmacs(){
    os=$OSTYPE
    if [[ "$os" = "msys" ]];
    then
        runemacs -mm
    else
        emacs -mm &
    fi
}

function moveFileToDifferentDirectory(){
    fileString=$1
    newDir=$2
    fileName=$(baseName $fileString)

    mv $fileString "$newDir$fileName"
}

function renameFile(){
    fileString=$1
    newName=$2
    fileName=$(baseName $fileString)
    oLength=${#fileName}
    directoryString=$(trimString "$fileString" 0 $oLength)

    mv $fileString "$directoryString$newName"
}
