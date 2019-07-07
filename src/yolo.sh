alias yolo="'commitAllChangesAndPushToMaster'"
function yolo? {
    echo "Commits all of the changes for the current repository and force pushes them to master."
    echo "WARNING: This should probably not be used on any repo more than just one person is in."
}

function commitAllChangesAndPushToMaster {
    git add -A
    git commit -am "YOLO"
    git push origin master --force
}
