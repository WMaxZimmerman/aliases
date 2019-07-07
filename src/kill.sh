alias kill="'die'"
function kill? {
    echo "Kills all processes for the given application."
    echo "Parameters (application)"
    echo "$indentString application: The name of the application to be killed."
}

function die {
    iProgramName=${1,,}
    actualProgram=""

    case "$iProgramName" in
        "visualstudio")
            actualProgram="devenv.exe"
            ;;
        "intellij")
            actualProgram="idea64.exe"
            ;;
        *)
            actualProgram="$iProgramName.exe"
            ;;
    esac

    taskkill -im "$actualProgram" -f
}
