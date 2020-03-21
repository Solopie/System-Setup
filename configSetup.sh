#!/bin/sh

# Tmux Conf

cat <<EOT >> ~/.tmux.conf
set-window-option -g xterm-keys on
set-window-option -g mode-keys vi
EOT

# Vim Conf

cat <<EOT >> ~/.vimrc
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




