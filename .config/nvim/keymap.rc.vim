" vim:ft=vim

" Leader
let mapleader = "\<Space>"


" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  5<C-w><<CR>
nnoremap <S-Right> 5<C-w>><CR>
nnoremap <S-Up>    5<C-w>-<CR>
nnoremap <S-Down>  5<C-w>+<CR>

" Yank to end of line
nnoremap Y y$

" Always Virtual Replace Mode
nnoremap R gR
" 仮想置換モード		*vreplace-mode* *Virtual-Replace-mode*
" 仮想置換モードは置換モードに良く似ているが、ファイルの実際の文字ごとにではな
" く、スクリーン上の文字幅単位で置換することができ、そのためファイル内の他の文字
" の見た目の位置が移動することはない。

" Up/Down in command window
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Up> <C-p>
cnoremap <Down> <C-n>

" quickfix window操作系
" 副作用: <C-q> ビジュアル矩形選択が使えなくなる
" <C-o>で前 <C-i>で後に行くkeymapのquickfix版
nmap <C-q> <Nop>
" <C-o>で前 に行くkeymapのquickfix版
nnoremap <C-q><C-o> :cold<CR>
" <C-n>で後に行くkeymapのquickfix版
" <C-p>だとdockerのログアウトとかぶる
nnoremap <C-q><C-n> :cnew<CR>

" vim grep faster
nnoremap <leader>/ :vimgrep//%<CR>
nnoremap <leader>? :execute "grep " . shellescape(@/) . " "<CR>

" vim - shell 通信用バッファ
imap <leader><leader>p <ESC>:read ${HOME}/.vim/bf<CR>i
" leaderがSpaceなのでleader1つだと、Space-Pがペーストになってしまう
nmap <leader>p :read ${HOME}/.vim/bf<CR>
" vmap <C-b> :w!${HOME}/.vim/bf<CR> の改良↓
augroup MyBuf
    autocmd!
    autocmd TextYankPost * call writefile(v:event.regcontents, $HOME . "/.vim/bf")
augroup END

" 現在行をshell scriptとして実行
vnoremap <Leader><CR> :!${SHELL}<CR>
nnoremap <Leader><CR> V:!${SHELL}<CR>

" ターミナルを開く
nnoremap <Leader>z :new <Bar> term /usr/bin/zsh<CR>
