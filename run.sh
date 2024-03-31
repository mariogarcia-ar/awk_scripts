#!/bin/bash
ROOT_DIR="$(pwd)"

source "$ROOT_DIR/config.sh"
source "$ROOT_DIR/lib.sh"

# -----------------------------------------------------------------------------
for i in $(seq -f "%02g" 1 20)
    do
        script="$ROOT_DIR/steps/$i.sh"
        if [ -f $script ]; then
            # echo $script;
            source "$script"
        fi
    done

