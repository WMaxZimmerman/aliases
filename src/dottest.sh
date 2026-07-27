alias dottest="'runDotnetTest'"
function dottest? {
    echo "Runs dotnet test pointed at the file matching your filter."
    echo "Parameters (filter)"
    echo "$indentString filter: The filter to match files against."
}

function runDotnetTest {
    dotnet test --filter FullyQualifiedName~"$1"
}
