alias ntest="DEBUG_PRINT_LIMIT=999999999999999999999999 npm test --"
function ntest? {
    echo "Performs an npm test with a VERY large print limit"
    echo "Parameters (filter)"
    echo "$indentString filter: the filter for the test run"
}
