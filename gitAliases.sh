#Git Aliases
alias gas="git add -A && git status"
function gas?() {
    echo "Stages all git changes and then outputs the git status."
}

alias glg='git log --pretty=format:"%C(green)%h %C(bold green)%ad%C(yellow)%d %Creset%s%C(green) [%cn]" --decorate --date=short'
function glg?() {
    echo "Outputs a formatted single line for each git log."
}

alias gl="git log --oneline --all --graph --decorate  $*"
function gl?() {
    echo "Outputs a single line for each git log with a graph of the branching."
}

alias gpr="git pull -r"
function gpr?() {
    echo "Performs a git pull rebase on the current repo."
}

alias gst="git status"
function gst?() {
    echo "Outputs the git status of the current repo."
}

alias gh="git log --pretty=format:'%Cgreen%h%Creset %ad | %s%Cred%d %Cblue[%an]%Creset ' --graph --date=short"
function gh?() {
    echo "Outputs a formatted single line for each git log with a graph of the branching."
}

alias gopen="'openInGitHub'"
function gopen?() {
    echo "Opens your preferred web browser and navigates to the github page for your current repo and branch."
}

alias gcb="git branch | grep '*'"
function gcb?() {
    echo "Outputs the current branch of the repo."
}

alias gitgone="'deleteRepoAndReclone'"
function gitgone?() {
    echo "Removes the directory for the repo and then reclones it your machine."
}

alias gurl="git config --get remote.origin.url"
function gurl?() {
    echo "Outputs the url for the git repo."
}

alias gclean="cleanWorkspace"
function gclean?() {
    echo "Performs a hard reset on the current repo."
}

alias gchanges="commitChangesInEachRepo"
function gchanges?() {
    echo "Outputs the number of files changed and the name of each changed file."
}

alias geach="performActionOnEachRepo"
function geach?() {
    echo "Performs the given action on each git repo in the current directory."
    echo "Parameters (actionToBePerformed)"
    echo "$indentString actionToBePerformed: A bash command to be executed on each repo"
    echo "WARNING: This is a powerful command that will execute what ever you give it on each repo."
}

alias gcam="git commit -am"
function gcam?() {
    echo "Preforms a git commit on the current repo."
    echo "Parameters (message)"
    echo "$indentString message: The commit message for the the commit"
}

alias gdiff="git difftool -y"
function gdiff?() {
    echo "Launches the git diff tool."
}

alias changedFiles="git diff --name-only"
function changedFiles?() {
    echo "Outputs a list of all of the changed files in the current repo."
}

alias mkbranch="'makeBranch'"
function mkbranch?() {
    echo "Creates a new git branch with the given name and sets that as your current branch."
    echo "Parameters (branchName)"
    echo "$indentString branchName: The name of the branch that you want to create"
}

alias yolo="'commitAllChangesAndPushToMaster'"
function yolo?() {
    echo "Commits all of the changes for the current repository and force pushes them to master."
    echo "WARNING: This should probably not be used on any repo more than just one person is in."
}

alias gprf="'updateForkFromSource'"
function gprf?() {
    echo "Updates a forked repository with the source repo."
}


#Not sure what these actually do.
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.rb rebase
git config --global alias.st status
#git config --global alias.logg "log --graph --decorate --author-date-order --date=relative --format=format:'%C(bold cyan)%h%C(reset) %C(white)%s%C(bold yellow)%d%C(reset)%n''        %C(cyan)%aD %C(bold green)(%ar)%C(reset)%C(green) - %an' --all"

function updateForkFromSource() {
    git fetch upstream
    git checkout master
    git merge upstream/master
}

function makeBranch() {
    git branch $1
    git checkout $1
    git branch --set-upstream-to=origin/master $1
}

function openInGitHub() {
    status=$(git status)
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

    url=$(gurl)

    if [[ $url != *"https"* ]];
    then
        url=${url/":"/"/"}
        url=$(trimString "$url" 4 4)
    else
        url=$(trimString "$url" 0 4)
    fi

    url="$url/tree/$branch"
    web $url
}

function deleteRepoAndReclone() {
    url=$(gurl)
    dir=$PWD
    cd ..
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
    if (( $fileCount > 0)); then
        echo $PWD
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
    tempUrl=$(gurl)
    if [[ $tempUrl == *"githubext"* ]];
    then
        echo $tempDir
        cd ..
        rm -rf $tempDir
    fi
}

function commitAllChangesAndPushToMaster(){
    git add -A
    git commit -am "YOLO"
    git push origin master --force
}
