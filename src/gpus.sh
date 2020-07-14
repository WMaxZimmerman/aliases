alias gpus="gitPushUpstream"
function gpus? {
    echo "Performs a git push and sets the upstream to the current branch."
}

function gitPushUpstream() {
    branchName=$(git branch | grep \* | cut -c3-)
    git push --set-upstream origin $branchName
}
