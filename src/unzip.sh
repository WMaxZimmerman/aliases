alias unzip="'unzipFolder'"
function unzip? {
    echo "Uncompress the given zip file to a directory of the same name."
    echo "Parameters (zipFile)"
    echo "$indentString zipFile: The name of the zip file you want to uncompress."
}

function unzipFolder {
    fileName=$1
    7z e $fileName
}
