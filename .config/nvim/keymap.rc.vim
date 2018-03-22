" vim:ft=vim

" === Tab keymap setting ===
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
  endfor
  " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

  map <silent> [Tag]c :tablast <bar> tabnew<CR>
  " tc 新しいタブを一番右に作る
  map <silent> [Tag]x :tabclose<CR>
  " tx タブを閉じる
  map <silent> [Tag]t :tabnext<CR>
  " tn 次のタブ
  map <silent> [Tag]T :tabprevious<CR>
  " tp 前のタブ


" === Build script <C-b> ===
" autocmd BufNewFile,BufRead *.rb nnoremap <C-b> :!ruby %
" autocmd BufNewFile,BufRead *.py nnoremap <C-b> :!python %
" autocmd BufNewFile,BufRead *.pl nnoremap <C-b> :!perl %


" === Line number toggle <C-l> ===
function! Setnumber()
    if &number
        setlocal nonumber
    else
        setlocal number
    endif
endfunction
nnoremap <silent> <C-l> :call Setnumber()<CR>
