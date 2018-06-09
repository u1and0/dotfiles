# vim:ft=zsh
# zplug自体のアップデート
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# Install fuzzy-finder "fzf"
zplug "junegunn/fzf-bin",\
    as:command,\
    from:gh-r,\
    rename-to:"fzf"
source $ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh
source $ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh
export FZF_DEFAULT_COMMAND='fd -t f -IE "/.git/"'
export FZF_DEFAULT_OPTS='--ansi --height 40% --reverse --no-border --multi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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
    hook-load:'compdef _pacman powerpill=pacman'  # Use _pacman as _powerpill


# Install twitter.sh
zplug "ShellShoccar-jpn/kotoriotoko"
export PATH=${ZPLUG_REPOS}/ShellShoccar-jpn/kotoriotoko/BIN:${PATH}

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh"

zplug "clvv/fasd", as:command, use:fasd

# history search using FuzzyFinder ( fzf-tmux peco-tmux fzy fzf peco ) using ctrl+R
# zplug "u1and0/ffsearch", defer:1
# To switch filter, set the HISTORY_FILTER argument
# for example `HISTORY_FILTER=fzy`

# fzf + cd, git, edit also...
zplug "u1and0/fzf-extras",\
    on:"junegunn/fzf",\
    use:"fzf*"
alias zz='zd -z $*'
alias gz='fzf-gitlog-widget'
alias gx='fzf-gitlog-multi-widget'

# The most awesome Powerline theme for ZSH around!
zplug 'bhilburn/powerlevel9k', as:theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context anaconda dir vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs command_execution_time history time)

# pacman backup
zplug "u1and0/8bd32ade8d95988b52b03a1b08297b96",\
    from:gist,\
    dir:"${HOME}/bacpac"\
    hook-build:"${HOME}/bacpac/bacpac restore"
alias bacpac="${HOME}/bacpac/bacpac"

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

# Python environment manager
source ${HOME}/.pyenvrc
zplug "pyenv/pyenv",\
    hook-build"pyenv install miniconda3-latest && \
    conda env create --file ${HOME}/snow-packages.yml"
