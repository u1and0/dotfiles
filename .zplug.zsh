#!/usr/bin/zsh
echo -e "\U1F4AE Loading $0"  # ロード時に花柄表示
#
# zplug自体のアップデート
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# history search using ctrl+P/N
zplug "zsh-users/zsh-history-substring-search", defer:3
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi


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

zplug "clvv/fasd", as:command, use:fasd, hook-load:"unalias zz"

# history search using FuzzyFinder ( fzf-tmux peco-tmux fzy fzf peco ) using ctrl+R
# zplug "u1and0/ffsearch", defer:1
# To switch filter, set the HISTORY_FILTER argument
# for example `HISTORY_FILTER=fzy`

# fzf + cd, git, edit also...
zplug "u1and0/fzf-extras",\
    use:"fzf*",\
    defer:2,\
    hook-load:"""
        alias gz='fzf-gitlog-widget'
        alias gx='fzf-gitlog-multi-widget'
        alias zz='zd -z'
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
# zplugのif:を使うと、ロードされないとき
# jupyter/jupyter_core: (bypassed check) のように
# 表示されるのでshell script的に普通にif-fiを使う

if [ type conda > /dev/null 2>&1 ]; then
    zplug "esc/conda-zsh-completion",\
        as:command,\
        rename-to:"_conda"
fi

if [ type jupyter > /dev/null 2>&1 ]; then
    zplug "jupyter/jupyter_core",\
        as:command,\
        use:examples/completions-zsh,\
        rename-to:"_jupyter"
fi

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

# data-science-at-the-command-line's tools
zplug "jeroenjanssens/dsutils",\
    as:command,\
    use:"*"

# Email file convert to text
zplug "u1and0/eml2txt",\
    as:command,\
    use:"eml2txt.py",\
    rename-to:"eml2txt"

# vim:ft=zsh
