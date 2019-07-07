alias glg='git log --pretty=format:"%C(green)%h %C(bold green)%ad%C(yellow)%d %Creset%s%C(green) [%cn]" --decorate --date=short'
function glg? {
    echo "Outputs a formatted single line for each git log."
}
