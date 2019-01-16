" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if &compatible
    set nocompatible
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup        " do not keep a backup file, use versions instead
" else
"   set backup      " do not keep a backup file, use versions instead keep a backup file
" endif
set history=100     " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
" set nu              " show number of line
set noswapfile      " never make swap files
set nobackup        " do not keep a backup file, use versions instead
set clipboard+=autoselect " copy to clipboard in selection
set hidden          " Enable opening another file while editting a file
set ignorecase      " Search ignore case
set wildignorecase  " Command line ignore case
set smartcase       " Search ignore case if only use letter case
set wildmenu        " コマンドライン上Tab補完
set wildmode=full
set spelllang=en,cjk " spell check language

" Tab setting
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" file encodings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" --- Keymap ---
" Up/Down in command window
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Up> <C-p>
cnoremap <Down> <C-n>

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  5<C-w><<CR>
nnoremap <S-Right> 5<C-w>><CR>
nnoremap <S-Up>    5<C-w>-<CR>
nnoremap <S-Down>  5<C-w>+<CR>
"
" `:e %%`アクティブなファイルが含まれているディレクトリを手早く展開する
" :eだけでなく:wや:rでも使える。
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Yank to end of line
nnoremap Y y$


" --- Plugins manage ---
" === Dein ===
" Add the dein installation directory into runtimepath
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME


" {{{ dein
let s:dein_dir = expand('$DATA/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state('$DATA/dein')
    call dein#begin('$DATA/dein')

    call dein#add('$DATA/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('vim-jp/vimdoc-ja')
    call dein#add('tomtom/tcomment_vim')       " Commentout plugin use 'Ctrl+/(C-_)'
    call dein#add('tpope/vim-surround')        " Select then 'S'
    call dein#add('tpope/vim-unimpaired')      " Add jump keybinds like ]b => :bn
    call dein#add('tpope/vim-repeat', {
                \ 'depends': ['vim-surround'],
                \ 'lazy': 1,
                \ })                  " Repeat surroud.vim
    call dein#add('jiangmiao/auto-pairs' , {
                \ 'on_event': 'InsertEnter',
                \ 'lazy': 1,
                \ })      " Auto-bracket correction
                " Insertモードになったとき読み込まれるはず。うまく行かない
    call dein#add('yuta-masano/hz_ja.vim', {
                \ 'on_event': 'CmdlineEnter',
                \ 'lazy': 1,
                \ })     " :Zenkaku <--> :Hankaku
    call dein#add('kshenoy/vim-signature', {
                \ 'hook_add': 'nnoremap <silent> <F3> :SignatureToggle<CR>',
                \ })                           " Place, toggle and display marks.
    call dein#add('scrooloose/nerdtree', {
                \ 'hook_add': 'nnoremap <silent> <F5> :NERDTreeToggle<CR>',
                \ })                           " Filer
    " call dein#add('majutsushi/tagbar', {
    "             \ 'hook_add': 'nnoremap <silent> <F8> :TagbarToggle<CR>'
    "             \ })                           " A class outline viewer for Vim
    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}


filetype plugin indent on
syntax enable

" " ===NeoBundle===
" "if has('vim_starting')
" "   set runtimepath+=~/.vim/bundle/neobundle.vim
" "   call neobundle#rc(expand('~/.vim/bundle'))
" "endif
" if has('vim_starting')
"     set runtimepath+=~/.vim/bundle/neobundle.vim
"     call neobundle#begin(expand('~/.vim/bundle/'))
"         NeoBundleFetch 'Shougo/neobundle.vim'
"
"         filetype plugin indent on
"
"         " Multiple Comment out
"         NeoBundle "tyru/caw.vim.git", 'master'
"
"         " caw:hatpos:toggle
"         nmap <C-K> <Plug>(caw:hatpos:toggle)
"         vmap <C-K> <Plug>(caw:hatpos:toggle)
"
"         " Multi-cursol
"         NeoBundle 'terryma/vim-multiple-cursors'
"
"         " vim Japanese man
"         " It takes long time to download
"         NeoBundle 'vim-jp/vimdoc-ja'
"
"         " Session saveing
"         NeoBundle 'tpope/vim-obsession'
"
"         " pairs of handy bracket mappings http://www.vim.org/scripts/script.php
"         NeoBundle 'tpope/vim-unimpaired'
"
"         " Auto-bracket correction
"         NeoBundle 'jiangmiao/auto-pairs'
"
"     call neobundle#end()
" endif
"
" " vim起動時に未インストールのプラグインをインストールする
" NeoBundleCheck
