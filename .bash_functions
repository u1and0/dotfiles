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

function docker-tags {
  curl -s https://registry.hub.docker.com/v1/repositories/$1/tags | jq -r '.[].name'
}
# vim:ft=sh
