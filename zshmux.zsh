#!/bin/zsh

if [[ -z $TMUX ]]; then
    if tlist &> /dev/null ; then
        printf 'Current tmux sessions:\n\n'
        tlist
    else
        printf '\nNo tmux sessions active\n'
    fi
    printf '\n\tAttach session?: [name] (empty if none): '
    read response
    if [ -n "$response" ]; then
        if tlist | grep -q "$response"; then
            tmux attach-session -t $response 
        else
            tmux new-session -s $response
        fi
    fi
fi
