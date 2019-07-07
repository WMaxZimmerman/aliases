alias diffy="diff -y"
function diffy? {
    echo "Opens the given two files in the diff tool for comparison."
    echo "Parameters (firstFile secondFile)"
    echo "$indentString firstFile: The name of the first file to be comparred."
    echo "$indentString secondFile: The name of the second file to be comparred."
}
