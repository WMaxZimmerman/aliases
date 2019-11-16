alias csx="'runDotnetScript'"
function csx? {
    echo "Runs a dotnet core script in the current directory"
    echo "Parameters (name *args)"
    echo "$indentString name: The name of the script file you want to run"
    echo "$indentString *args: Arguments to be passed to the script"
}

function runDotnetScript(){
    name=$1

    dotnet script $name.csx -- "${@:2}"
}
