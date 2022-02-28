" reset augroup
augroup MyAutoCmd
    autocmd!
    " QuickFixおよびHelpでは q でバッファを閉じる
    autocmd MyAutoCmd FileType help,qf,goterm nnoremap <buffer> q <C-w>c<Paste>
    " スワップファイルがあったときは常にreadonlyで開く
    autocmd SwapExists * let v:swapchoice = 'o'
    " ファイルを開いたときに、カーソル位置を最後にカーソルがあった位置まで移動
    autocmd BufReadPost * :normal! g`"
    " grepしたときに自動的にquickfixウィンドウを開く
    autocmd QuickFixCmdPost *grep* cwindow
    if executable('pdftotext')
        " PDFファイルを開いた時、text形式に変換してから開く
        autocmd BufRead *.pdf :enew | 0read !pdftotext -layout -nopgbrk "#" -
    endif
    " 圧縮ファイルとPDFファイルを開いた時、readonlyモードで開く
    autocmd BufRead *.zip,*.gz,*.bz2,*.xz,*.pdf setlocal readonly nolist | normal gg
        " j/kキーマップを変更
        " \| nn <buffer> j <C-E> | nn <buffer> k <C-Y>
augroup END

augroup DenoCommands
    autocmd!
    autocmd BufWrite *.ts !deno fmt -q %
    autocmd FileType *.ts nnoremap <buffer> <Leader>r :sp <Bar> term deno run -q %<CR>
augroup END

" PDFを開くコマンド
if executable('pdftotext')
    command! -complete=file -nargs=1 Pdf :ene|0r !pdftotext -nopgbrk -layout <q-args> -
endif

" MarkdownをHTMLとして保存する
if executable('pandoc')
    autocmd FileType html command! WriteHTML :w !pandoc -o %:r.html
endif

" 一時ファイルの作成と書き込み
command! TempfileEdit :edit `=tempname()`
command! TempfileWrite :write `=tempname()`
