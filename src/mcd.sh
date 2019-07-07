alias mcd="'mkdirAndCd'"
function mcd? {
    echo "Creates the given directory and then sets that as the current working directory."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you wish to create."
}

function mkdirAndCd() {
    mkdir -p $1
    cd $1
}
