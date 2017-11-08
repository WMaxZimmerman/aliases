function gas?() {
    echo "Stages all git changes and then outputs the git status."
}

function glg?() {
    echo "Outputs a formatted single line for each git log."
}

function gl?() {
    echo "Outputs a single line for each git log with a graph of the branching."
}

function gpr?() {
    echo "Performs a git pull rebase on the current repo."
}

function gst?() {
    echo "Outputs the git status of the current repo."
}

function gh?() {
    echo "Outputs a formatted single line for each git log with a graph of the branching."
}

function gopen?() {
    echo "Opens your preferred web browser and navigates to the github page for your current repo and branch."
}

function gcb?() {
    echo "Outputs the current branch of the repo."
}

function gitgone?() {
    echo "Removes the directory for the repo and then reclones it your machine."
}

function gurl?() {
    echo "Outputs the url for the git repo."
}

function gclean?() {
    echo "Performs a hard reset on the current repo."
}

function gchanges?() {
    echo "Outputs the number of files changed and the name of each changed file."
}

function geach?() {
    echo "Performs the given action on each git repo in the current directory."
    echo "Parameters (actionToBePerformed)"
    echo "$indentString actionToBePerformed: A bash command to be executed on each repo"
    echo "WARNING: This is a powerful command that will execute what ever you give it on each repo."
}

function gcam?() {
    echo "Preforms a git commit on the current repo."
    echo "Parameters (message)"
    echo "$indentString message: The commit message for the the commit"
}

function gdiff?() {
    echo "Launches the git diff tool."
}

function changedFiles?() {
    echo "Outputs a list of all of the changed files in the current repo."
}

function mkbranch?() {
    echo "Creates a new git branch with the given name and sets that as your current branch."
    echo "Parameters (branchName)"
    echo "$indentString branchName: The name of the branch that you want to create"
}
