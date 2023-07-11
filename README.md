## zshmux 2.1

### about

when a new shell is launched **zshmux** checks if there are any **tmux** sessions.

if you are not already in a **tmux** session **zshmux** will list all currently active sessions,
then ask if you want to attach a currently running session, or make a new session in the shell.
if there is only one **tmux** session running and not attached to any clients, **zshmux**
will just automatically attach the session to the current shell.

### using

source **zshmux** in your *zshrc*:

    [[ -d PATH/TO/ZSHMUX ]] && source PATH/TO/ZSHMUX/zshmux.sh

open a new shell

### other shells

zshmux should work with any bash compliant shell, as it no longer implements any zsh specific functions.

### installation

download or clone this repo and move *zshmux.sh* to desired directory.
then source in your *.zshrc*
