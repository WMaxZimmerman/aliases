alias msbuild="'msbuildShortcut'"
function msbuild? {
    echo "Shortcut for msbuild"
}

function msbuildShortcut {
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" $@
}
