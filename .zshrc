#!/usr/bin/zsh

# License : MIT
# http://mollifier.mit-license.org/

##########################################
# External files
[ -f ~/.bashrc ] && source ~/.bashrc
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_functions ] && source ~/.zsh_functions

# fzf
[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
##########################################
# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
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
zstyle ':zle:*' word-chars " /=;@:{}[]()<>,.|"
zstyle ':zle:*' word-style unspecified

########################################
# 何故かsite-functionsの場所が`/usr/local/share/zsh/site-functions`になっていたのでパスを追加
# `$ echo $fpath | sed s/\\s/\\n/g`で確認
fpath=(/usr/share/zsh/site-functions $fpath)
fpath=(/usr/share/zsh/functions/Completion/zsh-completions/src $fpath)
fpath=(${HOME}/my_zsh_completions $fpath)
fpath=(${ZPLUG_BIN} $fpath)
fpath=(${HOME}/bacpac $fpath)


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
zstyle ':completion:*:default' menu select #interactive  # Tabキーを押すと候補を選択できる
# setopt menu_complete  # 絞込み検索  # tabですぐに選択できないので削除

# コマンド一覧を見れるcompgenを有効化する
autoload -Uz bashcompinit
bashcompinit

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
setopt correct              # もしかして機能


########################################
# Keybinds
# デフォルトのキーバインドemacsモードにしたいときは以下を打つ
# ZSH_KEYBINDS_VIMODE=true; source ~/.zsh_keybinds
if [[ -f ${HOME}/.zsh_keybinds ]]; then
    export ZSH_KEYBINDS_VIMODE=true
    source ~/.zsh_keybinds
fi


########################################
# Perl path
PATH="/home/vagrant/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/vagrant/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/vagrant/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/vagrant/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/vagrant/perl5"; export PERL_MM_OPT;

##########################################
# Other APPs completions

# docker-compose
if [ type docker-compose ] >/dev/null 2>&1 && [[ ! -f ${HOME}/my_zsh_completions/_docker-compose ]] >/dev/null 2>&1; then
    printf "Install docker-compose zsh-completion..."
    curl -fsSL https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ${HOME}/my_zsh_completions/_docker-compose && echo "done"
fi


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

    # コマンドをリンクして、PATH に追加し、プラグインを読み込む
    zplug load

else; printf "Install zplug? [y/N]: "
    if read -q; then
        curl -sL --proto-redir -all, https\
            https://raw.githubusercontent.com/zplug/installer/master/installer.zsh |
    zsh && source $0  # .zshrc再リロード
    fi
fi
# vim:ft=zsh
