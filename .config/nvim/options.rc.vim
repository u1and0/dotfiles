" vim:ft=vim
set nocompatible        " compatible mode off
set history=10000       " keep lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
"set nu                 " show number of line
set nobackup            " do not keep a backup file, use versions instead
"set clipboard+=autoselect " copy to clipboard in selection
set hidden              " Enable opening another file while editting a file
set ignorecase          " Search ignore case
set wildignorecase      " Command line ignore case
set smartcase           " Search ignore case if only use letter case
set display=lastline    " 長い行の表示
set pumheight=10        " 補完ウィンドウの大きさ
set modeline            " 行頭or行末にvim: set {options}を書ける
set tags=./tags

" Tab setting
set tabstop=4           " The width of a TAB is set to 4.
                        " Still it is a \t. It is just that
                        " Vim will interpret it to be having
                        " a width of 4.
set shiftwidth=4        " Indents will have a width of 4
set softtabstop=4       " Sets the number of columns for a TAB
set expandtab           " Expand TABs to spaces
set diffopt+=vertical   " Gdiffsplit always split vertical
filetype plugin indent on " filetypeによってインデント設定を変える

set nolist  " 不可視文字の表示
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" カラースキーム、文字装飾、ハイライト
colorscheme slate
set pumblend=30  " 0~100 ポップアップウィンドウの半透明化
set cursorline          " Highlight corsorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" vim default plugins
filetype plugin on

" if-else構文などをマッチ対象として%でジャンプできるようにする
runtime macros/matchit.vim


"virtualモードの時にスターで選択位置のコードを検索するようにする"
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" `:e %%`アクティブなファイルが含まれているディレクトリを手早く展開する
" :eだけでなく:wや:rでも使える。
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" `:e %_`拡張子を取り除いたファイル名を表示する
cnoremap <expr> %_ getcmdtype() == ':' ? expand('%:r') : '%_'

" file encodings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

" spell check language
set spell
set spelllang=en,cjk

" カスタム補完関数
fun! CompleteMonths(findstart, base)
    if a:findstart
        " 単語の始点を検索する
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        " "a:base" にマッチする月を探す
        let res = []
        for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
            if m =~ '^' .. a:base
                call add(res, m)
            endif
        endfor
        return res
    endif
endfun
" set completefunc=CompleteMonths

" grep program
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
