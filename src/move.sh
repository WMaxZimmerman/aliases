alias move="'moveFileToDifferentDirectory'"
function move? {
    echo "Moves the file at the given path to a new directory."
    echo "Parameters (filePath newDir)"
    echo "$indentString filePath: The path of the file that you want to move."
    echo "$indentString newDir: The path of the directory you want to move the file to."
    echo "NOTE: This will not rename the file and will simply move the file to the new directory."
    echo "Both the file name and the extension will remain the same."
}

function moveFileToDifferentDirectory {
    fileString=$1
    newDir=$2
    fileName=$(baseName $fileString)

    mv $fileString "$newDir$fileName"
}
