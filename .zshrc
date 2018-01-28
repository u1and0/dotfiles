# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8
export SHELL=/usr/bin/zsh

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

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

 # デフォルトのエディタ
 export EDITOR='vim'
 export VISUAL='vim'

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


# ==git prompt==
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
GITPROMPT='${vcs_info_msg_0_}'

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%F{cyan}%n@%m%F{green} %~ ${GITPROMPT} ${reset_color}
$ " 



# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 何故かsite-functionsの場所が`/usr/local/share/zsh/site-functions`になっていたのでパスを追加
# `$ echo $fpath | sed s/\\s/\\n/g`で確認
fpath=(/usr/share/zsh/site-functions $fpath)
fpath=(/usr/share/zsh/functions/Completion/zsh-completions/src $fpath)
fpath=(${HOME}/my_zsh_completions $fpath)


# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit


# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# 補完メッセージを読みやすくする(https://gist.github.com/mitukiii/4954559)
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ""
# 補完候補に色を付ける（空文字列はデフォルト値を使うという意味）
zstyle ':completion::expand:*' glob true            # echo /bin/*sh とかで展開する
zstyle ':completion::expand:*' substitute true      # echo $(ls) とかで展開する


########################################
# オプション
setopt print_eight_bit      # 日本語ファイル名を表示可能にする 
setopt no_beep              # beep を無効にする 
setopt no_flow_control      # フローコントロールを無効にする
setopt ignore_eof           # Ctrl+Dでzshを終了しない
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt auto_cd              # ディレクトリ名だけでcdする
setopt auto_pushd           # cd したら自動的にpushdする
setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集可能
setopt extended_glob        # 高機能なワイルドカード展開を使用する
setopt hist_expand          # 補完時にヒストリを自動的に展開         
setopt inc_append_history   # 履歴をインクリメンタルに追加
# setopt braceccl             # {a-z}を{a..z}と同様にする 
setopt auto_param_keys      # カッコの対応などを自動的に補完する
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できるようにする
########################################
# キーバインド

bindkey -e   # emacs-mode 
bindkey '^R' history-incremental-pattern-search-backward
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^[[3~' delete-char   # delete key
bindkey '^H' backward-kill-word   # ctrl+Backspace
bindkey '^[_' redo   # alt+_

# カーソル移動
# # ctrl+up
# bindkey '\e[1;5A' backward-word
# # ctrl+down
# bindkey '\e[1;5B' backward-word
bindkey '\e[1;5C' forward-word   # ctrl+right
bindkey '\e[1;5D' backward-word   # ctrl+left
bindkey "\e[Z" reverse-menu-complete   # Shift-Tabで補完候補を逆順す


########################################
# Global Alias
alias -g D='2> /dev/null'
alias -g F='| fzf'
alias -g H='| head'
alias -g L='| less'
alias -g M='| more'
alias -g P='| peco'
alias -g T='| tail'
alias -g W='| wc -l'
alias -g Y='| fzy'

if which ag > /dev/null 2>&1 ; then
	alias -g G='| ag'
elif which ack > /dev/null 2>&1 ; then
	alias -g G='| ack'
else
	alias -g G='| grep'
fi

# ANSIカラーコードの無効化
alias -g I='| sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi


##########################################
# zplug
if [[ -f ${HOME}/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=${HOME}/.zplug.zsh
    source ~/.zplug/init.zsh

    # Auto installer
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
	    echo; zplug install
        fi
    fi
		    
    # コマンドをリンクして、PATH に追加し、プラグインは読み込む
    zplug load --verbose

else; printf "Install zplug? [y/N]: "
    if read -q; then
    	curl -sL --proto-redir -all,\
            https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh\
		| zsh && exec $SHELL -l  # .zshrc再リロード
    fi
fi


##########################################
# External files
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

if [ -f ~/.pyenvrc ] && [ -d ~/.pyenv ]; then
    . ~/.pyenvrc
fi

if which thefuck >/dev/null 2>&1 ; then
    eval $(thefuck --alias)
fi

# twitter sh packages
if [ -d ${HOME}/Dropbox/Program/sh/kotoriotoko/BIN ]; then
    export PATH=${HOME}/Dropbox/Program/sh/kotoriotoko/BIN:$PATH
fi


# vim:set ft=zsh:

