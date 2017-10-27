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
alias gitgone='deleteRepoAndReclone'
alias gitUrl="git config --get remote.origin.url"
alias gitClean="cleanWorkspace"
alias gitChanges="commitChangesInEachRepo"
alias gitEach="performActionOnEachRepo"

function makeBranch() {
    git branch $1
    git checkout $1
    git branch --set-upstream-to=origin/master $1
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
    url=$(gitUrl)

    if [[ $url != *"https"* ]];
    then
        url=${url/":"/"/"}
        url=$(trimString "$url" 4 4)
    else
        url=$(trimString "$url" 0 4)
    fi

    url="$url/tree/$branch"
    #echo "url = $url"
    chrome $url
}

function deleteRepoAndReclone() {
    url=$(gitUrl)
    #echo $url
    dir=$PWD
    #echo $dir
    cd ..
    #echo $PWD
    rm -rf $dir
    git clone $url
    cd $dir
}

function performActionOnEachRepo() {
    dir=$PWD
    for d in */ ; do
        repoDir="$dir/$d"
        if [ -d "$repoDir/.git" ]; then
            cd $repoDir
            eval $1
        fi
    done
    cd $dir
}

function commitChangesInEachRepo() {
    fileCount=$(changedFiles | wc -l)
    #echo $fileCount
    if (( $fileCount > 0)); then
        echo $PWD
        #echo $repoDir
        echo $fileCount
        changedFiles
        echo ""
    fi
}

function cleanWorkspace() {
    echo $PWD
    git reset --hard
    git pull -r
    echo ""
}

function deleteRepoIfExternal() {
    tempDir=$PWD
    tempUrl=$(gitUrl)
    if [[ $tempUrl == *"githubext"* ]];
    then
        echo $tempDir
        cd ..
        rm -rf $tempDir
    fi
}
