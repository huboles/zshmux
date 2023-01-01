# zshmux

If a new shell is launched, zshmux quickly checks if there are any tmux sessions, or if the current shell is already in a tmux instance. If you are not already in a tmux session zshmux will list all currently active sessions, and ask if you want to attach a currently running session, or make a new session in the shell. If there is only one tmux session running and not attached to any clients, zshmux will just automatically attach the session to the current shell.

## How to get zshmux

If you use Arch Linux, zshmux is available on the AUR

Manual installation:
  - Download and extract this archive
        $ curl "https://download.huck.website/zshmux-[VERSION].tar.gz"
        $ tar -xzvf zshmux-[VERSION].tar.gz
  - Install:
        $ cd zshmux-[VERSION]
        # mkdir /usr/lib/zshmux
        # cp zshmux.zsh /usr/lib/zshmux

Once you've gotten zshmux, add this snippet to your zshrc:
        [[ -d /usr/lib/zshmux ]] && source /usr/lib/zshmux/zshmux.zsh
  
-Open a new shell

