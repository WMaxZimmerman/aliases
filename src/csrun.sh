alias csrun="'runDotnetFrameworkProject'"
function csrun? {
    echo "Builds and runs the given dotnet project."
    echo "Parameters (projectName)"
    echo "$indentString projectName: The name of the project that you want to run."
    echo "NOTE: You should be in the solution root when running this command."
}

function runDotnetFrameworkProject {
    project=$1
    msbuild.exe "$project/$project.csproj" -t:rebuild

    echo ""
    echo "=== Starting Application ==="
    echo ""
    
    $project/bin/debug/$project.exe
}
