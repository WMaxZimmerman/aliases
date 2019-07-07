alias imout="'shutHerDown'"
function imout? {
    echo "Performs a forced system shutdown."
}

function shutHerDown {
    updateGtdRepo
    
    shutdown -s -f -t 0
}
