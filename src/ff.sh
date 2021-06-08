alias ff="'ldFlagSetter'"
function e? {
    echo "Launches the Corteva LaunchDarly flag setter"
}

function ldFlagSetter {
    pushd /c/vsts/tools
    ./LDFlagSetter_DevTest_Xray.bat
    popd
}
