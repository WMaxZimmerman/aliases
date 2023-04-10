alias cgpt="'askChatGpt'"
function cgpt? {
    echo "Asks Chat GPT a question and returns the reponse"
    echo "Parameters (prompt)"
    echo "$indentString prompt: The string to send to Chat GPT"
}

function askChatGpt {
    python /c/bench/tools/openai/chatgpt.py "$1"
}
