#!/bin/sh

# # ローディングスピナーを表示する
# spinner $!
# ```
#
# このスクリプトでは、`spinner`関数がローディングスピナーを表示します。
# `$1`には、バックグラウンドで実行されるプロセスのPIDを渡します。
# スピナーのフレームは、`spinstr`変数に保存されます。
# `printf`コマンドを使用して、スピナーの各フレームを表示し、`sleep`コマンドを使用して、スピナーの速度を調整します。
# 最後に、`printf`コマンドを使用して、スピナーを消去します。
function spinner() {
    local pid=$1
    local delay=0.02
    local spinstr='.'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        printf " %s " "$spinstr"
        local spinstr=$spinstr'.'
        sleep $delay
        printf "\b\b\b\b\b\b\b"
        if [ ${#spinstr} -gt 3 ]; then
            spinstr='.'
        fi
    done
    printf "    \b\b\b\b"
}


function print_one_by_one(){
    for (( i=0; i<${#1}; i++  )); do
      echo -r \"${strirg:$i:1}\"
      if [ -t 1  ]; then
        sleep 0.02
      fi
    done
}


# curlgpt
# curlでchatgptに第一引数の文字列の質問
# jqでcontentのみ表示
# sedで最初と最後の"を削除し、改行表示
function curlgpt(){
    curl -s -X POST https://api.openai.com/v1/chat/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer ${CHATGPT_API_KEY}" \
        -d '{
            "model": "gpt-3.5-turbo",
            "messages": [
                {
                    "role":"user",
                    "content": "'"$1"'"
                }
            ],
            "temperature": 1.0,
            "max_tokens": 1000
        }' | jq '.choices[].message.content' |
            sed -e 's/^"\|"$//g' -e 's/\\n/\n/g' &
    spinner $!
}
