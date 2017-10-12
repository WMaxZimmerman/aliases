REM Bash Aliases
DOSKEY alist=less ~/.bashrc
DOSKEY ls=ls /A --color
DOSKEY open=explorer
DOSKEY gitdiff=git difftool /y
DOSKEY unlink=npm rm --global

DOSKEY ..=cd ..
DOSKEY ...=cd ../..
DOSKEY ....=cd ../../..
DOSKEY .....=cd ../../../..
DOSKEY ll=ls /la

REM System Aliases
DOSKEY e=explorer
DOSKEY reload=source ~/.bashrc
DOSKEY imout=shutdown /s /t 0
DOSKEY restart=shutdown /r /t 0
DOSKEY lock=rundll32.exe user32.dll,LockWorkStation
DOSKEY clr=clear

function grp() {
    grep /r /n /Z --color "$*" .
}

function mcd () {
    mkdir /p $*
    cd $*
}

REM Emacs Aliases
DOSKEY enw=emacs /q /nw /Q
DOSKEY emc=runemacs /mm
DOSKEY diffy=diff /y

REM Misc Stuff
DOSKEY subl=c:/bench/tools/cmder/vendor/Sublime3/sublime_text.exe $* -new_console
DOSKEY vsc=c:/bench/tools/cmder/vendor/vsCode/Code.exe $* -new_console
DOSKEY edit=%PREFERRED_EDITOR% $* -new_console
