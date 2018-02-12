commit 
Merge: 
Author:
Date:  



    ---summary---
    018b50d [rm]@.bash_aliases: alias vi=vim removed
    9afc50a @.bash_functions: cconv default $1(from)=USD $2(to)=JPY $3(amount)=1

    * .tmux.conf
        * tpm: tmux-resurrect
        * Session name pre-word as '#' instead of 'S'
        * Error modify paste mode
        * tmux copy mode use Esc, y, p like vim commands
    * .w3m
        * bookmark
            * Add search gist
            * Add github.com
        * keymap
            * Add a,s = Next, Prev TAB
    * .zsrch
        * Add right prompt display time as yellow bold color
        * hist_save_no_dups=Do not save same command in history
        * Share .zsh_history with virtual machine , Modify .zsh_history path to .history/
        * Install twitter.sh using zplug & add path
        * global alias L=vimpager if exist
    * .zplug.zsh
        * vim syntax as zsh, auto-fu makes frozen repository
        * Install twitter.sh using zplug & add path
    * .gitconfig
        * Modify git log1 remove square bracket [] describing relative time
        * Add git diff-so-fancy


    ---logs---
    50bdc54 [add]README.md
    018b50d [rm]@.bash_aliases: alias vi=vim removed
    9afc50a @.bash_functions: cconv default $1(from)=USD $2(to)=JPY $3(amount)=1
    e7401ac [add]@.tmux.conf/tpm: tmux-resurrect
    9f0d214 [mod]@.tmux.conf: Session name pre-word as '#' instead of 'S'
    130b7bb [add]@.bash_function: "cconv" is currency converting function
    3c38d8b [add]@.w3m/bookmark: search gist
    c7951c5 [mod]@.gitconfig: git log1 remove square bracket [] describing relative time
    6f7979f [add]@.zshrc: Add right prompt display time as yellow bold color
    ec4931f [add]@.zshrc: hist_save_no_dups=Do not save same command in history
    eba8e87 [mod]@.zshrc:Share .zsh_history with virtual machine , Modify .zsh_history path to .history/
    e37e7c3 [mod]@.zplug.zsh: vim syntax as zsh, auto-fu makes frozen repository
    b2555e5 [mod]@.tmux.conf: Error modify paste mode
    8a2b495 [mod]@.zplug.zsh, @.zshrc: Install twitter.sh using zplug & add path
    1d0a25c [add].tmux.conf: tmux copy mode use Esc, y, p like vim commands
    15b1235 [add].w3m/bookmark: github.com
    8b8629f Merge branch 'develop' into feature/powerline
    e55fde4 [add]@.w3m/keymap: a,s = Next, Prev TAB
    d421698 [add]@.tmux.conf: Run powerline when tmux start
    083682d [add]@.gitconfig: Add git diff-so-fancy
    e23dd11 [add]@.zshrc: global alias L=vimpager if exist
    407890f Merge tag 'v1.6.0' into develop

commit d14bae739122dbf2e85199b6c7cd7e185565bf13 (tag: v1.6.0, origin/master, master)
Merge: a4f4c95 4ad668e
Author: u1and0 <e01.ando60@gmail.com>
Date:   Sun Jan 28 20:09:47 2018 +0900

    zplug auto install / tmux plugin maneger / w3m mod / vim plugin manegar

    ---summary---
    * .tmux.conf
        * Quick window selection
        * Status bar modify
        * Entering copymode when scrolling up
        * Time status modify
        * Mouse mode changed
        * Add tmux plugin manager `tpm`
        * Add tmux plugin manager `tpm`
        * Set mouse setting
        * Utf8 option was removed in tmux v2.1
        * Set bindkey as Ctrl+S
        * Add mouse setting
        * Default setting
    * .zshrc
        * zplugs install extract from .zshrc to .zplug.zsh
        * Remove curly brace option
        * Twitter shellscripts shell path to $PATH
        * Add D=2> /dev/null
        * Add some zsh option
        * Global alias G=ag or ack or grep
    * .zplug
        * Zplug install if not init.sh
        * Install peco, peco-tmux, fzy, fzf-tmux
    * .vimrc
        * Set ignorecase, smartcase
        * Set hidden for buffer
        * Comment japanese manual
        * Add Japanese man
        * Install Multi Cursol
        * Install "Ag" via Neobundle
        * Tab indent 4 spaces
    * .w3m
        * config
            * Mark option enable
            * Wrap search always on
        * bookmark
            * vim cheatsheet
            * vim usage
        * keymap
            * help command as :h
            * tab, history navigation
            * tab, history navigation
            * f,b=Next,Prev Link
            * TAB, SHIFT+TAB=Next,Preb TAB
            * Remove Ctrl+Shift+t key

    ---logs---
    4ad668e [rm]@.zshrc: Remove curly brace option
    ff792b2 [mod]@.w3m/keymap: f,b=Next,Prev Link / TAB, SHIFT+TAB=Next,Preb TAB / [rm]Ctrl+Shift+t key
    338905c [add]@.w3m/bookmark.html: vim cheatsheet
    4fd881c [add]@.w3m/config: mark option enable
    b2d8889 [add]@.tmux.conf: quick window selection
    c50e120 Merge branch 'feature/tmux-tpm' into develop
    823507a [mod]@.tmux.conf: status bar modify
    04915a5 [rm]@.tmux.conf: Entering copymode when scrolling up
    5d946dd [mod]@.tmux.conf: time status modify
    461b8a5 [mod]@.tmux.conf: mouse mode changed
    356d842 [mod]@.vimrc: set ignorecase, smartcase
    0688a69 [mod]@.zplug.zsh: tsub history-fzf-select retunred back to `defer 3`
    2460333 [add]@.zplug.zsh: auto-fu completion patch
    e71fd69 [add]@.zplug.zsh: auto-fu: automatic complete-word and list-choices
    632a1c4 Merge remote-tracking branch 'origin/develop' into develop
    165d3ec [add]@.zplug.zsh: diff-highlight
    4418dcd [mod]@.zplug.zsh: comment change, differ 1
    2945960 [mod]@.zplug.zsh: Ctrl+R history-find differ 3
    3fda744 [mod]@.gitconfig: git dif = git diff --stat
    4c299a6 [mod]@.w3m/keymap: help command as :h
    589a002 [add]@.tmux.conf: Add tmux plugin manager `tpm`
    adc635f [mod]@.w3m/keymap: tab, history navigation / @.w3m/config: wrap search always on
    91ef1b9 bookmark & config link color skybule
    a0e746b [add]@.zshrc: twitter shellscripts shell path to $PATH
    5e944cd [add]@.w3m/bookmark: w3m vim usage
    0b1f542 [add]@.tmux.conf: Set mouse setting
    c329069 [rm]@.tmux.conf:  utf8 option was removed in tmux v2.1
    fd11474 [mod]@.tmux.conf: set bindkey as Ctrl+S
    390186f [add].tmux.conf: Add mouse setting
    998edad [add]@.vimrc: set hidden for buffer
    3b5492d [add].tmux.conf: default setting
    34982ac [add]@.zshrc: Add D=2> /dev/null
    8250080 [mod]@.vimrc: comment japanese manual
    2c69a96 [add]@.zplug: set ZPLUG_SUDO_PASSWORD as vagrant if I am vagrant
    c79505a [add]@.vimrc: Add Japanese man
    0c18fa7 [add]@.zplug.zsh: Add auto-fu
    204bd2a [add]@.zshrc: add some zsh option
    06bf712 [add]@.vimrc: Install Multi Cursol
    9d2faec [add]@.vimrc: Install "Ag" via Neobundle
    476615b [add]@.zshrc: global alias G=ag or ack or grep
    6d7f048 [add]@.vimrc: tab indent 4 spaces
    8d14e7c [mod].zshrc/.zplug.zsh: zplugs install extract from .zshrc to .zplug.zsh
    7530d83 [mod]Installing peco via zplug
    9df9fe2 [mod]zplug install peco, fzy, fzf-tmux
    1105450 [rm].zsh_functions
    ce0894c Merge develop
    82cc6b3 Merge develop
    3380698 [mod] if .zplug/init.sh exist install plugins
    3601d46 Merge tag 'v1.5.0' into develop


commit a4f4c9586ec6e4d6fe83d858636fcf121cab874c (tag: v1.5.0)
Merge: 73bb9cb d4ba340
Author: u1and0 <e01.ando60@gmail.com>
Date:   Tue Jan 16 19:02:01 2018 +0900

    Merge branch 'release/v1.5.0'

    ---Summary---
    * .zshrc
            * add zplug
                    * add zsh-syntax-highlight
                    * add zsh-history-substring-search
                    * add zsh-autosuggestion
                    * add zsh-completion
                    * add zsh-gomi
                    * add cli-finder
                    * add fzf
                    * add enhancd
    * w3m
            * bookmark
    * git config
            * git alias
                    * log0, log1, log2, log3, sort colors
    * .vimrc
            * Neobundle submodle management
            * Comment out auto bracket move
            * Set clipboard sharing
    * .tigrc
            * modify status-show-untracked-dirs
    * .bash_alias
            * ping alias commented out
    * .bash_functions
            * w3m history search function 'whistory()'

    ---Logs---
    d4ba340 [mod]git log<n> add `--all` option
    d8c7b2e [add].zshrc/zplug: ctrlP/N history-substring-search
    6164e16 [mod]@.gitconfig: ignore .vim/.netrwhist
    81e7a05 [mod]@.gitconfig: git log2/log3 color auto
    73ccc5a [mod]@.tigrc: tigrc warning status-show-untracked-dirs
    e09e8cf [mod].gitignore: ignore .vim/bundle all directory except neobundle.vim
    381da3b [add]@.vim/bundle/neobundle: submodule add neobundle
    a527d7e [rm] neobundle remove --cached
    5583719 [add]@.bash_aliases: ping alias commented out
    ac8de67 [rm]--cached remove all bundle except neobundle
    81ac676 [mod]@.gitignore: submodule ignore
    5e66f9e @gitconfig/alias: git log1 color auto
    667e80d [add]@.vimrc: set clipboard sharing
    5583719 [add]@.bash_aliases: ping alias commented out
    5dafc25 [add]@.zshrc/zplug: Enhancd
    07fe0b4 [mod]@.zshrc: zplug first install modify
    2e3f55c [add]@.zshrc: zplug first auto install
    bd9dfe8 [add]@.zshrc: zplug install [zplug, zsh-history-substring-search, fzf, zsh-gomi, cli-finder, z
sh-syntax-highlighting, zsh-autosuggestions, zsh-completions]
    2354821 [add]@.zshrc: global alias F=fzf
    3f4f042 [mod].vimrc: NeoBundleInstall caw.vim <reinstall>
    37686ce [add].zsh_functions / [mod].bash_functions, .zsh_functions: Use fzf instead of peco
    eef27a7 [mod]@.bash_function: ranger nested
    901a3c2 [rm]@.vimrc: comment out auto bracket move
    c3ebcbe [add]@.w3m/bookmark.html: gmail
    5253ad1 .vim/bundle/neobundle.vim
    361cbfe Merge branch 'develop' of github.com:u1and0/dotfiles into develop
    b9445c5 [add]@.bash_functions: whistory() - w3m search from history
    a40d1cb [mod]@.gitconfig: git sort color change
    9cd3e7e [add]@.w3m/bookmark.html: Add mobile twitter
    bbecb00 Merge remote-tracking branch 'origin/develop' into develop
    601ce0e Merge tag 'v1.4.0' into develop
    85c8d16 [auto]@.vim/bundle/*: NeobundleUpdate


commit 601ce0e48ebd2184220cec4e6a01c57b2db7052f
Merge: d4adbd6 73bb9cb
Author: u1and0 <e01.ando60@gmail.com>
Date:   Sun Jan 7 22:48:38 2018 +0900

    Merge tag 'v1.4.0' into develop

    Merge branch 'release/v1.4.0'

    * .ipython/profile_default/startup/02_inline.ipy
        * Add guideline of jupyter console with ssh connection.
    * .jupyter/jupyter_notebook_config.py
        * Add configuration of ssh connecting.
    * .gitconfig
        * git log[0-3]
        * large number shows more precisely.
        * git last depends on git log0
        * git today depends on git log1
    * .bash_alias
        * gl=git log1
        * v=vagrant
    * .bash_functions
        * Add google search function named `google()` which use w3m.
        * keybindings '^R' is incremental search of history.
    * .zshrc
        * shell util `thefuck` setup
        * vagrant config modify
    * .config/ranger/rc.conf
        * set draw_borders true
        * set preview_images true

    73bb9cb Merge branch 'release/v1.4.0'
    1c77064 [add]@/.ipython/profile_default/startup/02_inline.ipy: Add guideline for using jupyter console
 over ssh connection.
    dc665ea [mod]/.ipython/profile_default/startup/02_inline.ipy: come back again __gui__ magic
    d4adbd6 [add]@.bash_function: function google() using text browser <w3m>
    39a086b [mod]@.gitconfig: [push] upstream=it must set upstream remote branch. Use `git branch -u origi
n/master` for setting. Check `git branch -vv`
    af10ad1 [mod]@.bash_alias: gl=git log1 = log --graph --date=relative --date-order --format
    933ba00 [mod]@.gitconfig: Modify git log0-3
    121d9e7 [mod]@.gitconfig/alias: git today shoter discription
    d8dec2e [mod][rm]@.gitconfig: git alias log7 modify / last(no color) removed. Use --color option
    d8fe732 Merge remote-tracking branch 'origin/develop' into develop
    54ed00d [mod]@.ipython/profile_default/startup/02_inline.ipy: Use `%matplotlib inline` only because of
 core dumping when ssh connecting
    80ac547 [mod]@.jupyter/jupyter_notebook_config.py: jupyter-notebook ssh connection setting
    8ea078a [add]@.bash_functions: incrementar search from .zsh_history
    4ff9d49 [mod]@.gitconfig: git last-color modify
    bdb778d [mod]@.zshrc: remove VAGRANT=HOME / @.bash_alias: v=vagrant
    5265af0 [mod]@.zshrc: locate thefuck then thefuck --alias
    0d264f0 [mod]@.config/ranger/rc.conf: set draw_borders true
    5238f9e [mod]@.config/ranger/rc.conf: set preview_images true
    c421f5d [mod]@.ipython/profile_default/startup/04_useful_func.ipy: pd.Series.less()
    f92e393 [mod]@.jupyter/jupyter_qtconsole_config.py: qtconsole config, window&font size
    41af64e Merge tag 'v1.3.0' into develop
    aa1914d [merge] auto


commit 41af64e54287812d1f695ac68ffa19218c22a601
Merge: 62d1205 24dfff6
Author: u1and0 <e01.ando60@gmail.com>
Date:   Wed Dec 27 23:49:35 2017 +0900

    Merge tag 'v1.3.0' into develop

    v1.3.0: Add python config

    Add functions
    ---
    * pyenv: python environment manager.
    * python config: .ipython, .jupyter, .matplotlib.
    * python_print(): calculate easily on bash using python, numpy and scipy.
    * thefuck: command modificator.

    Change log from last tag.
    ---
    Merge branch 'release/v1.3.0'  (HEAD -> master)
    Merge remote-tracking branch 'origin/develop' into develop  (release/v1.3.0, develop)
    [add]@.zshrc: pip install thefuck & config zshrc add to `$(thefuck --alias)`
    [add]@.bash_functions: python_print function import scipy.constants
    [mod]@.ipython: use takao font  (origin/develop)
    Merge remote-tracking branch 'origin/develop' into develop
    [rm] cached .bash_profile / tmux login
    [mod]@.bash_function: numpy use start import [add]@zshrc: {a-z} setopt
    [mod]@.bash_functions: function pp() import numpy, pandas
    [add].ipython/profile_default/startup/04_useful_func.ipy: df.less() method
    [mod]@.ipython/profile_default/ipython_config.py: IPAMincho comment out
    [rm].matplotlib/IPAfont00303.zip
    [merge]@.pyenvrc
    [mod]@.ipython/profile_default/ipython_config.py: use TakaoPGothic
    [add]@.bash_aliases: h=history
    [mod]@.pyenvrc: `path=/usr/bin` first!
    [add] .pyenvrc: `source activate snow` as default
    Merge remote-tracking branch 'origin/develop' into develop
    [add] @.bash_profile: tmux login
    [add]git last-color
    [mod]@.pyenvrc: install miniconda
    [rm] IPAfont.zip, [mod]ipython config, notebook.json
    [add] .globalgitignore
    @ipython: [mod]startup, config ignore cython, memory profiler, line profiler / @.jupyter: jupyter them
r
    [add].ipython .jupyter .matplotlib
    Merge tag 'v1.2.0' into develop
    [mod]@.zshrc: When use `sudo` command then check using `which` command
    [mod] @.zshrc: If exist .pyenvrc & .pyenv then read .pyenvrc


commit 8a20be3aa686241b8fc291c5a65345ad07de6d9b
Merge: 97d56c4 c6e70b9
Author: u1and0 <e01.ando60@gmail.com>
Date:   Sun Nov 5 22:27:40 2017 +0900

    Merge tag 'v1.2.0' into develop

    Unified with windows environment

    97d56c4 [add]@.zshrc: global alias I=ignore color (HEAD -> release/v1.2.0, develop)
    983f936 [mod]@.bash_functions: vagrant-snapbox
    8b5a82c [add]@.bash_aliases: free=free -h (origin/develop)
    f22a3ad [add]@.zshrc: global alias as "W=wc -l" <- line count
    dc30ceb Merge remote-tracking branch 'origin/develop' into develop
    c4e2b10 [merge] feature/win
    0c69c75 [add].vim/bundle/.neobundle/ftdetect/ftdetect.vim
    5e3ab0a [add] .yaourtrc
    e3d211d [merge] origin/develop
    7a27514 [mod][.zshrc: fpath changed, [add]@.bash_functions: vagrant-snapbox
    635f5f6 [add] @.vim/bundle/NeoBundle
    79d7654 Merge tag 'v1.1.0' into develop
    1cf9622 [rm]@.zshrc: Dropbox repository args
    561eead [mod] @.zshrc: args->fpath, shell
    f956a0f [rem] .pyenvrc


commit 79d7654034d2da18a8bffe0699d3c59dbcaea7c6
Merge: 980ac4c 3aac8be
Author: u1and0 <e01.ando60@gmail.com>
Date:   Mon Oct 23 10:38:01 2017 +0900

    Merge tag 'v1.1.0' into develop

    Merge all brange & make README file

    [mod]@.gitconfig: push option simple
    @.config/ranger/rc.conf: confirm when delete a file
    [merge] re-merge arch & develop
    [merge] arch & master ... *NeoBundle reinstall
    Merge tag 'v1.0' into develop
    [mod]@.zshrc: PATH added /usr/bin
    [mod] @.pyenvrc:  path add anaconda3-5.0.0
    Merge remote-tracking branch 'origin/arch' into arch
    [add] .pyenvrc
    [add] @bash_aliases: sudo powerpill
    [mod] @.yaourtrc: light yaourt BUILD_CONFIRM=1
    [add] @.bash_aliases: pacman always run as root user
    Merge remote-tracking branch 'origin/arch' into arch
    [add] @.zshrc: bindkey -e -> emacs keybind, bindkey delete-char
    [add] @.zshrc: bindkey -e -> emacs keybind, bindkey delete-char
    Merged origin/arch
    [mod] @.bash_aliases: sudo, history command
    [mod] export EDITOR VISUAL PAGER
    Merge remote-tracking branch 'origin/arch' into arch
    [mod] @.bash_aliases: watch command
    [mod] @.bash_aliases: sudo, watch validate for aliases
    [add] .yaourtrc
    [add] @.zshrc: yaourt argument VISUAL
    [add] @bash_aliases: sudo vim
    history command modify as "history +1"
    [mod]@.bash_aliases: watch ll remove -t
    Merge branch 'master' into arch
    remove profile bashrc pyenvrc
    [mod] @.gitconfig: user
    [add] @.zshrc: keybind word-move & kill-word
    [add] pacman always run as root user


commit 4a16f26c5bcc08a31c4d794bd12ec5bcab1f2a0c
Merge: b5c2a61 c406bcb
Author: u1and0 <e01.ando60@gmail.com>
Date:   Mon Oct 23 08:33:25 2017 +0900

    Merge tag 'v1.0' into develop

    The first commit of my dotfiles.

    [develop] <- archlinux virtual machine dotfiles
    [master] <- ubuntu real machine dotfiles

    * install pyenv
    * zsh keybind
    * my zsh functions at home directory
    * ranger config
    * tig config
    * vim config and plugin files

