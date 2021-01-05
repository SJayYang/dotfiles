#!/usr/bin/env bash
# Changes directories and uses ls at the same time (don't need to do cd -> ls)

[ -z "$PS1" ] && return
function cl {
    builtin cd "$@" && ls -F
    }


# homeshick config
export HOMESHICK_DIR=/usr/local/opt/homeshick
source /usr/local/opt/homeshick/homeshick.sh

# guile related config (not sure what this is)
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# alacritty config
source /Users/stanley/Github/alacritty/extra/completions/alacritty.bash

# starship config
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_CACHE=~/.config/starship/cache

# Prevent the alacritty app from jumping
printf "\e[?1042l"
