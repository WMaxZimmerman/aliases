alias gchanges="commitChangesInEachRepo"
function gchanges? {
    echo "Outputs the number of files changed and the name of each changed file."
}

function commitChangesInEachRepo {
    fileCount=$(changedFiles | wc -l)
    if (( $fileCount > 0)); then
        echo $PWD
        echo $fileCount
        changedFiles
        echo ""
    fi
}
