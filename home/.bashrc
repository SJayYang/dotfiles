#!/usr/bin/env bash
# Changes directories and uses ls at the same time (don't need to do cd -> ls)

[ -z "$PS1" ] && return
function cl {
    builtin cd "$@" && ls -F
    }


export HOMESHICK_DIR=/usr/local/opt/homeshick
source /usr/local/opt/homeshick/homeshick.sh

