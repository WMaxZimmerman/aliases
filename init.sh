. ~/aliases/bashAliases.sh
. ~/aliases/deereAliases.sh
. ~/aliases/gitAliases.sh

function varlist(){
    less ~/aliases/bashAliases.sh
    less ~/aliases/gitAliases.sh
    less ~/aliases/deereAliases.sh
}

function testlist(){
    grep -r -Z --color "alias " ~/aliases
    grep -r -Z --color "function " ~/aliases
}
