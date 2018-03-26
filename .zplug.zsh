# vim:ft=zsh
# zplug自体のアップデート
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# Install fuzzy-finder "fzf"
zplug "junegunn/fzf-bin",\
    as:command,\
    from:gh-r,\
    rename-to:"fzf",\
    hook-load:"source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh",\
    hook-load:"source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh",\
    hook-load:'export MANPATH="$ZPLUG_REPOS/junegunn/fzf/man/man1/fzf:$MANPATH"'

# history search using FuzzyFinder ( fzf-tmux peco-tmux fzy fzf peco ) using ctrl+R
zplug "u1and0/ffsearch", defer:1
# To switch filter, set the HISTORY_FILTER argument
# for example `HISTORY_FILTER=fzy`

zplug "junegunn/fzf",\
    as:command,\
    use:bin/fzf-tmux,\
    on:"junegunn/fzf-bin"

# Install fuzzy-finder "fzy"
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
if [ `whoami` = vagrant ]; then
    ZPLUG_SUDO_PASSWORD=vagrant
fi
zplug "jhawthorn/fzy",\
    as:command,\
    rename-to:fzy,\
    hook-build:"make && sudo make install"

zplug "peco/peco",\
    as:command,\
    from:gh-r,\
    use:"*amd64*",\
    frozen:1  # Install fuzzy-finder peco

zplug "b4b4r07/dotfiles",\
    as:command,\
    use:bin/peco-tmux,\
    on:"peco/peco"  # fzf-tmux の peco バージョン


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
zplug "zsh-users/zsh-completions"


# Enhanced change directory
zplug "b4b4r07/enhancd", use:init.sh, defer:3

# Install twitter.sh
zplug "ShellShoccar-jpn/kotoriotoko",\
    hook-load:'export PATH=$ZPLUG_REPOS/ShellShoccar-jpn/kotoriotoko/BIN:$PATH',\
    lazy:true

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh"

# The most awesome Powerline theme for ZSH around!
zplug 'bhilburn/powerlevel9k', as:theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context anaconda dir vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time history time)

# pacman backup
zplug "u1and0/8bd32ade8d95988b52b03a1b08297b96",\
    from:gist,\
    dir:"${HOME}/bacpac"
alias bacpac="${HOME}/bacpac/bacpac"

# Gist editor
zplug "b4b4r07/gist",\
    as:command,\
    rename-to:"gist",\
    hook-build:'go get -d && go build'
