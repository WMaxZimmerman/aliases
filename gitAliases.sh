#Git Aliases
alias gas="git add -A && git status"
alias glg='git log --pretty=format:"%C(green)%h %C(bold green)%ad%C(yellow)%d %Creset%s%C(green) [%cn]" --decorate --date=short'
alias gl="git log --oneline --all --graph --decorate  $*"
alias gpr="git pull -r"
alias gst="git status"
alias gh="git log --pretty=format:'%Cgreen%h%Creset %ad | %s%Cred%d %Cblue[%an]%Creset ' --graph --date=short"
alias changedFiles="git diff --name-only"
alias mkbranch="'makeBranch'"

function makeBranch() {
    git branch $1
    git checkout $1
}
