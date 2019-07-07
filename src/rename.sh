alias rename="'renameFile'"
function rename? {
    echo "Renames the file at the given path to the given name."
    echo "Parameters (filePath newName)"
    echo "$indentString filePath: The path of the file that you want to rename."
    echo "$indentString newName: The new name that you want the file to have"
    echo "NOTE: The newName paramter is just the new name you want the file to have."
    echo "This includes the extension but does NOT include the directory path."
}

function renameFile {
    fileString=$1
    newName=$2
    fileName=$(baseName $fileString)
    oLength=${#fileName}
    directoryString=$(trimString "$fileString" 0 $oLength)

    mv $fileString "$directoryString$newName"
}
