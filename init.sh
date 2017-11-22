#Alias Files
. ~/aliases/bashAliases.sh
. ~/aliases/gitAliases.sh

#Documentation Files
. ~/aliases/bashAliasesHelp.sh
. ~/aliases/gitAliasesHelp.sh

alias aliases="'listAllAliasesWithDocumentation'"

function aliases?(){
    echo "Outputs a list of all aliases with their corresponding documentation."
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
