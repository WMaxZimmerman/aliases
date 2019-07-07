alias gh="git log --pretty=format:'%Cgreen%h%Creset %ad | %s%Cred%d %Cblue[%an]%Creset ' --graph --date=short"
function gh? {
    echo "Outputs a formatted single line for each git log with a graph of the branching."
}
