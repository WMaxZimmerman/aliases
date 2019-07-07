alias gopen="'openInGitHub'"
function gopen? {
    echo "Opens your preferred web browser and navigates to the github page for your current repo and branch."
}

function openInGitHub {
    status=$(git status)
    branch="master"

    count=0
    for i in $(echo $status | tr " " "\n")
    do
        let count=count+1
        if [ $count -eq 3 ]
        then
            branch=$i
        fi
    done

    url=$(gurl)

    if [[ $url != *"https"* ]];
    then
        url=${url/":"/"/"}
        url=$(trimString "$url" 4 4)
    else
        url=$(trimString "$url" 0 4)
    fi

    url="$url/tree/$branch"
    web $url
}
