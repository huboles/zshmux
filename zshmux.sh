#!/bin/bash

# start tmux server if it's not already running
[[ ! $(pgrep tmux) ]] && tmux start

# exit if already in a tmux session
[[ -n $TMUX ]] && return

# check if any sessions exit
if [[ $(tmux list-sessions | wc -l) -ne 0 ]]; then
    if [[ $(tmux list-sessions -F"#{?session_attached,,x}" | grep "x" | wc -l) -eq 1 ]] && [[ -z $SSH_CLIENT ]]; then
        tmux attach-session -t $(tmux list-sessions -F"#{?session_attached,,#S}"  )
        return
    else
        printf '\033[32;1mcurrent \033[33;1mtmux \033[32;1msessions\033[0m:\n'
        tmux list-sessions -F"#S - (#{?session_attached,attached,not attached})"
        printf '\033[34;1mattach session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '
    fi
else
    printf '\033[34;1mno \033[33;1mtmux \033[34;1msessions active\n'
    printf '\033[34;1mcreate new session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '
fi

read session

# start requested session - since it uses grep you just have to put enough of a unique identifier to select
if [[ -n $session ]]; then
    if tmux list-sessions -F"#S" | grep -q "$session"; then
        tmux attach-session -t $session 
        return
    elif [[ $session == new ]]; then
        tmux new-session
        return
    else
        tmux new-session -s $session
        return
    fi
fi

return
