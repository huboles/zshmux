# zshmux

If a new shell is launched, *zshmux* quickly checks if there are any tmux sessions, or if the current shell is already in a tmux instance.
If you are not already in a tmux session *zshmux* will list all currently active sessions, and ask if you want to attach a currently running session, or make a new session in the shell.
If there is only one tmux session running and not attached to any clients, *zshmux* just automatically attach the session to the current shell.


## How to get *zshmux*

-If you use Arch Linux:
  - *zshmux* is available on the AUR
  - Once you've installed zshmux add `[[ -d /usr/lib/zshmux ]] && source /usr/lib/zshmux/zshmux.zsh` to your .zshrc

-Manual installation:
  - Clone this repository: `git clone https://github.com/huboles/zshmux`
  - Add: `[[ -d <path-to-zshmux>/zshmux ]] && source <path-to-zshmux>/zshmux/zshmux.zsh` to your .zshrc
  
-Open a new shell


![zshmux](https://user-images.githubusercontent.com/80217378/193707327-9d0b533e-d3e2-4c06-b2b7-4ea1ffcd5f07.gif)
