" reset augroup
augroup MyAutoCmd
    autocmd!
    " QuickFixおよびHelpでは q でバッファを閉じる
    autocmd MyAutoCmd FileType help,qf,goterm nnoremap <buffer> q <C-w>c<Paste>
    " スワップファイルがあったときは常にreadonlyで開く
    autocmd SwapExists * let v:swapchoice = 'o'
    " ファイルを開いたときに、カーソル位置を最後にカーソルがあった位置まで移動
    autocmd BufReadPost FileType !fugitive :normal! g`"
    " grepしたときに自動的にquickfixウィンドウを開く
    autocmd QuickFixCmdPost *grep* copen
    autocmd QuickFixCmdPost *make* copen
    if executable('pdftotext')
        " PDFファイルを開いた時、text形式に変換してから開く
        autocmd BufRead *.pdf :enew | 0read !pdftotext -layout -nopgbrk "#" -
    endif
    " 圧縮ファイルとPDFファイルを開いた時、readonlyモードで開く
    autocmd BufRead *.zip,*.gz,*.bz2,*.xz,*.pdf setlocal readonly nolist | normal gg
        " j/kキーマップを変更
        " \| nn <buffer> j <C-E> | nn <buffer> k <C-Y>
    " autocmd FileType python nnoremap <buffer> <Leader>r :sp <Bar> term python %<CR>
    autocmd BufNewFile,BufRead *.py command! -nargs=* PythonRun :sp <Bar> term python <args> %
    autocmd BufNewFile,BufRead *.py noremap <buffer> <Leader>r :PythonRun<CR>
    autocmd BufNewFile,BufRead *.ts,*.js,*.html,*.tmpl setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup TransparentBG
  	autocmd!
	autocmd Colorscheme * highlight Normal ctermbg=none
	autocmd Colorscheme * highlight NonText ctermbg=none
	autocmd Colorscheme * highlight LineNr ctermbg=none
	autocmd Colorscheme * highlight Folded ctermbg=none
	autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
augroup END

if executable("nim")
    augroup MyNimCmd
        autocmd BufNewFile,BufRead *.nim,*.nimble set filetype=nim
        autocmd BufWritePost *.nim,*.nimble !nimpretty %
    augroup END
endif

" PDFを開くコマンド
if executable('pdftotext')
    command! -complete=file -nargs=1 Pdf :ene|0r !pdftotext -nopgbrk -layout <q-args> -
endif

" MarkdownをHTMLとして保存する
if executable('pandoc')
    autocmd FileType markdown command! WriteHTML :w !pandoc -o %:r.html
    autocmd FileType markdown,tex,plaintex command! -range MarkdownToTeX :<line1>,<line2>!pandoc -f markdown -t latex
endif

" Growi API
if executable('growiapi')
    command! -nargs=1 GrowiGet :0r !growiapi get <q-args>
    command! -nargs=+ -complete=file GrowiCreate :w !growiapi create <args>
    command! -nargs=+ -complete=file GrowiUpdate :w !growiapi update <args>
    command! -nargs=+ -complete=file GrowiPost :w !growiapi post <args>
endif

" 一時ファイルの作成と書き込み
command! TempfileEdit :edit `=tempname()`
command! TempfileWrite :write `=tempname()`

" skkeleton config
function! s:skkeleton_init() abort
  call skkeleton#config({
    \ 'eggLikeNewline': v:true,
    \ 'globalDictionaries' : [[ '~/.local/share/dein/repos/github.com/skk-dev/dict/SKK-JISYO.L', 'euc-jp' ]],
    \ })
  " call skkeleton#register_keymap('henkan', "\<BS>", 'henkanForward')
  " call skkeleton#register_kanatable('rom', {
  "   \ 'z\<Space>': ['\u3000', ''],
  "   \ })
endfunction

augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END

