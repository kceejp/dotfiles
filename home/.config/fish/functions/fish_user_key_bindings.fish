function fish_user_key_bindings
    # Show Vi mode prompt
    fish_vi_mode

    # I somehow need to do this...
    set -g fish_key_bindings

    # Turn Vi mode on
    fish_vi_key_bindings

    # Ctrl-c: switch to the visual mode
    bind -e -M insert \cc
    bind -M insert -m default \cc force-repaint

    # Ctrl-c: clear line nad back to insert mode
    bind -e \cc
    bind -m insert \cc kill-whole-line force-repaint

    # Ctrol-l: to clear screen
    bind -e -M insert \cl
    bind -M insert \cl clear

    # Need this for some reasons...
    bind -e -M insert -k backspace
    bind -M insert -k backspace backward-delete-char

    # Ctrl-h: peco
    bind -e -M insert \ch
    bind -M insert \ch "peco_select_history (commandline)"
end

