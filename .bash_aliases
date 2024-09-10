#!/bin/bash

# alias hogeを一時的に無効にするには\hoge

# sudo command
if which sudo > /dev/null 2>&1; then
    alias sudo='sudo '  # 最後のスペースは補完を有効にするために必須

    # apt-fast / apt
    type apt > /dev/null 2>&1 && alias apt='sudo apt '
    type apt-fast > /dev/null 2>&1 && alias apt='sudo apt-fast '

    # powerpill / pacman
    type pacman > /dev/null 2>&1 && alias pacman='sudo pacman '
    type powerpill > /dev/null 2>&1 && alias pacman='sudo powerpill '

    # docker
    type docker > /dev/null 2>&1 && alias docker='sudo docker '
    type docker-compose > /dev/null 2>&1 && alias docker-compose='sudo docker-compose '

    # conda
    # type conda > /dev/null 2>&1 && alias conda='sudo conda '
    # conda activate ができなくなるのでやってはいけない

fi

# 移動しやすく
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# lsを使いやすく
if type eza > /dev/null 2>&1; then
    alias ls='eza --color=always --icons --git -HF '
    alias la='ls -A'
    alias ll='ls -lhAr -sold --time-style=long-iso '
else
    alias ls='ls --color=auto --show-control-chars -FH'
    alias la='ls -A  '
    alias ll='ls -lhArt --time-style=long-iso '
fi

# 移動系コマンド
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias rmdir='rmdir -p'

# 設定の読み込み
alias relogin='exec $SHELL -l'
alias re=relogin

# Windowsっぽく
alias dir=ll
alias path='echo -e ${PATH//:/\\n}'

# ディスクサイズ
alias df='df -h'
alias du='du -h'
alias du1='du -d1'
function du2() {
    du -s $* | sort -h
}
alias free='free -h'
alias tree='tree -C'

# watchカスタム
alias watch='watch -d -n1 '
alias watchd='watch "du -d1 $1"'
alias watchl='watch "ls -lthA $1"'

# diff custom
type colordiff > /dev/null 2>&1 &&
    alias diff='colordiff -u' ||
    alias diff='diff -u'

# grep custom
	# grep -r hogeで./以下のファイルの中身からhogeを検索
	# find | grep hogeで./以下のファイル名からhogeを検索
	# whereis hogeでコマンドの関連場所を検索(bin, src, man)
	# type -a hogeでコマンドを検索
	# -I: バイナリ無視
alias grep='grep --color=tty -i'

# history cumsom
alias h='history'

# Windowsコマンド文字化け対策
function wincmd()
{
    CMD=$1
    shift
    $CMD 2>&1 | iconv -f CP932 -t UTF-8
}
alias cmd='winpty cmd'
alias psh='winpty powershell'
alias ipconfig='wincmd ipconfig'
alias netstat='wincmd netstat'
alias netsh='wincmd netsh'
# pingのコマンド名混同を避けるため絶対パスで指定
# alias ping='wincmd /c/windows/system32/ping'

# ネットワーク確認用
alias ping1='ping www.google.com'
alias ping2='ping 192.168.0.1'

# git
alias g='git'
alias gf='git flow'

# add,commit,push
alias ga='git add'
alias gaa='git add .'
alias gan='git add -n .'
alias gaundo='git reset HEAD'
alias gac='git commit -am'
alias gc='git commit -m'
alias gcundo='git commit --amend'
alias gp='git push'
alias gpo='git push origin'

# status
alias gs='git status --short --branch'
alias gl='git log1'
alias gls='git ls-files'
alias gn='git log1 -n10'
alias gd='git diff'

# branch
alias gch='git checkout'
alias gb='git branch'
alias gm='git merge'
alias gst='git stash'
alias gt='git tag -n'
alias grst-h='git reset --hard HEAD'

# sns
alias timeline="$SHPATH/get_tl.sh"
alias line="$SHPATH/line.sh"

# bacpac
[ -d $HOME/bacpac ] && alias bacpac="${HOME}/bacpac/bacpac"

# pdftotext
type pdftotext > /dev/null 2>&1 &&
    alias pdftotext='pdftotext -layout -nopgbrk '

# vim - shell 通信用バッファ
# 読み込み
alias bf='cat > ${HOME}/.vim/bf'
# 書き込み
alias bfcat='cat ${HOME}/.vim/bf'
# 実行
alias bfexec='bfcat | ${SHELL}'
# vim:ft=sh
