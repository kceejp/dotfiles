# http://d.hatena.ne.jp/pasela/20110216/git_not_pushed

function git_not_pushed()
{
    ZSH_THEME_GIT_PROMPT_PREFIX=" "
    if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
        head="$(git rev-parse --verify -q HEAD 2>/dev/null)"
        if [[ $? -eq 0 ]]; then
            remotes=($(git rev-parse --remotes))
            if [[ -n "${remotes[@]}" ]]; then
                for x in ${remotes[@]}
                do
                    if [[ "$head" = "$x" ]]; then
                        return 0
                    fi
                done
                ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}***NOT PUSHED***%{$reset_color%} "
            fi
        fi
    fi
    return 0
}
add-zsh-hook precmd git_not_pushed
