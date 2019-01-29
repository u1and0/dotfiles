#!/usr/bin/zsh
echo -e "\U1F4AE Loading $0"  # ロード時に花柄表示
#
# zplug自体のアップデート
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# Install fuzzy-finder "fzf"
zplug "junegunn/fzf-bin",\
    as:command,\
    from:gh-r,\
    rename-to:"fzf",\
    hook-load:"""
        source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
        source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh
    """
    export FZF_DEFAULT_COMMAND='fd --hidden --type file --no-ignore --exclude "/.git/"'
    # export FZF_DEFAULT_OPTS='--ansi --height 40% --reverse --no-border --multi'
    export FZF_DEFAULT_OPTS='--ansi --multi'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

zplug "junegunn/fzf",\
    as:command,\
    use:bin/fzf-tmux,\
    on:"junegunn/fzf-bin"

# history search using ctrl+P/N
zplug "zsh-users/zsh-history-substring-search", defer:3
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi


# Install zsh-gomi
zplug "b4b4r07/zsh-gomi", \
    as:command, \
    use:bin/gomi, \
    on:junegunn/fzf-bin


# CLI finder like Mac
zplug "b4b4r07/cli-finder"


# 読み込み順序を設定する
# 例: "zsh-syntax-highlighting" は compinit の後に読み込まれる必要がある
# （2 以上は compinit 後に読み込まれるようになる）

# syntax highlighting in shell command
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Auto completions
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions",\
    defer:2,\
    hook-load:'compdef _pacman powerpill=pacman',\
    hook-load:'compdef _apt apt-fast=apt'


# Install twitter.sh
zplug "ShellShoccar-jpn/kotoriotoko"
export PATH=${ZPLUG_REPOS}/ShellShoccar-jpn/kotoriotoko/BIN:${PATH}
# , as:command, use:"BIN/*.sh"  # この方法で指定すると
# CONFIG読めなくなったりいろいろなツールのパスが異なってくる
# のでシンボリックリンクとして扱わないほうが良いと思う。

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh", hook-build:"touch ${HOME}/.z"

zplug "clvv/fasd", as:command, use:fasd

# history search using FuzzyFinder ( fzf-tmux peco-tmux fzy fzf peco ) using ctrl+R
# zplug "u1and0/ffsearch", defer:1
# To switch filter, set the HISTORY_FILTER argument
# for example `HISTORY_FILTER=fzy`

# fzf + cd, git, edit also...
zplug "u1and0/fzf-extras",\
    on:"junegunn/fzf",\
    use:"fzf*",\
    hook-load:"""
        alias zz='zd -z $*'
        alias gz='fzf-gitlog-widget'
        alias gx='fzf-gitlog-multi-widget'
    """

# The most awesome Powerline theme for ZSH around!
zplug 'bhilburn/powerlevel9k',\
    as:theme,\
    hook-load:"""
    export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        context vi_mode anaconda dir vcs newline)
    export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        status root_indicator background_jobs command_execution_time history time)
    """

# Dropbox
zplug "andreafabrizi/Dropbox-Uploader",\
    as:command,\
    use:"dropbox_uploader.sh",\
    rename-to:"db"

# Completions
zplug "esc/conda-zsh-completion", as:command, rename-to:"_conda"

zplug "jupyter/jupyter_core",\
    as:command,\
    use:examples/completions-zsh,\
    rename-to:"_jupyter"

# PDF to compressed file
zplug "u1and0/ac1d84259a090bfcaa29a0b0f900cf1a",\
    from:gist,\
    as:command,\
    use:"pdf*",\
    hook-load:"""
        alias pdffetch='pdffetch -layout -nopgbrk'
        alias pdftogz='pdftogz -layout -nopgbrk'
        alias pdftobz2='pdftobz2 -layout -nopgbrk'
        alias pdftoxz='pdftoxz -layout -nopgbrk'
        alias pdftozip='pdftozip -layout -nopgbrk'
    """

# Word counting in text
zplug "u1and0/aa64e61f0571521ede4e26b84cfbef6f",\
    from:gist,\
    as:command,\
    use:"*.sh"
# vim:ft=zsh
