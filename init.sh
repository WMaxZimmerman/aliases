. ~/aliases/bashAliases.sh
. ~/aliases/gitAliases.sh

alias aliases="'listAllAliasesWithDescriptions'"

function aliases?() {
    echo "Outputs a list of all aliases with a description about their function"
}

function listAllAliasesWithDescriptions() {
    tempFile="$TEMP/aliasTempFile.txt"
    alias > $tempFile

    searchString="alias "
    replaceString=""
    sed -i -e "s/$searchString/$replaceString/g" $tempFile
    searchString="='"
    replaceString=""
    sed -i "s/$searchString.*$/$replaceString/g" $tempFile

    while read line; do
        echo $line
        eval "$line?"
        echo ""
    done < $tempFile

    rm -rf $tempFile
}
