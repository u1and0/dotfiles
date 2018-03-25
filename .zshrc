# vim:set ft=zsh:
# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

##########################################
# External files
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi


##########################################
# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.history/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# Git prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
GITPROMPT='${vcs_info_msg_0_}'

# Prompt
PROMPT="%F{cyan}%n@%m%F{green} %~ ${GITPROMPT} ${reset_color}
$ "
RPROMPT="%{$fg_bold[yellow]%}%*%{$reset_color%}"
# RPROMPT="%{$bg[magenta]%}%*%{$reset_color%}"


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
zstyle ':completion:*' completer _oldlist _complete
zstyle ':completion:*:default' menu select  # Tabキーを押すと候補を選択できる


########################################
# Options
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
setopt hist_save_no_dups    # 古いコマンドと同じものは無視
setopt inc_append_history   # 履歴をインクリメンタルに追加
# setopt braceccl             # {a-z}を{a..z}と同様にする
setopt auto_param_keys      # カッコの対応などを自動的に補完する
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できるようにする


########################################
# Keybinds
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



##########################################
# Load zplug
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

# Powerline prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir anaconda vcs newline)
