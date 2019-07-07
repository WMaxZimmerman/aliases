alias gb="'makeBranch'"
function mkbranch? {
    echo "Creates a new git branch with the given name and sets that as your current branch."
    echo "Parameters (branchName)"
    echo "$indentString branchName: The name of the branch that you want to create"
}

function makeBranch {
    git branch $1
    git checkout $1
    git branch --set-upstream-to=origin/master $1
}
