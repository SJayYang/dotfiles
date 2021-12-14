export PATH=/opt/homebrew/bin:$PATH
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
eval "$(starship init zsh)"

[ -z "$PS1" ] && return
function cl {
    builtin cd "$@" && ls -F
    }

chpwd() {
  ls
}
#!/usr/bin/env bash
# NAVIGATION
alias ..="cl .."
alias ...="cl ../.."
alias home="cl ~"
alias videos="cl ~/Downloads/Videos"
alias downloads="cl ~/Downloads"
alias cao="cl ~/'Onedrive - rockefeller.edu'/'Cao Lab'"
alias n="nvim"
alias py="python3"

# Helpful commands
alias ssh='TERM=xterm-256color \ssh'
alias rockefeller="ssh syang02@login01-hpc.rockefeller.edu"
alias c="clear"
# Counts files in the directory and its subdirectories (ignores the actual
# subdirectory, but counts files within those subdirectories
alias count='find . -type f | wc -l'

# Provides memory data
alias memory="python ~/Github/utilities/memory.py"

# COMMON DIRECTORIES
alias dl="cl ~/Downloads"
alias gh="cl ~/Github"

# EASIER DOTFILE EDITING
alias aliases="n ~/.aliases && . ~/.aliases"
alias bashprofile="n ~/.bash_profile && . ~/.bash_profile"

# COLORS
alias ls="ls -GFh"

# APPLICATIONS
alias spotify="brew services restart spotifyd; spt"
alias gcal="gcalcli"
alias yt="youtube-dl --config-location ~/.config/youtube-dl/config"
alias todo="todoist"
alias stanfordtodo="todoist list --filter '##Stanford'"
# MEMORY

# CONFIRMATION
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"


# DOWNLOADING
# Continues a partial download
alias wget="wget -c"


# COMPRESSION
alias untar="tar -zxvf"
# arguments after gzipdir are --output, and --directory, in that order
alias gzipdir="tar -zcvf"
