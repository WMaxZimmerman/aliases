#Navigation Aliases
alias ..="'goBackOneDirectory'"
function goBackOneDirectory {
    description="Navigates back one directory."
    verifyParameters "$@" || return 1

    cd ..
}

alias ...="'goBackTwoDirectories'"
function goBackTwoDirectories {
    description="Navigates back two directories."
    verifyParameters "$@" || return 1

    cd ../..
}

alias ....="'goBackThreeDirectories'"
function goBackThreeDirectories {
    description="Navigates back three directories."
    verifyParameters "$@" || return 1

    cd ../../..
}

alias .....="'goBackFourDirectories'"
function goBackFourDirectories {
    echo "Navigates back four directories."
    verifyParameters "$@" || return 1
    
    cd ../../../..
}

#System Aliases
alias e="explorer"
function openExplorer {
    echo "Launches the file explorer to the given location."
    declare -a paramNames=("location:string:optional")
    verifyParameters "$@" || return 1

    explorer "$location"
}

alias reload="'resourceBashrc'"
function resourceBashrc {
    description="Reloads or resets all aliases. (useful if making or pulling changes to the alias files.)"
    verifyParameters "$@" || return 1
    source ~/.bashrc
}

alias imout="'forceShutdown'"
function forceShutdown {
    description="Performs a forced system shutdown."
    verifyParameters "$@" || return 1
    shutdown -s -f -t 0
}

alias imoutat="'forceShutdownAtTime'"
function forceShutdownAtTime {
    description="Schedule a task to force shutdown your system at the specified time."
    declare -a paramNames=(
	"h:number:required"
	"m:number:optional")
    verifyParameters "$@" || return 1

    local cHour=$(date +%-H)
    local cMinute=$(date +%-M)
    local cSecond=$(date +%-S)

    if [ $h -lt 7 ]
    then
        h=$((h+12))
    fi

    local dMinute=$((m-cMinute))
    local dHour=$((h-cHour))
    local dHour=$((dHour*60))
    local dMinute=$((dMinute+dHour))
    local dSecond=$((dMinute*60))
    local dSecond=$((dSecond-cSecond))

    shutdown -s -f -t $dSecond
}

alias imin="'abortShutdown'"
function abortShutdown {
    description="Aborts any shutdown that is scheduled."
    verifyParameters "$@" || return 1
    shutdown -a
}

alias restart="'restartMachine'"
function restartMachine {
    description="Performs a forced system restarts."
    verifyParameters "$@" || return 1
    shutdown -r -f -t 0
}

alias lock="'lockMachine'"
function lockMachine {
    description="Locks your computer."
    verifyParameters "$@" || return 1
    rundll32.exe user32.dll,LockWorkStation
}

alias mcd="'mkdirAndCd'"
function mkdirAndCd {
    description="Creates the given directory and then sets that as the current working directory."
    declare -a paramNames=("dir:string:required")
    verifyParameters "$@" || return 1
    
    mkdir -p $dir
    cd $dir
}

alias web="'openWebBrowser'"
function openWebBrowser {
    description="Launches your preferred web browser to the given location."
    declare -a paramNames=("url:string:option")
    verifyParameters "$@" || return 1
    
    /c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe "$url" &
}

alias trim="'trimString'"
function trimString {
    description="Outputs the given string with given amount of characters trimed off of the beginning and end."
    declare -a paramNames=(
	"s:string:required"
	"head:number:required"
	"tail:number:required"
    )
    verifyParameters "$@" || return 1

    local oLength=${#s}
    local cLength=$[head+tail]
    local nLength=$[oLength-cLength]
    echo ${s:head:nLength}
}

alias zip="'zipFolder'"
function zipFolder {
    description="Compresses the given folder to a zip file of the same name."
    declare -a paramNames=("dir:string:required")
    verifyParameters "$@" || return 1

    local fileName=$dir
    7z a "$dir.zip" "$dir"
}

alias unzip="'unzipFolder'"
function unzipFolder {
    description="Uncompress the given zip file to a directory of the same name."
    declare -a paramNames=("file:string:required")
    verifyParameters "$@" || return 1
    
    local fileName=$file
    7z e $fileName
}

alias ll="'verticalList'"
function verticalList {
    description="Outputs a vertical list of the contents of the current directory."
    verifyParameters "$@" || return 1

    ls -la
}

alias ls="'tableList'"
function tableList {
    description="Outputs a table list of the contents of the current directory."
    verifyParameters "$@" || return 1

    ls -A --color
}

alias unlink="'npmUnlink'"
function npmUnlink {
    description="Globally removes the given npm package."
    declare -a paramNames=("p:string:required")
    verifyParameters "$@" || return 1

    npm rm --global "$p"
}

alias diffy="'diffFiles'"
function diffFiles {
    description="Globally removes the given npm package."
    declare -a paramNames=(
	"f1:string:required"
	"f2:string:required"
    )
    verifyParameters "$@" || return 1

    diff -y "$f1" "$f2"
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

alias mineserver="'launchMinecraftServer'"
function mineserver?(){
    echo "Launches the minecraft server on my machine."
}

alias nunit="/C/Program\ Files\ \(x86\)/NUnit.org/nunit-console/nunit3-console.exe"
function nunit?(){
    echo "Runs NUnit tests for .Net projects."
}

#Functions
function visualStudio(){
    c:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio/2017/Community/Common7/IDE/devenv.exe $1 &
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



alias grp="'customGrep'"
function customGrep() {
    declare -a paramNames=("filter:string:required")
    verifyParameters "$@" || return 1
    grep -r -n -Z --color "$1" .
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

function launchMinecraftServer(){
    currDir=${pwd}
    echo $currDir
    cd /c/users/Max/Desktop/Minecraft/server
    java -Xmx1024M -Xms1024M -jar server.jar nogui
    cd "$currDir"
}
