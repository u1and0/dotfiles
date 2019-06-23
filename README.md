# Installation
Intall my dotfiles using oneliner

```
$ bash -c "$(curl -fsSL git.io/dotu1)"
# or
$ bash -c "$(wget -qO - git.io/dotu1)"
```

## Redundant Installation
Use raw github content

```
$ bash -c "$(curl -fsSL raw.githubusercontent.com/u1and0/dotfiles/master/.install/install)"
or
$ bash -c "$(wget -qO - raw.githubusercontent.com/u1and0/dotfiles/master/.install/install)"
```

## install script jobs

* Cloning & Replacing dotfiles
* Replacing dotfiles
* Restore archlinux packages using `bacpac`
* Install python using `pyenv`
* Change user shell

---
# Version info
## v1.14.1: timeit, zplug completion, small awk script
[mod] bacpac
[mod] README.md v1.14.0 description
[fix] _golang -> _go
[add] .zsh_functions/timeit()
[add] zplug completion
[add] join line awk script @.bashrc

## v1.14.0: Add arduino-vim setting, ranger open xls & pdf as text
* ranger
  * [add] open xls to $PAGER option @ranger/rifle.conf
  * [add] open pdf to $PAGER option @ranger/rifle.conf
* zsh
  * [add] suffix alias X = xargs @.zsh_alias
* bash
  * [add] devide weblio() weblio-vim() functions
  * [add] weblio function @.bash_functions
* vim/nvim
  * [merge] fix .vimrc conflict
  * [add] autocmd
  * [add] NERDTree, Temp commands, Arduino commands
  * [mod] vim history keep 10000
  * [add] arduino ftplugin @.vim/
  * [add] FQBN & PORT use let args. Add keymap.
  * [mod] not load arduino.rc.vim (deleted), use ftplugin instead
  * [add] arduino.rc.vim: Arduino commands setting
  * [mod] not lazy W3m load @dein/plugins.toml, lazy.toml
  * [add] ArduinoCompile & ArduinoUpload command @.vimrc
* bacpac
  * [mod] update package list @docker
* docker
  * [add] docker config json

## v1.13.6: PDF view at neovim
* git
  * [rm] remote.origin option @.gitconfig
  * [add] git delete: remove remote branch @.gitconfig
* vim/nvim
  * [mod] nvim autocmd pdf open
  * [add] pdf view at neovim to suffix alias
  * [mod] open pdf&archive nomapping, display top @nvim/autocmd
  * [add] quick close window after :GoRun
* ranger
  * [mod] video player totem @ranger

## v1.13.5: go path for deoplete.nvim
* vim
    * [mod] gocode path

## v1.13.4: tweet.sh path
* zsh
    * [mod] export path modified @.zplug.zsh [add] apt-fast compdef

## v1.13.3: hook-load @zplug.zsh
* zsh
    * [mod] hook-load & touch .z when build rupa/z @.zplug.zsh

## v1.13.2: prompt display dotfiles
* bash/zsh dotfiles
    * [mod] fixwhitespace @.bash_functions
    * [mod] prompt display only .zplug.zsh @bash/zsh dotfiles
    * [add] bookmark emoji @w3m/bookmark

## v1.13.1: pyenv excutable check
* bash
    * [mod] pyenv excutable check @.bashrc

## v1.13.0: golang dev-env
* bash
    * [mod] go path @.bashrc , bacpac backup
    * [mod] fzf command, zplug load options @.zshrc, .bashrc, .zplug.zsh
    * [mod] git diff option @.bash_alias & [add] ydiff (use `gd | ydiff -s`)
    * [add] calc function use perl or awk
    * [add] $SHPATH @.bashrc, .bash_alias
* bacpac
    * [add] parallel & r @bacpac
    * [mod] bacpac diff command
    * [mod] atool opt, pdftotext alias, bacpac completion
    * [add] Multiprocess compressor: pigz, pbzip2, pixz in package list @bacpac, .atoolrc
* nvim / vim
    * [add] vim-go plugin setting @lazy.toml
    * [add] splitjoin @nvim plugins :commented out ISSUE
    * [mod] deactivate pyenv plugin unless excutable pyenv command @nvim lazy
    * [rm] dein command @nvim plugin
    * [mod] vim/nvim config dein auto load @vim
    * [add] go path / go vim settings
    * [mo] default key bind vim @jupyter nbconfig
    * [add] TempfileEdit, TempfileWrite command added @autocmd.rc.vim
    * [add] open pdf autocmd @atutocmd.rc.vim
    * [add] unipaired easy jump keybinds plugin @.vimrc
    * [mod] dein lazy @.vimrc
    * [mod] plugin manager NeoBundle->dein @.vimrc
* w3m
    * [merge] w3m bookmarks
    * [add] w3m bookmark gawk
    * [mod] next/prev page keybind @w3m keybind
    * [add] w3m bookmark GAWK
    * [add] regex @w3m bookmark
    * [add] perldoc ja @w3m bookmark
    * [mod] main menu , add perl referlence @w3m bookmark, keymap
    * [add] awk usage
* python
    * [mod] conda enc snow export
* zsh
    * [rm] fzy @.zplug.zsh
    * [mod] docker-compose completion install command @.zshrc
    * [add] docker compose zsh-completion @.zshrc
    * [mod] tweet.sh path, add comment @.zplug.zsh
    * [add] alias of pdfto... tools @.zplug.zsh
    * [mod] alias D send all to /dev/null
    * [add] hist.sh hist_graph.sh to gist @.zplug.zsh
    * [add] wordcount from gist @.zplug.zsh
    * [mod] shell shoccar path @.zplug.zsh
    * [add] pdftogz, pdftobz2, pdftoxz from my gist @zplug.zsh

## v1.12.0: zsh-keybinds/VI-MODE, Get vim plugins (bufferline, Gundo, Calculate), tmux-prefix: Space
* bash
    * [rm] remove thefuck, use .zsh option instead
    * [mod] colordiff alias @.bash_alias
    * [add] wikipedia function @.bash_functions
* zsh
    * [add] perl path added by cpan @.zshrc
    * [rm] run-help key @.zsh_keybinds
    * [rn] setopt menu_complete @.zshrc
    * [add] vi-mode displaied in prompt @.zplug.zsh
    * [add] zsh bindkey vi-mode !BREAKABLE CHANGE!
* bacpac
    * [add] add modules yay & expac @bacpac
* vim
    * [fix] file_rec -> file/rec @nvim python.toml
    * [add] :Zenkaku & :Hankaku plugin @lazy.toml
    * [add] calculate function for vim
    * [add] calclate function for vim
    * [add] nvim external grep program @option
    * [add] open quickfix using grep or vimgrep immediately
    * [add] autocmd for close window use q @plugins.toml
    * [add] Gundo.vim
    * [add] autocmd.rc.vim file
    * [add] html.vim in ftplugins
    * [ignore] cpsm matcher commented out @nvim dein
    * [rm] project.vim @nvim plugin
    * [add] set lightline error mark @nvim lightline
    * [add] lightline-ale @nvim lightline
    * [mod] modify display info @nvim lightline
    * [add] lighline x bufferline @nvim
    * [add]spellcheck use language cjk(=jp)  @.vimrc, nvim options
    * [add] F4: show markers location list @nvim
    * [add] dependency on vim-ref
    * [mod] only jshint
    * [mod] use <leader>k/j @ale jump
    * [mod] bufferline setting move to mgee/lighline-bufferline
    * [rm] delete never used plugins NeoTerm, memolist on denite
* ranger
    * [add] viewnior as image viewer @ranger.conf
* tmux
    * [mod] prefix key change from S to Space @.tmux.conf
    * [add] htop on split window @.tmux.conf

## v1.11.0: Add vim-ref, javascript completion

* zsh
    * [add] setopt correct: thefuck zsh version
    * [mod] zsh history place @.zshrc
    * [mod] .zsh_history place / yaourt use pacman instead of powerpill TEMP
    * [add] delimiter @.zshrc
    * [mod] fzf default option

* vim
    * [mod] default site change to weblio @vim-ref
    * [add] vim-ref other sources & keymaps
    * [add] repeat.vim enhance surround.vim
    * [mod] tmux-w3m search keymap <prefix>g-><prefix>n
    * [add] keymap <space>k & vim-ref comment @plugins.toml
    * [add] wildignorecase on command line completion @vimrc, nvim/options
    * [add] tmux google/man search
    * [add] vim-ref other sources {wikipedia wiktionary jquery javascript koktobank kotobankej} w3m.vim
    * [mod] ALE option use location list (default close)
    * [add] vim-ref ref-sources jsref jqapi @nvim/plugins
    * [fix] manual path
    * [fix] vim fileencoding
    * [add] for javasctipt env at neovim
    * [mod] nvim/denite config @python.toml; conda restore comman @.install/install
    * [add] neovim plugins: YankRing/vim-closetag/vim-signature @plugins.toml
    * [add] installation @README.md
    * [del] ignore tab option @.config/dein/python.toml
    * [add] defx install & example keybind @.config/dein/python.toml
    * comment out jsfain/gen_tags.vim @dein/plugins.toml
    * [add] denite keymap: denite directory_rec, directory_mru, denite help
    * [mod] Y; yank to EOL. fix for YankRing collision
    * [add] tpope/vim-unimpaied: vim keymapping
    * [add] set pyenv tags file path @nvim/options
    * [add] file encordings @vimrc, options.rc.vim

* python
    * [add] nearest_x() @ipython startup
    * [add] $PYTHONPATH in tags path of neovim
    * [mod] port number fix @jupyter notebook config
    * [mod] less(), mirror(), attribute @04_useful_func
    * [mod] pd.read_tables() function @04_useful.ipy
    * [update] conda snow yml file

* pacman / yaourt / powerpill
    * [revert] yaourt use powerpill instead of pacman @.yaourtrc
    * [fix] yaourt use powerpill (cause of fixed powerpill)

* w3m
    * [add] <C-E>, <C-Y> for down/up @w3m/keymap

* bacpac
    * [add] node-jshint, eslint, powerpill [rm] GUI xfce's @bacpac

* git
    * [add] pager use diff-so-fancy if executable
    * [mod] fetch option @.gitconfig
    * [mod] pager option use diff-so-fancy or cat @.gitconfig

* etc
    * [add] skip extensions .eps, .pdf, .aux @.globalrc


## v1.10.0: Install scripts

* .install/install
    * [mod] clone branch=master@install
    * [mod] directory check @install
    * [mod]Use double quote instead of single
    * [rm] #! @install
    * Use /usr/bin/bash @.install/install
    * release install test
    * [add]comment [rm] echo command after read_yn
    * [mod]return 0,1 [rm]recursive install
    * [mod]echo -> printf
    * echo logo, zsh if state
    * [mod]echo logo
    * [mv]functionize & zsh -> bash
    * [add]function read_yn() @.install/install.zsh
    * [submodule]bacpac update
    * [mod]clone branch devlop @install.zsh
    * auto-install dotfiles, pyenv, pacman packages
    * [add]doc: use `wget -qO -` or `curl -fsSL` @install.zsh
    * [add]if not dotfile dir, then start cloning @.install/install.zsh
    * auto download using git clone & curl
    * relogin line @.install/install.zsh
    * [mod]echo position
    * [mv].sh -> .zsh, echo end of printf
    * [add]pyenv & bacpac managed by zplug, install.sh managed by dotfile

* git
    * [add] fast-forward config @.gitconfig
    * [add]prune true: when fetching remote, then remove deleted remote repository @.gitconfig
    * [add]git submodule alias @.gitconfig
    * [mod]install scripts directory
    * [mod]Manage bacpac & pyenv in submodule
    * [merge] conflict .pyenvcr
    * [fix] @install.sh
    * [mod]install sh

* pyenv
    * [fix]pyenv path .pyenv-> pyenv
    * [fix]$PATH /usr/bin describe last for powerpill using system python
    * [fix] pyenv path
    * [mod]pyenv dir @.bashrc
    * [mod]use echo instead of printf \n
    * [fix] pyenv dir is pyenv not .pyenv
    * [add] pyenv & bacpac managed by submodules
    * [add] pyenv, bacpac
    * Revert "[rm] pyenv ignore"
    * [rm] pyenv ignore
    * pyenv path -> ~/.pyenv

* zsh
    * [add]global alias B: change backslash to slash @.zsh_aliases

* zplug
    * [add]andreafabrizi/Dropbox-Uploader: Dropbox CLI tool @.zplug.zsh

* vim
    * [add]tpope vim abolish @dein/plugins.toml
    * [mod]source fzf shell completion
    * [add]submodule add pyenv
    * [add]Up/Down key same as C-p/n @.nvim/keymap
    * [fix]denite . option@dein/python.toml, pythonpath@.pyenvrc
    * [rm]disable <C-L> keybind @.config/nvim/keymap
    * <leader>r: jedi modify variables @lazy.toml, key<9>: change markdown cell @notebook.json
    * [rm]Show line number keymap <C-l>, instead of using `se nu`
    * [add]vim-gista: Manipulating Gist alternate in Vim
    * [add] match plugin on @nvim/options
    * [add]buffer jump / tab jump @nvim/vim config
    * fix tab prekeymap @.nvim/keymap
    * [add] colorscheme, select search, open as readonly if swap exist
    * [mod]neovim option set
    * [mod] tab prekeymap 'T', buf prekeymap 'p'
    * Y: yank to end of line @nvim/keymap

* ranger
    * [fix]preview image true @ranger/rc.conf
    * [add]rifle.conf, scope.sh @.config/ranger

* python
    * [add]df.mirror: Append reverse df @.ipython startup useful func



## v1.9.0; Neovim python env
* Neovim
    * [rm]lightlinw-bufferline @.config/dein
    * [add]markdown2ctags @.config/dein/plugins.toml
    * [mod]Gtags access from only denite-gtags @neovim, dein
    * [add]Quickrun & vimproc @.config/dein/python.toml
    * [add]buffer line & buffer change keymap @.config/dein/lightline.toml&keymap.rc.vim
    * [add]Denite tab open command @.config/dein/python.toml
    * [mod]@.config/dein/lightline.toml: Display info filename & pyenv
    * [mod]small change: modify ALE prefix C-q, [rm]multihl toggle ctags
    * [add] ctags/gtags
    * [mod]jedi, quickrun, denite options modify
    * [mod]keymap window resize
    * [add]Multi highlighting use <SPACE>+m @plugins.toml
    * [mod]ALE config: disable window, shellcheck use only lint @lazy.toml
    * [mv]ale, quickrun move from python.toml to lazy.toml
    * [add]tagbar <F8> [mod] NERDTree <F5>
* Zplug
    * [mod]fzf default option add --multi @.zplug.zsh
    * [mod]depend fzf @.zplug.zsh
    * [mod]Enhancd call for `cdd` @.zplug.zsh
    * [add]fzf options @.bashrc, .zplug.zsh
    * [add]@.zplug.zsh: conda & jupyter completion
    * [add]@.zplug.zsh: conda completion as command
    * [rm]@.zplug.zsh: Remove peco
    * [mod]@.zplug.zsh: tweet.sh path
    * [add]@.zshrc: source .zshrc when installing zplug
    * [mod]@.zplug.zsh: Modify twiiter path export
    * [add]fasd aliases [rm]dublicate aliases
    * [add]@.bashrc: fasd init
* Python
    * [mod]disable pyenv activate
    * [add]@.pyenvrc: comment & modify PYTHONPATH
    * [add]@.bashrc, .gitmodules, .pyenvrc: Add pyenv as submodules
    * [mod]@.ipython: Use IPAfont
* Misc
    * [mod]smallchange
    * [add].globalrc is copied from /usr/share/gtags/globalrc
    * [add]ALE:Asynchronous Lint Engine [rm]syntastic
    * [mod]@install.sh: change shell & remove HOME .git dir
    * [add]install.sh: For deploying dotfiles
* Git
    * [rm]git diff pattern search because unconvinient for scrolling @.gitconfig
* fzf
    * [mod]FZF_DEFAULT_COMMAND is fd -IE -t f
* alias
    * alias-g F=fzf
    * [mod]recover cd alias, fzf options
    * [mod]VISUAL=nvim or vim, EDITOR=vim or vi @.bashrc
    * [mod]VISUAL is advanced editor, EDITOR is not @.bashrc
    * function
    * [rm].zsh_functions file


## v1.8.1: Tmux / Zsh / Neovim powerline theme

## ---Summary---
* tmux
    * Add
        * Show CPU usage theme custom
        * Tree view <prefix> + <C-e>
        * tmux-thempack, powerline theme
        * tmux-thempack, powerline theme
        * Add tmux-plugins/tmux-continuum
        * Add tmux-plugins/tmux-continuum
        * Add tmux-plugins/tmux-continuum
        * weather icon /mytheme.json
        * Run powerline-daemon unless powerline-daemon running
        * Run powerline when tmux start
        * Run powerline when tmux start
    * Modify
        * tmux-theme modify u1and0 fork
        * tmux-theme modify u1and0 fork
        * Modify theme pack
        * Add tmux theme
    * Add
        * Devide neovim status line setting
    * Modify
        * show file info
* .zplug.zsh
    * Add
        * Add powerline/fonts
        * Add zsh theme "agnoster" with powerline fonts
    * Modify
        * Use _pacman to powerpill completion
        * POWERLEVEL9K option move from .zshrc to .zplug.zsh
        * POWERLEVEL9K option move from .zshrc to .zplug.zsh
        * The way of load for twitter commands fixed
        * Fix white space / Remove unused aliases
* .zshrc
    * Add
        * POWERLEVEL9K command excution time
        * POWERLEVEL9K prompt add python conda env & newline
    * Modify
        * POWERLEVEL9K option move from .zshrc to .zplug.zsh
* .bash_aliases / .zsh_aliases
    * Modify
        * unalias cd "-, .., ..." / alias tree -C
        * Fix white space / Remove unused aliases
        * Change global prompt fzf fzf-tmux fzy
* .gitignore
    * Modify
        * less search pattern modify (Add fit flow features)
        * less search pattern modify (Add tag & HEAD)
        * Fix less pattern of git pager & Fix white space
        * Add diff-so-fancy again
* yaourtrc
    * Modify next app vim=>nvim, pacman=>powerpill





## v1.8.0 Neovim / Dein installed

## ---summary---
* .zshrc
* Add
    * zplug.zsh: history searching
    * autoload zmv
    * Designate 256 color
* Modify
    * Use neovim as default editor & Load bash_aliases/functions from bashrc
    * Global alias
* Remove
    * Remove auto-fu
    * Do not record history time

* .zsh_aliias
* Add
    * Add global alias "rg"
    * Global alias & Suffix alias

* nvim
* Add
    * Completion python code using jedi
    * neocomplete now customizing
    * Show unvisible character
    * Toggle line number <C-l>
    * Highlight colorline
    * Build current file use Ctrl+h
    * Add "vim-obsession" saving current vim(nvim) session in ./Session.vim
    * Inherit from .vimrc
    * Add vim-precious, context_filetype.vim <- file type change by syntax
    * Set nocompatible mode
    * Add nvim config & Install neovim
* Modify
    * **rollback keymap build script
    * Denite options
    * Build key <C-b>
    * commnand history line 10000
    * Set file type as .vim
* Remove
    * Remove set nu
    * alias vi=vim removed

* dein
* Add
    * show pyenv status @ left line
    * 52803a3 [add]@.config/dein/lazy.toml, plugins.toml: show pyenv status @ left line
    * show pyenv status @ left line
    * Completion python code using jedi
    * Deoplete options
    * vim-trailing-whitespace, indentLine
    * neocomplete now customizing
    * cpsm faster matcher
    * python indent plugin
    * Add dein-command plugin
    * NERDTree keymap <C-k><C-b>
    * Add Auto-bracket correction "jiangmiao/auto-pairs"
    * Add surround.vim
    * Add session manger plugin "tpope/vim-obsession"
    * Add Sidebar plugin "scrooloose/nerdtree"
    * Add vim-obsession
    * Add vim-multiple-cursors
    * Add lightline setting, Add vim-gutter, vim-fugitive
    * Add Neoterm
    * Add vim-precious, context filetype.vim <- file type change by syntax
* Modify
    * Modify Denite map
    * python.toml: Comment and Indent
    * Denite keymaps modify
    * Denite options
    * Commentout plugin "tomtom/tcommentvim
* w3m
* Modify
    * Close tab <C-W> twice

* bashrc
* Add
    * Same setting with bash & Set up LinuxBrew
    * Load .pyenvrc & thefuck init
* Modify
    * .zshrc:Use neovim as default editor & Load bash_aliases/functions from bashrc
    * .zshrc:Use neovim as default editor & Load bash_aliases/functions from bashrc
    * Modify linuxbrew path

* tmux.conf
* Add
    *  weather icon
    * themes/tmux/mytheme.json
    * Run powerline-daemon unless powerline-daemon running
    * Run powerline when tmux start



## v1.7.0
zsh auto-fu & twitter.sh & Excute time & history sharing / tmux.conf : save-session & paste mode / git diff-so-fancy / shell function cconv: Currency CONVersion

## ---summary---
* .zshrc
    * Add right prompt display time as yellow bold color
    * hist_save_no_dups=Do not save same command in history
    * Share .zsh_history with virtual machine , Modify .zsh_history path to .history/
    * Install twitter.sh using zplug & add path
    * global alias L=vimpager if exist
* .zplug.zsh
    * vim syntax as zsh, auto-fu makes frozen repository
    * Install twitter.sh using zplug & add path
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
* .gitconfig
    * Modify git log1 remove square bracket [] describing relative time
    * Add git diff-so-fancy
* .bash_aliases
    * alias vi=vim removed
* .bash_functions
    * cconv default $1(from)=USD $2(to)=JPY $3(amount)=1





commit d14bae739122dbf2e85199b6c7cd7e185565bf13 (tag: v1.6.0, origin/master, master)
Merge: a4f4c95 4ad668e
Author: u1and0 <e01.ando60@gmail.com>
Date:   Sun Jan 28 20:09:47 2018 +0900

    zplug auto install / tmux plugin maneger / w3m mod / vim plugin manegar

## ---summary---
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



commit a4f4c9586ec6e4d6fe83d858636fcf121cab874c (tag: v1.5.0)
Merge: 73bb9cb d4ba340
Author: u1and0 <e01.ando60@gmail.com>
Date:   Tue Jan 16 19:02:01 2018 +0900

    Merge branch 'release/v1.5.0'

## ---Summary---
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

