" reset augroup
augroup MyAutoCmd
    autocmd!
    " QuickFixおよびHelpでは q でバッファを閉じる
    autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c<Paste>
    " スワップファイルがあったときは常にreadonlyで開く
    autocmd SwapExists * let v:swapchoice = 'o'
    " tags path
    autocmd BufNewFile,BufRead *.py set tags+=${PYTHONPATH}/tags
    autocmd BufNewFile,BufRead *.py set tags+=${PYENV_ROOT}/versions/miniconda3-latest/envs/snow/lib/python3.6/site-packages/tags
    " ファイルを開いたときに、カーソル位置を最後にカーソルがあった位置まで移動
    autocmd BufReadPost * :normal! g`"
    " grepしたときに自動的にquickfixウィンドウを開く
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

