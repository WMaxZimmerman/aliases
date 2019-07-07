alias gl="git log --oneline --all --graph --decorate  $*"
function gl? {
    echo "Outputs a single line for each git log with a graph of the branching."
}
