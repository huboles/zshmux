#!/bin/zsh

if [[ -z $TMUX ]]; then
    if tmux list-sessions &> /dev/null ; then
        printf 'Current tmux sessions:\n'
        tmux list-sessions -F"#S - (#{?session_attached,Attached,Not Attached})"
    else
        printf '\nNo tmux sessions active\n'
    fi
    printf 'Attach session?: [name] (empty if none): '
    read response
    if [ -n "$response" ]; then
        if tmux list-sessions | grep -q "$response"; then
            tmux attach-session -t $response 
        else
            tmux new-session -s $response
        fi
    fi
fi
