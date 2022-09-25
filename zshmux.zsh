#!/bin/zsh

if [[ -z $TMUX ]]; then
        
    if tmux list-sessions &> /dev/null ; then

        if [[ $(tmux list-sessions -F"#{?session_attached,,x}" | grep "x" | wc -l) -eq 1 ]]; then
            tmux attach-session -t $(tmux list-sessions -F"#S")
        else
            printf '\033[32;1mCurrent \033[33;1mtmux \033[32;1msessions\033[0m:\n'
            tmux list-sessions -F"#S - (#{?session_attached,Attached,Not Attached})"
            printf '\033[34;1mAttach session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '

        fi

    else
        printf '\033[34;1mNo \033[33;1mtmux \033[34;1msessions active\n'
        printf '\033[34;1mCreate new session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '
    fi

    read session

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
fi
