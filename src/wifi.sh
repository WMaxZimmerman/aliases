alias wifi="'listAllWifiPasswordsKnown'"
function wifi? {
    echo "Outputs a list of all known wifi passwords"
}

function listAllWifiPasswordsKnown {
    tempFile="$TEMP/wifiList.txt"
    netsh wlan show profile | grep "Profile     :"  > $tempFile
    searchString="All User Profile     : "
    replaceString=""
    sed -i "s/$searchString/$replaceString/g" $tempFile

    while read l; do
        pwd=$(netsh wlan show profile "$l" key=clear | grep "Key Content" | sed "s/  Key Content            : //g")
        trimmedPwd=$(trimString "$pwd" 0 0)
        echo "$l : $trimmedPwd"
    done < $tempFile
}
