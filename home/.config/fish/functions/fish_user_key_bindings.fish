function fish_user_key_bindings
    # Show Vi mode prompt
    fish_vi_mode

    # I somehow need to do this...
    set -g fish_key_bindings

    # Turn Vi mode on
    fish_vi_key_bindings

    # Ctrl-h: peco
    bind -e -M insert \ch
    bind -M insert \ch peco_select_history

    # Ctrl-c: switch to the visual mode
    bind -e -M insert \cc
    bind -M insert -m default \cc force-repaint
end

