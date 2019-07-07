alias grp="'customGrep'"
function grp? {
    echo "Performs a recursive grep in the current directory searching for the given string and outputing a colored result"
    echo "Parameters (searchString)"
    echo "$indentString searchString: The string to search for."
}

function customGrep {
    grep -r -n -Z --color "$1" .
}
