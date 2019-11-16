alias gitfolder="'downloadFolderFromGithub'"
function gitfolder? {
    echo "Outputs a list of all aliases with a description about their function"
    echo "Parameters (repo target destination)"
    echo "$indentString repo: The username/repository_name of the repo you want to download from"
    echo "$indentString target: The path of the folder in the github repo you would like to get"
    echo "$indentString destination: The name of the folder you want to download the folder to"
}

function downloadFolderFromGithub {
    repo="$1"
    targetFolder="$2"
    location="$3"
    currentDir="$(pwd)"
    dirName="$TEMP/gitfolder"
    mkdir $dirName > /dev/null 2>&1
    pushd $dirName > /dev/null 2>&1
    git init > /dev/null 2>&1
    git remote add origin -f https://github.com/$repo.git > /dev/null 2>&1
    git config core.sparseCheckout true > /dev/null 2>&1 # enable this

    touch .git/info/sparse-checkout > /dev/null 2>&1
    echo "$targetFolder" > .git/info/sparse-checkout

    git pull origin master > /dev/null 2>&1

    mv "$targetFolder" "$currentDir/$location" > /dev/null 2>&1
    popd > /dev/null 2>&1
    rm -rf $dirName > /dev/null 2>&1
}
