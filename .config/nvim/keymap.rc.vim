" vim:ft=vim

" Tab keymap setting
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    [t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
  " [t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" [tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" [tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Build script <C-b>
" autocmd BufNewFile,BufRead *.rb nnoremap <C-b> :!ruby %
" autocmd BufNewFile,BufRead *.py nnoremap <C-b> :!python %
" autocmd BufNewFile,BufRead *.pl nnoremap <C-b> :!perl %


" Line number toggle <C-l>
function! Setnumber()
    if &number
        setlocal nonumber
    else
        setlocal number
    endif
endfunction
nnoremap <silent> <C-l> :call Setnumber()<CR>


" Leader
let mapleader = "\<Space>"


" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c<Paste>

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  5<C-w><<CR>
nnoremap <S-Right> 5<C-w>><CR>
nnoremap <S-Up>    5<C-w>-<CR>
nnoremap <S-Down>  5<C-w>+<CR>

" Yank to end of line
nnoremap Y y$
