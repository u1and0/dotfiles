# vim:ft=zplug
# zplug自体のアップデート
zplug 'zplug/zplug', hook-build:'zplug --self-manage'


# Install fuzzy-finder "fzf"
zplug "junegunn/fzf-bin", \
	as:command, \
	from:gh-r, \
	rename-to:"fzf", \
	frozen:1
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux

# Install fuzzy-finder "fzy"
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
	as:command, \
	rename-to:fzy, \
	hook-build:"make && sudo make install"

# Install fuzzy-finder peco
zplug "peco/peco", as:command, from:gh-r, frozen:1
zplug "b4b4r07/dotfiles", as:command, use:bin/peco-tmux  # fzf-tmux の peco バージョン


# history search using fzf using ctrl+R
zplug "tsub/f4036e067a59b242a161fc3c8a5f01dd", from:gist 

# history search using ctrl+P/N
zplug "zsh-users/zsh-history-substring-search", defer:3
if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi


# Install zsh-gomi
zplug "b4b4r07/zsh-gomi", \
	as:command, \
	use:bin/gomi, \
	on:junegunn/fzf-bin


# CLI finder like Mac
zplug "b4b4r07/cli-finder"


# 読み込み順序を設定する
# 例: "zsh-syntax-highlighting" は compinit の後に読み込まれる必要がある
# （2 以上は compinit 後に読み込まれるようになる）

# syntax highlighting in shell command
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Auto completions 
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "hchbaw/auto-fu.zsh", at:pu  # zsh automatic complete-word and list-choices

# Enhanced change directory
zplug "b4b4r07/enhancd", use:init.sh, defer:3

