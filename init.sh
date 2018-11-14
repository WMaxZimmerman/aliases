#Alias Files
. ~/aliases/bashAliases.sh
. ~/aliases/gitAliases.sh
. ~/aliases/dotnetAliases.sh

indentString="  "
alias aliases="'listAllAliasesWithDescriptions'"
function aliases?() {
    echo "Outputs a list of all aliases with a description about their function"
}

alias aliasesSansDoc="'listAllAliasesWithoutDocumentation'"
function aliasesSansDoc?() {
    echo "Outputs a list of all aliases that do not have documentation."
}

function listAllAliasesWithDocumentation(){
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

function listAllAliasesWithoutDocumentation() {
    aliases | grep "command not found"
}
