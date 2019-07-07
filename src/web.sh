alias web="'openWebBrowser'"
function web?() {
    echo "Launches your preferred web browser to the given location."
    echo "Parameters (url)"
    echo "$indentString url: The url that you want opened"
    echo "NOTE: The url parameter is optional and a new browser will be opened to your home page if omitted."
}

function openWebBrowser(){
    /c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe $1 &
}
