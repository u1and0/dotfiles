#!/bin/bash

# Export Pathes
export TERM="xterm-256color"
# pipx path
[ -e "${HOME}/.local/bin" ] && export PATH="$PATH:${HOME}/.local/bin"
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# shell script path
export SHPATH="${HOME}/sh"
# Golang path
if type go > /dev/null 2>&1; then
    [ -e "$GOPATH/bin" ] && export PATH="$PATH:$GOPATH/bin"
   export PATH="$PATH:$SHPATH/bin:${HOME}/go/bin"
fi
# Deno path
if type deno > /dev/null 2>&1; then
    [ -e "${HOME}/.deno/bin" ] && export PATH="$PATH:${HOME}/.deno/bin"
fi
# LinuxBrew setting
if type brew > /dev/null 2>&1; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
    export MANPATH="/home/linuxbrew/.lilinuxbrew/nuxbrew/share/man:$MANPATH"
    export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
    export XDG_DATA_DIRS="/home/linuxbrew/.lilinuxbrew/nuxbrew/share:$XDG_DATA_DIRS"
fi
# fzf setting
# [ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
# [ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
if type fzf > /dev/null 2>&1; then
   [ -e fd ]  && export FZF_DEFAULT_COMMAND='fd --hidden --type file --no-ignore --exclude "/.git/"'
    export __FZF_PREVIEW_CMD='bat --color=always --plain {}'
    export FZF_DEFAULT_OPTS="--ansi --multi \
           --preview=\"${__FZF_PREVIEW_CMD}\" \
           --preview-window='right:hidden:wrap' \
           --bind=ctrl-v:toggle-preview \
           --header='<C-V> toggle preview'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_CTRL_R_OPTS="--height=40% --reverse"
fi

# env file
if [ -f ${HOME}/.env ]; then
    set -a # 以降の変数定義を自動エクスポート
    source ${HOME}/.env  # KEY=VALUE のenvファイル
    set +a
fi


# LESS設定
# -----------------------------
# __LESS ENVPATH__
# -g  検索したとき、ヒットした全ての文字列を反転するのではなく、現在カーソルがある行のみ反転する。
# -i  検索時に全部小文字で入力したときだけ、大文字小文字を無視する。
# -M  詳しいプロンプトを表示する。
# -R  ANSI カラーエスケープシーケンスを解するようになる。
# -S  一行が長く、ターミナルの幅が狭くて表示できない場合、途中までしか表示しない。
# -W  一度に2行以上移動した場合、新たに表示した最初の行をハイライトする。
# -z-4    ウィンドウのサイズをターミナルのサイズ - 4 に設定する。
# -x4 タブを 4 つのスペースで表現する。
# -L  $LESSOPEN 環境変数を無効にする。
# -N  行数
export LESS='-MigrWx4'
 # -z-4'

# man などの様々なコマンドがページャーとして less を使うようになります
export PAGER='less'
# $PAGER を設定した状態で以下の環境変数を指定すると man ページに色が付きます。
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.


# デフォルトのエディタ
type nvim >/dev/null 2>&1 && VISUAL='nvim'  # if nvim exist
export VISUAL=${VISUAL:='vim'}  # VISUAL editor could be a full screen editor
type vim >/dev/null 2>&1 && EDITOR='vim'  # if vim exist
export EDITOR=${VISUAL:='vi'}  # EDITOR editor should be able to work without use of "advanced" terminal functionality


# Load external files
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

[ -f ~/.bash_functions ] && . ~/.bash_functions

# facd: Frecency directory & file
type fasd > /dev/null 2>&1 && eval "$(fasd --init auto)"

# Activate conda env
[ -f /etc/profile.d/conda.sh ] && . /etc/profile.d/conda.sh && conda activate

# pip installed bin's path
[ -d ${HOME}/.local/bin ] && export PATH="${HOME}/.local/bin:${PATH}"

# cargo installed bin's path
[ -f ${HOME}/.cargo/env ] && source ${HOME}/.cargo/env

# choosenim bin's path
type choosenim > /dev/null 2>&1 && export PATH="${HOME}/.nimble/bin:${PATH}"
export PYTHONPATH=~/home/python

# deno auto setting
[ -f ${HOME}/.deno/env ] && source ${HOME}/.deno/env

# ddgr default browser
export BROWSER=w3m
# vim:ft=sh
