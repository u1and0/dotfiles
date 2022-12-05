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
    " autocmd FileType python nnoremap <buffer> <Leader>r :sp <Bar> term python %<CR>
    autocmd BufNewFile,BufRead *.py command! -nargs=* PythonRun :sp <Bar> term python <args> %
    autocmd BufNewFile,BufRead *.py noremap <buffer> <Leader>r :PythonRun<CR>
    autocmd BufNewFile,BufRead *.ts,*.js,*.html,*.tmpl setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

if executable("nim")
    augroup MyNimCmd
        autocmd BufNewFile,BufRead *.nim,*.nimble set filetype=nim
        autocmd BufWritePost *.nim,*.nimble !nimpretty %
        autocmd FileType nim command! -nargs=* NimRun :sp <Bar> term nim c -r <args> %
        autocmd FileType nim command! -nargs=* NimBuild :sp <Bar> term nim c <args> %
        autocmd FileType nim command! -nargs=* NimBuildLib :!nim c --tlsEmulation:off --app:lib --out:%:t:r.so <args> %
        autocmd FileType nim command! -nargs=* NimTest :sp <Bar> term testament pattern <args> 'tests/*.nim'
        autocmd FileType nim nnoremap <buffer> <Leader>r :NimRun<CR>
        autocmd FileType nim nnoremap <buffer> <Leader>b :NimBuild<CR>
        autocmd FileType nim nnoremap <buffer> <Leader>t :NimTest<CR>
    augroup END
endif

augroup MyTypeScriptCmd
autocmd!
autocmd BufWritePost *.ts,*.js !deno fmt -q %
autocmd FileType typescript nnoremap <buffer> <Leader>r :sp <Bar> term deno run -q %<CR>
autocmd FileType typescript nnoremap <buffer> <Leader>b :sp <Bar> term npx tsc <CR>
autocmd FileType typescript colorscheme pablo
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
    autocmd FileType markdown command! -nargs=1 GrowiGet :0r !growiapi get <q-args>
    autocmd FileType markdown command! -nargs=+ -complete=file GrowiCreate :w !growiapi create <args>
    autocmd FileType markdown command! -nargs=+ -complete=file GrowiUpdate :w !growiapi update <args>
    autocmd FileType markdown command! -nargs=+ -complete=file GrowiPost :w !growiapi post <args>
endif

" 一時ファイルの作成と書き込み
command! TempfileEdit :edit `=tempname()`
command! TempfileWrite :write `=tempname()`
