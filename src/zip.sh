alias zip="'zipFolder'"
function zip? {
    echo "Compresses the given folder to a zip file of the same name."
    echo "Parameters (directory)"
    echo "$indentString directory: The directory that you wish to compress."
}

function zipFolder {
    fileName=$1
    7z a "$1.zip" "$1"
}
