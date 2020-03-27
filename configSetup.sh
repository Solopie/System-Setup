#!/bin/bash

# Check if file exists and asks if we want to overwrite the file
PROMPT="y"

main() {
    # Auto mode or prompt if want to overwrite. Prompt will be default
    parseArgs $@

    # Tmux conf
    prompt ~/.tmux.conf
    [ "$?" == "0" ] && writeTmuxConf || echo "Tmux conf cancelled."

    # Vimrc
    prompt ~/.vimrc
    [ "$?" == "0" ] && writeVimrc || echo "Vimrc cancelled."
     
    echo "System setup complete."
}

parseArgs() {
    # Parse arguments
    for arg in "$@"
    do
        case $arg in
            -o|--overwrite)
            PROMPT="n"
            shift
            ;;
        esac
    done
}

prompt() { 
    overwrite="n"
    # If we don't want prompt then we leave immediately
    [ $PROMPT == "n" ] && return 1

    # Prompt will activate if a given file exists
    # 1 means file isn't overwritten and 0 means successful overwrite
    file=$1

    # If file is empty then return 1
    [ -z $file ] && return 1

    # Check if file exists, if file exists then we prompt
    [ -f $file ] && read -p "$file already exists. Overwrite? [y/n]: " overwrite
    
    while [ $overwrite != "y" ] && [ $overwrite != "n" ] 
    do
        read -p "Incorrect input. Please give \"y\" or \"n\": " overwrite
    done

    [ $overwrite == "y" ] && return 0 || return 1
}

# Tmux Conf
writeTmuxConf() {
    
    cat <<EOT > ~/.tmux.conf
# Written on $(date)
set-window-option -g xterm-keys on
set-window-option -g mode-keys vi
EOT
    echo "Tmux conf written"
}


# Vim Conf
writeVimrc() {
    cat <<EOT > ~/.vimrc
" Written on $(date)
" enable syntax highlighting
syntax enable

" show line numbers
set number
"
" set tabs to have 4 spaces
set ts=4
"
" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
EOT
    echo "Vimrc written"
}

main $@
