#!/bin/bash

# Functions for MSYS2 bash

# pacman for mingw32
function pinst()
{
    pacman -S "mingw-w64-i686-$1"
}
function puninst()
{
    pacman -Rs "mingw-w64-i686-$1"
}

# ANSI test
ansi_test()
{
for x in {0..8}; do
    for i in {30..37}; do
        for a in {40..47}; do
            echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
        done
        echo
    done
done
echo ""
}

# others
function snow()
{
    clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'
}

function matrix()
{
    echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|gawk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4; letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}'
}

function install_something()
{
#define library name
libraries=("ujthsk" "wtpkty" "dancmu" "ckbbbw" "dgkujy" "rahtzz")
# 1 - 100
progressBarSize=20

while :
do
    library=${libraries[$(($RANDOM % ${#libraries[*]}))]}
    echo "Collecting ${library}"

    fileSize=$((($RANDOM % 1000) + $progressBarSize))
    percentSize=$(($fileSize / $progressBarSize))

    fileName="${library}-"$(($RANDOM % 10))"."$(($RANDOM % 10))"."$(($RANDOM % 10))".tar.gz"
    echo "    Downloading ${fileName} (${fileSize}kB)"

    nowSize=0
    # loop downloading
    while [ $nowSize -lt $fileSize ]
    do
        progressSize=$(($RANDOM % 100))
        nowSize=$(($nowSize + $progressSize))
        sizeQuotient=$(($nowSize / $percentSize))

        # protect over 100 percent
        if [ $nowSize -gt $fileSize ] ; then
            nowSize=$fileSize
            sizeQuotient=$progressBarSize
        fi

        # make progress bar
        progressBar=""
        for i in `seq 1 $sizeQuotient`
        do
            progressBar=$progressBar"#"
        done
        for i in `seq 1 $(($progressBarSize - $sizeQuotient))`
        do
            progressBar=$progressBar" "
        done

        #progress bar
        echo -en $(($sizeQuotient * (100 / $progressBarSize)))"%|${progressBar}| ${nowSize}kB ${progressSize}kB/s \r"

        sleep 1s
    done

    echo
    echo "Installing..."
    for i in `seq 1 1 20`
    do
        echo -en '|\r' ; sleep 0.05;
        echo -en '/\r' ; sleep 0.05;
        echo -en '-\r' ; sleep 0.05;
    done
    echo "Successfully installed: ${fileName}"

    if [ $(($RANDOM % 10)) -lt 1 ] ; then
        echo "Building wheels for collected packages..."
        sleep 3s
    fi
    echo
    sleep 1s
done
}

#pecoでsublime-projectを開く(project managerを使用)
function sublime-projects() {
  subl $(find ~/SublimeText3/Packages/User/Projects -name "*sublime-project" 2> /dev/null | peco)
}
alias subp='sublime-projects'

# pythonで計算
function python_print(){
	OLDIFS=$IFS
	IFS=, # Set derimiter as comma
	python -c "from numpy import *; from scipy.constants import *; import pandas as pd; print($*)"
	IFS=$OLDIFS  # Reset default
}
alias pp='python_print'

# rangerネスト防止
function ranger(){
    [ -n "$RANGER_LEVEL" ] && exit || LESS="$LESS -+F -+X" command ranger "$@"
}

# ranger+Sで開いたshellではPS1に(RANGER)と表示
[ -n "$RANGER_LEVEL" ] && PS1="(RANGER) $PS1"

# vagrant保存シーケンス関数関数化
# * vagrantで仮想マシンを一時停止して
# * サンドボックスをコミット・停止して
# * スナップショットとってサンドボックス再開して
# * スナップショットのリスト表示
function vagrant-snapbox(){
	vagrant suspend
	vagrant sandbox commit
	vagrant sandbox off
	vagrant snapshot save $1
	vagrant sandbox on
	vagrant snapshot list
}


# google search using w3m
function google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'`
        opt='search?num=50&hl=ja&lr=lang_ja'
        opt="${opt}&q=${str}"
    fi
    w3m http://www.google.co.jp/$opt
}


# wikipedia search using w3m
function wikipedia() {
    w3m https://ja.wikipedia.org/wiki/$1
}


# w3m search from history
function whistory() {
    w3m `tac ${HOME}/.w3m/history | fzf`
}

# Check FX rate
function cconv() {
  from=${1:-USD}
  to=${2:-JPY}
  amount=${3:-1}
  curl -s "https://finance.google.com/finance/converter?a=$amount&from=$from&to=$to" | sed '/res/!d;s/<[^>]*>//g'
}

# Calcuration use awk
calc() {
    awk "BEGIN {print $*}"
}

# Math calcuration use perl or awk
if type perl > /dev/null 2>&1; then
    calc(){
        echo $* | perl -nle 's/x/*/g;print eval($_)'
    }
else
    calc(){
        awk "BEGIN {print $*}"
    }
fi

weblio() {
    w3m "https://ejje.weblio.jp/content/$1"
}

weblio-vim() {
    ${VISUAL} +"Ref webdict $1" +on
}

diffdoc() {
    BIN=catdoc
    if ! type $BIN > /dev/null 2>&1; then
        echo $BIN not exist
        return 1
    fi
    diff <($BIN $1) <($BIN $2)
}

diffdocx() {
    BIN=docx2txt
    if ! type $BIN > /dev/null 2>&1; then
        echo $BIN not exist
        return 1
    fi
    diff <($BIN $1 -) <($BIN $2 -)
}

function docker-tags() {
  curl -s https://registry.hub.docker.com/v2/repositories/$1/tags | jq -r '.results.[].name'
}

function gonew() {
  mkdir "$1"; cd "$1"
  ${EDITOR} main.go -c ":w | !go mod init $(basename $(pwd)) && go mod tidy"
}

function nimnew() {
  echo 'echo "Hello world."' > "$1" && ${EDITOR} "$1"
}

# X server control
function xdisplay() {
    xset dpms force $1
}

function xmute() {
    amixer sset Master $1
}


# URL encoding from multibyte character
function urlencoding() {
    echo "$*" | nkf -WwMQ | sed -e 's/=$//g' | tr = % | tr -d '\n'
}

# URL decoding from URL to plain text
function urldecoding() {
    python -c "import urllib.parse; print(urllib.parse.unquote('$*'))"
}

# ポモドーロタイマー設定（デフォルト値）
_POMO_WORK_TIME=25m
_POMO_BREAK_TIME=5m
_POMO_LONG_BREAK_TIME=15m
_POMO_ALERT_TIME=30
_POMO_SLEEP_TIME=2
_POMO_CYCLES=4

# notify-sendが使えるか確認する関数
_notify() {
    if command -v notify-send &> /dev/null; then
        notify-send -u Warning "$1" "$2"
    else
        echo "$1: $2"
    fi
}

# 汎用的なポモドーロタイマー関数
_pomo_timer() {
    local notify_message="$1"
    local duration="$2"
    if command -v lolcat &> /dev/null; then  # カラー出力
        termdown -b -c $_POMO_ALERT_TIME -t "$notify_message" $duration | lolcat
    else
        termdown -b -c $_POMO_ALERT_TIME -t "$notify_message" $duration
    fi
    _notify "Pomodoro" "$notify_message"
}

pomodoro_cycle() {
    # オプション引数の処理
    while [[ $# -gt 0 ]]; do
        case $1 in
            --work|-w)
                _POMO_WORK_TIME="$2"
                shift 2
                ;;
            --short|-s)
                _POMO_BREAK_TIME="$2"
                shift 2
                ;;
            --long|-l)
                _POMO_LONG_BREAK_TIME="$2"
                shift 2
                ;;
            --cycles|-c)
                _POMO_CYCLES="$2"
                shift 2
                ;;
            --alert|-a)
                _POMO_ALERT_TIME="$2"
                shift 2
                ;;
            --sleep|-z)
                _POMO_SLEEP_TIME="$2"
                shift 2
                ;;
            --help|-h)
                echo "使用方法: pomodoro_cycle [オプション]"
                echo "オプション:"
                echo "  -w, --work TIME    作業時間を設定 (デフォルト: 25m)"
                echo "  -s, --short TIME   短い休憩時間を設定 (デフォルト: 5m)"
                echo "  -l, --long TIME    長い休憩時間を設定 (デフォルト: 15m)"
                echo "  -c, --cycles NUM   サイクル数を設定 (デフォルト: 4)"
                echo "  -a, --alert NUM    アラート時間を設定 (デフォルト: 30秒)"
                echo "  -z, --sleep NUM    通知間の待機時間を設定 (デフォルト: 2秒)"
                echo "  -h, --help         このヘルプメッセージを表示"
                echo ""
                echo "例: pomodoro_cycle -w 45m -s 10m -l 30m -c 3"
                echo "例: pomodoro_cycle --work 45m --short 10m --long 30m --cycles 3"
                return 0
                ;;
            *)
                echo "不明なオプション: $1"
                echo "ヘルプを表示するには: pomodoro_cycle -h"
                return 1
                ;;
        esac
    done

    echo "🍅 ポモドーロタイマー開始: $_POMO_CYCLES サイクル"
    echo "⏱️ 作業時間: $_POMO_WORK_TIME | 短い休憩: $_POMO_BREAK_TIME | 長い休憩: $_POMO_LONG_BREAK_TIME"

    for i in $(seq 1 $_POMO_CYCLES); do
        echo "⏰ サイクル $i/$_POMO_CYCLES: 作業時間 開始"
        sleep $_POMO_SLEEP_TIME
        _pomo_timer "Work time done" $_POMO_WORK_TIME

        if [ $i -lt $_POMO_CYCLES ]; then
            echo "☕ サイクル $i/$_POMO_CYCLES: 短い休憩時間 開始"
            sleep $_POMO_SLEEP_TIME
            _pomo_timer "Short break done" $_POMO_BREAK_TIME
        else
            echo "🌴 サイクル $i/$_POMO_CYCLES: 長い休憩時間 開始"
            sleep $_POMO_SLEEP_TIME
            _pomo_timer "Long break done" $_POMO_LONG_BREAK_TIME
        fi
    done

    echo "✅ ポモドーロタイマー完了！🎉"
}

# vim:ft=sh
