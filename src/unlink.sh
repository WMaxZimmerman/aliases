alias unlink="npm rm --global"
function unlink? {
    echo "Globally removes the given npm package."
    echo "Parameters (package)"
    echo "$indentString package: The name of the package to be removed."
}
