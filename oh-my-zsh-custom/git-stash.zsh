# http://qiita.com/ryoppy@github/items/c897b747a51383624964

function show_git_stash() {
  if [[ -e $PWD/.git/refs/stash ]]; then
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[yellow]%} (${$(git --no-pager stash list 2>/dev/null | wc -l | sed "s/ //g")} stashed *) %{$reset_color%}"
  else
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
  fi
}
add-zsh-hook precmd show_git_stash
