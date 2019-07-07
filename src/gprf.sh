alias gprf="'updateForkFromSource'"
function gprf? {
    echo "Updates a forked repository with the source repo."
}

function updateForkFromSource {
    git fetch upstream
    git checkout master
    git merge upstream/master
}
