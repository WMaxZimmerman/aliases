alias winclean="'deleteWindowsTrXFiles'"
function winclean? {
    echo "deletes windows files that eat up all the damn space."
}

function deleteWindowsTrXFiles {
    rm -rf /c/Windows/System32/config/TxR
}
