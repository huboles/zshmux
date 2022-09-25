#!/bin/zsh

if [[ -z $TMUX ]]; then
    if tmux list-sessions &> /dev/null ; then
        printf '\033[32;1mCurrent \033[33;1mtmux \033[32;1msessions\033[0m:\n'
        tmux list-sessions -F"#S - (#{?session_attached,Attached,Not Attached})"
    else
        printf '\n\033[34;1mNo \033[33;1mtmux \033[34;1msessions active\n'
    fi
    printf '\033[34;1mAttach session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '
    read response
    if [ -n "$response" ]; then
        if tmux list-sessions | grep -q "$response"; then
            tmux attach-session -t $response 
        else
            tmux new-session -s $response
        fi
    fi
fi
