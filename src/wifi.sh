alias wifi="'showNetworkProfile'"
function wifi? {
    echo "Shows all known network profiles or the spefici profile if given a name"
    echo "Parameters (profile)"
    echo "$indentString profile: The name of a specific profile to show"
}

function showNetworkProfile {
    if [[ -n "$1" ]]; then
        netsh wlan show profile "$1" key=clear
    else
        netsh wlan show profiles
    fi
}
