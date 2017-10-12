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
alias imout="shutdown -s -t 0"
alias restart="shutdown -r -t 0"
alias lock="rundll32.exe user32.dll,LockWorkStation"
alias clr="clear"

function grp() {
    grep -r -n -Z --color "$1" .
}

function mcd () {
    mkdir -p $1
    cd $1
}

#Emacs Aliases
alias enw="emacs -q -nw -Q"
alias emc="runemacs -mm"
alias diffy="diff -y"

#Misc Stuff
alias subl="/c/bench/tools/cmder/vendor/Sublime3/sublime_text.exe $1 -new_console"
alias vsc="/c/bench/tools/cmder/vendor/vsCode/Code.exe $1 -new_console"
alias edit="$PREFERRED_EDITOR $1 -new_console"
alias vs="'visualStudio'"

function visualStudio(){
    c:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 14.0/Common7/IDE/devenv.exe $1 &
}

git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.rb rebase
git config --global alias.st status
#git config --global alias.logg "log --graph --decorate --author-date-order --date=relative --format=format:'%C(bold cyan)%h%C(reset) %C(white)%s%C(bold yellow)%d%C(reset)%n''        %C(cyan)%aD %C(bold green)(%ar)%C(reset)%C(green) - %an' --all"
