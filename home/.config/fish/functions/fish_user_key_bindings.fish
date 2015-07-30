function fish_user_key_bindings
    set fish_key_bindings fish_vi_key_bindings

    fish_vi_key_bindings
    bind \ch peco_select_history
end

