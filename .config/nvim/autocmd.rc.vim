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
    autocmd QuickFixCmdPost *grep* cwindow
    autocmd QuickFixCmdPost *make* cwindow
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

" LLM AI Supported C-X Completion
if executable("gpt")
    function! GPT() range
        " Get lines in the provided range
        let lines = getline(a:firstline, a:lastline)
        " Get the file type using 'set ft' command
        let question = "Using " . &ft . " " . join(lines, " ")
        echomsg "to openai: " .. question
        " Update the path to the openai script as needed
        let result = systemlist("/usr/bin/gpt -x 10 -n -m claude-3-haiku-20240307 ", question)

        " Append the result below the last line and then delete the range
        call append(a:lastline, result)
        execute(a:firstline .. "," .. a:lastline .. "delete")
    endfunction
    " :GPTコマンドとして使用
    command! -nargs=0 -range GPT <line1>,<line2>call GPT()
    " カスタム補完関数 C-X, C-U
    " fun! CompleteByGPT(findstart, base)
    " endfun
    " set completefunc=CompleteByGPT
endif
