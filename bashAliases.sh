#Bash Aliases
alias alist="less ~/.bashrc"
alias ls="ls -A --color"
alias open="explorer"
alias gitdiff="git difftool -y"
alias unlink="npm rm --global"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ll="ls -la"

#System Aliases
alias e="explorer"
alias reload="source ~/.bashrc"
alias imout="shutdown -s -f -t 0"
alias imoutat="'imoutat'"
alias imin="shutdown -a"
alias restart="shutdown -r -f -t 0"
alias lock="rundll32.exe user32.dll,LockWorkStation"
alias clr="clear"
alias grp="'customGrep'"
alias mcd="'mkdirAndCd'"
alias chrome="/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
alias trimString="'trimString'"
alias zip="'zipFolder'"
alias unzip="'unzipFolder'"

#Emacs Aliases
alias enw="emacs -q -nw -Q"
alias emc="runemacs -mm"
alias diffy="diff -y"

#Misc Stuff
alias subl="/c/bench/tools/cmder/vendor/Sublime3/sublime_text.exe $1 -new_console"
alias vsc="/c/bench/tools/cmder/vendor/vsCode/Code.exe $1 -new_console"
alias edit="$PREFERRED_EDITOR $1 -new_console"
alias vs="'visualStudio'"

git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.rb rebase
git config --global alias.st status
#git config --global alias.logg "log --graph --decorate --author-date-order --date=relative --format=format:'%C(bold cyan)%h%C(reset) %C(white)%s%C(bold yellow)%d%C(reset)%n''        %C(cyan)%aD %C(bold green)(%ar)%C(reset)%C(green) - %an' --all"

#Functions
function visualStudio(){
    c:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe $1 &
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
    cHour=$(date +%H)
    cMinute=$(date +%M)
    cSecond=$(date +%S)
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
