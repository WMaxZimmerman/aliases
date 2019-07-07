alias trim="'trimString'"
function trim? {
    echo "Outputs the given string with given amount of characters trimed off of the beginning and end."
    echo "Paramters (string headTrim tailTrim)"
    echo "$indentString string: The string that you whish to trim."
    echo "$indentString headTrim: The number of characters to trim off of the begging of the given string."
    echo "$indentString tailTrim: The number of characters to trim off of the end of the given string."
}

function trimString {
    string=$1
    headTrim=$2
    tailTrim=$3

    oLength=${#string}
    cLength=$[headTrim+tailTrim]
    nLength=$[oLength-cLength]
    string=${string:headTrim:nLength}

    echo $string
}
