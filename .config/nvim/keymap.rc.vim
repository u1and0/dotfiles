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

" Up/Down in command window
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Up> <C-p>
cnoremap <Down> <C-n>
