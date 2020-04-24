#!/bin/bash

# Export Pathes
export LANG=ja_JP.UTF-8
export TERM="xterm-256color"
# shell script path
export SHPATH="${HOME}/sh"
export PATH="$PATH:$SHPATH/bin"
# LinuxBrew setting
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.lilinuxbrew/nuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export XDG_DATA_DIRS="/home/linuxbrew/.lilinuxbrew/nuxbrew/share:$XDG_DATA_DIRS"


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

# vim:ft=sh
