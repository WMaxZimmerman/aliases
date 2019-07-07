alias aliases="'listAllAliasesWithDocumentation'"
function aliases? {
    echo "Outputs a list of all aliases with a description about their function"
}

function listAllAliasesWithDocumentation {
    tempFile="$TEMP/aliasList.txt"
    alias >$tempFile
    searchString="alias "
    replaceString=""
    sed -i "s/$searchString/$replaceString/g" $tempFile
    searchString="="
    replaceString=""
    sed -i "s/$searchString.*$/$replaceString/g" $tempFile

    while read l; do
        echo "$l"
        eval "$l?"
        echo ""
    done < $tempFile
}
