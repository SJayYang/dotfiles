#!/usr/bin/env bash
# Changes directories and uses ls at the same time (don't need to do cd -> ls)

[ -z "$PS1" ] && return
function cl {
    builtin cd "$@" && ls -F
    }


export HOMESHICK_DIR=/usr/local/opt/homeshick
source /usr/local/opt/homeshick/homeshick.sh

export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
source /Users/stanley/Github/alacritty/extra/completions/alacritty.bash
