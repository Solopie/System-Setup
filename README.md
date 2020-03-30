# System Setup

Script to setup my environment on a new Linux System.

## Automated Setups

- Configuration files
    - Vim
    - Tmux
    - (TODO) Bash aliases

## Implemented

- Prompt when file exists
    - Ask if file wants to be overwritten first
- Overwrite mode
    - Overwrite with no prompt

## Future implementations

- Instead of updating config file from inside code, have a file be copied from the repository to the file system.
    - Allows users to edit the configs to their own without going into the code which may be tedious.
- Implement bash aliases
- Copy to clipboard (Bash Alias)
    - Linux
        - Install xclip
        - alias copy="xclip -selection primary"
    - Windows (WSL/Git Bash)
        - alias copy="clip.exe"

- Installation Automation
    - VS Code
    - Python
    - Java

- Options of what we want to install/configure
    - Configuration Files
    - Development Programs
    - Git
        - Create GitRepos Folder in home
        - Setup SSH Keys for Staff/Student/Personal Account
            - Still have to manually add SSH Key to Github/Bitbucket

- Indicate level of permissions
    - May not have permission to install anything
