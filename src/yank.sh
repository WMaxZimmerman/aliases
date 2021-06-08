alias yank="powershell.exe -command "Get-Clipboard" | cat"
function yank? {
    echo "Outputs contents of the clipboard."
}
