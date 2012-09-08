#------------------------------
# 基本設定
#------------------------------
[ -f ~/.zshrc.base ] && source ~/.zshrc.base

#------------------------------
# 色設定
#------------------------------
[ -f ~/.zshrc.color ] && source ~/.zshrc.color

#------------------------------
# プロンプト
#------------------------------
[ -f ~/.zshrc.prompt ] && source ~/.zshrc.prompt

#------------------------------
# エイリアス設定読み込み
#------------------------------
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias

#------------------------------
# screen関連設定読み込み
#------------------------------
[ -f ~/.zshrc.screen ] && source ~/.zshrc.screen

#------------------------------
# zshをvimモードで
#------------------------------
[ -f ~/.zshrc.vi ] && source ~/.zshrc.vi

#------------------------------
# 履歴設定
#------------------------------
[ -f ~/.zshrc.history ] && source ~/.zshrc.history

#------------------------------
# ローカル設定読み込み
#------------------------------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

#------------------------------
# 文字コード別の設定読み込み
#------------------------------
case $LANG in
    "ja_JP.UTF-8")
        #------------------------------
        # UTF-8用の設定読み込み
        #------------------------------
        [ -f ~/.zshrc.utf8 ] && source ~/.zshrc.utf8
    ;;
    *)
        #------------------------------
        # EUC-JP用の設定読み込み
        #------------------------------
        [ -f ~/.zshrc.eucjp ] && source ~/.zshrc.eucjp
    ;;
esac

#------------------------------
# source git-completion.bash
#------------------------------
[ -f ~/.zsh/git-completion.bash ] && source ~/.zsh/git-completion.bash

#------------------------------
# source auto-fu.zsh
#------------------------------
if [ -f ~/.zsh/plugin/auto-fu/auto-fu.zsh ]; then
    # precompiled source
    function () {
        local A
        A=~/.zsh/plugin/auto-fu/auto-fu.zsh
        [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] ||
            zsh -c "source $A; auto-fu-zcompile $A ${A:h}" >/dev/null 2>&1
    }
    source ~/.zsh/plugin/auto-fu/auto-fu; auto-fu-install

    # initialization and options
    function zle-line-init () { auto-fu-init }; zle -N zle-line-init

    # do not display "-azfu-"
    zstyle ':auto-fu:var' postdisplay ''

    zstyle ':completion:*' menu select
    zstyle ':completion:*' format '%F{green}[%d]%f'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' keep-prefix
    zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history
fi
