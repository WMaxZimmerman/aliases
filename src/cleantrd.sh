alias cleantrd="'cleanTrdJsonFile'"
function cleantrd? {
    echo "Cleans up a TRD JSON file to be formatted better."
    echo "Paramters (file)"
    echo "$indentString file: The file you want to format"
}

function cleanTrdJsonFile {
    filePath=$1
    tempPath="/tmp/trdCleanup.json"

    sed -i 's/“/"/g' $filePath
    sed -i 's/”/"/g' $filePath

    jq . $filePath > $tempPath
    less $tempPath > $filePath

    rm $tempPath
}
