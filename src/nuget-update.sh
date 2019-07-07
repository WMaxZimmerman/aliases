alias nuget-update="'updateNugetPackage'"
function nuget-update? {
    echo "Builds and publishes a new version of a NuGet Packages."
    echo "Parameters (csproj apiKey)"
    echo "$indentString csproj: The path to the csproj file you want to publish"
    echo "$indentString apiKey: The api key for your NuGet account."
}

function updateNugetPackage(){
    csProj=$1
    apiKey=$2
    tempFile="$TEMP/updateNugetPackageTemp.txt"
    packageFile=""

    nuget pack $csProj > $tempFile

    searchString="\\\\"
    replaceString="\/"
    sed -i "s/$searchString/$replaceString/g" $tempFile
    searchString="Successfully created package '"
    replaceString=""
    sed -i "s/.*$searchString/$replaceString/g" $tempFile
    searchString="'"
    replaceString=""
    sed -i "s/$searchString.*$/$replaceString/g" $tempFile

    while read line; do
        if [[ "$line" = "C:/"* ]]; then
            packageFile=$(echo "$line")
        fi
    done < $tempFile

    #echo "$packageFile"
    nuget push "$packageFile" $apiKey -Source https://www.nuget.org/api/v2/package

    #echo $tempFile
    rm -rf $tempFile
}
