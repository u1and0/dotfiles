echo '--Loading ~/.bash_aliases--'

# Aliases for MSYS2 bash
# alias hogeを一時的に無効にするには\hoge

# 移動しやすく
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# lsを使いやすく
alias ls='ls --color=auto --show-control-chars --time-style=long-iso -FH'
alias ll='ls -lAhrt'
alias la='ls -A'

# 移動系コマンド
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'

# 設定の読み込み
alias relogin='exec $SHELL -l'
alias re=relogin

# 画面消去
alias c=clear
alias cls=reset

# Windowsっぽく
alias dir=ll
alias path='echo -e ${PATH//:/\\n}'

# ディスクサイズ
alias watch='watch -d -n1'
alias watchd='watch "du -hd1 $1"'
alias watchl='watch "ls -lthA $1"'

alias df='df -h'
alias du='du -h'
alias du1='du -d1'
function dut() {
    du -s $* | sort -h
}

# diff custom
alias diff='diff --color'

# grep custom
	# grep -r hogeで./以下のファイルの中身からhogeを検索
	# find | grep hogeで./以下のファイル名からhogeを検索
	# whereis hogeでコマンドの関連場所を検索(bin, src, man)
	# type -a hogeでコマンドを検索
	# -I: バイナリ無視
alias grep='grep --color=tty -i'

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
alias ping='wincmd /c/windows/system32/ping'

# ネットワーク確認用
alias ping1='ping www.google.com'
alias ping2='ping 192.168.0.1'

# mingw32用
# msysのmakeと被らないようにコマンド名が変えられている
# alias make='mingw32-make'
# alias m='make -j3'

# バックアップコマンド
alias shutup='sudo /mnt/g/backup/backup_command/tar_xz.sh ; shutdown -h 5'


# python
#alias ipy='ipython'
alias jpy='jupyter qtconsole --style=monokai'
alias jpyn='jupyter notebook'
#alias spy="Spyder"


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
alias gl='git log --oneline --all --graph --decorate'
alias gls='git ls-files'
alias gd='git diff --color-words'

# branch
alias gch='git checkout'
alias gb='git branch'
alias gm='git merge'
alias gst='git stash'
alias gt='git tag -n'
alias grst-h='git reset --hard HEAD'

# sns
alias tweet="~/sh/kotoriotoko/BIN/tweet.sh"
alias timeline="~/sh/get_tl.sh"
alias line="~/sh/line.sh"
