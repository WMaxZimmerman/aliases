#File System
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll="ls -la"
alias ls="ls -A --color"
alias e="explorer"
alias mcd="'mkdirAndCd'"

#Usability
alias reload="source ~/.bashrc"
alias clr="clear"

#System
alias imout="shutdown -s -f -t 0"
alias imoutat="'imoutat'"
alias imin="shutdown -a"
alias restart="shutdown -r -f -t 0"
alias lock="rundll32.exe user32.dll,LockWorkStation"

#Utility
alias grp="'customGrep'"
alias trimString="'trimString'"
alias zip="'zipFolder'"
alias unzip="'unzipFolder'"
alias diffy="diff -y"

#Applications Stuff
alias subl="/c/bench/tools/cmder/vendor/Sublime3/sublime_text.exe $1 -new_console"
alias vsc="/c/bench/tools/cmder/vendor/vsCode/Code.exe $1 -new_console"
alias edit="$PREFERRED_EDITOR $1 -new_console"
alias vs="'visualStudio'"
alias ij="'intelliJ'"
alias chrome="'web'"
alias kill="'die'"
alias enw="emacs -q -nw -Q"
alias emc="'launchEmacs'"

#Functions
function visualStudio(){
    c:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe $1 &
}

function intelliJ(){
    c:/Program\ Files/JetBrains/IntelliJ\ IDEA\ 2017.1.4/bin/idea64.exe $1 &
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

function dieDiscordDie(){
    tempFile="$TEMP/diediscorddie.txt"
    tasklist -fo CSV -fi "Imagename eq Discord.exe" -nh > $tempFile

    searchString="\",\"Console"
    replaceString=""
    sed -i "s/$searchString.*$/$replaceString/g" $tempFile

    while read l; do
        temp=$(trimString $l 15 0)
        taskkill -pid $temp -f
    done < $tempFile
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
