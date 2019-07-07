alias gclean="cleanWorkspace"
function gclean? {
    echo "Performs a hard reset on the current repo."
}

function cleanWorkspace {
    echo $PWD
    git reset --hard
    git pull -r
    echo ""
}
