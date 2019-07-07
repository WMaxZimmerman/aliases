alias gitgone="'deleteRepoAndReclone'"
function gitgone? {
    echo "Removes the directory for the repo and then reclones it your machine."
}

function deleteRepoAndReclone {
    url=$(gurl)
    dir=$PWD
    cd ..
    rm -rf $dir
    git clone $url
    cd $dir
}
