alias nuget-config="echoNugetConfigLocation"
function nuget-config? {
    echo "Outputs the location of the NuGet config file"
}

function echoNugetConfigLocation {
    echo "~/AppData/Roaming/NuGet/NuGet.config"
}
