alias mstest="'mstestShortcut'"
function mstest? {
    echo "Shortcut for mstest"
    echo "Parameters (projectName)"
    echo "$indentString projectName: The name of the project that want to test."
}

function mstestShortcut {
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe" $1/$1.csproj
    
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\MSTest.exe" /testcontainer:$1/bin/Debug/$1.dll
}
