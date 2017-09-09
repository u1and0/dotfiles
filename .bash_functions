echo '--Loading ~/.bash_functions--'

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
	python -c "print($*)"
}
alias pp='python_print'
