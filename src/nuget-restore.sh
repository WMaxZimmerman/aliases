alias nuget-restore="'msbuildShortcut'"
function nuget-restore? {
    echo "Shortcut for msbuild"
}

function restoreNugePackages {
    "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\NuGet\NuGet.Build.Tasks.Console.exe" $@
}
