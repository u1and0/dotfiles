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
    if executable('pdftotext')
        " PDFファイルを開いた時、text形式に変換してから開く
        autocmd BufRead *.pdf :enew | 0read !pdftotext -layout -nopgbrk "#" -
    endif
    " 圧縮ファイルとPDFファイルを開いた時、readonlyモードで開く
    autocmd BufRead *.zip,*.gz,*.bz2,*.xz,*.pdf setlocal readonly nolist | normal gg
        " j/kキーマップを変更
        " \| nn <buffer> j <C-E> | nn <buffer> k <C-Y>
    autocmd FileType python nnoremap <buffer> <Leader>r :sp <CR> :term python %<CR>
    autocmd BufNewFile,BufRead *.ts,*.js,*.html,*.tmpl setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.nim,*.nimble set filetype=nim
augroup END

if executable("deno")
  augroup LspTypeScript
    autocmd!
    autocmd BufWrite *.ts !deno fmt -q %
    autocmd FileType *.ts nnoremap <buffer> <Leader>r :sp <Bar> term deno run -q %<CR>
    autocmd User lsp_setup call lsp#register_server({
    \ "name": "deno lsp",
    \ "cmd": {server_info -> ["deno", "lsp"]},
    \ "root_uri": {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), "tsconfig.json"))},
    \ "allowlist": ["typescript", "typescript.tsx"],
    \ "initialization_options": {
    \     "enable": v:true,
    \     "lint": v:true,
    \     "unstable": v:true,
    \   },
    \ })
  augroup END
endif

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
