alias emc="'launchEmacs'"
function emc? {
    echo "Launches a stand alone Emacs application with all personal configurations."
}

function launchEmacs {
    os=$OSTYPE
    if [[ "$os" = "msys" ]];
    then
        runemacs -mm
    else
        emacs -mm &
    fi
}
