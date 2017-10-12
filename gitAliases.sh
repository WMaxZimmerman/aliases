#Git Aliases
alias gas="git add -A && git status"
alias glg='git log --pretty=format:"%C(green)%h %C(bold green)%ad%C(yellow)%d %Creset%s%C(green) [%cn]" --decorate --date=short'
alias gl="git log --oneline --all --graph --decorate  $*"
alias gpr="git pull -r"
alias gst="git status"
alias gh="git log --pretty=format:'%Cgreen%h%Creset %ad | %s%Cred%d %Cblue[%an]%Creset ' --graph --date=short"
alias changedFiles="git diff --name-only"
alias mkbranch="'makeBranch'"
alias gopen="'openInGitHub'"
alias gcb="git branch | grep '*'"

function makeBranch() {
    git branch $1
    git checkout $1
}

function openInGitHub() {
    status=$(git status)
    #echo "status = $status"
    branch="master"

    count=0
    for i in $(echo $status | tr " " "\n")
    do
        let count=count+1
        if [ $count -eq 3 ]
        then
            branch=$i
        fi
    done

    #echo "branch = $branch"
    startingUrl=$(grep "url =" .git/config)
    nString=${startingUrl/":"/"/"}
    #echo "nString = $nString"
    oLength=${#nString}
    nLength=$[oLength-14]
    url=${nString:10:nLength}
    url="$url/tree/$branch"
    #echo "url = $url"
    chrome $url
}
