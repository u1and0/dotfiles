setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

" Leader+r でカレントファイルを実行
command! -nargs=* DenoRun :sp <Bar> term deno run -qA <args>
nnoremap <buffer> <Leader>r :DenoRun %<CR>

" Leader+b で npx tsc
" staticディレクトリにtsconfig.jsonがある場合
" DenoBuild -p static
" || src/cart.ts(54,10): error TS2339: Property 'cartAllButton' does not exist on type 'Cart'.
" setlocal efm=%+P%f(%l\,%c):\ %m
command! TscBuild setlocal efm=%f(%l\\,%c):\ %m | let &makeprg='npx tsc --pretty false' | make!
nnoremap <buffer> <Leader>b :TscBuild<CR>

" leader+l で deno lint
command! -nargs=* DenoLint setlocal efm=%f:\ line\ %l\\,\ col\ %c\ -\ %m | let &makeprg='NO_COLOR=1 deno lint --compact -q <args>' | make!
nnoremap <buffer> <Leader>l :DenoLint ##<CR>

command! -nargs=* DenoCheck setlocal efm=%f:\ line\ %l\\,\ col\ %c\ -\ %m | let &makeprg='NO_COLOR=1 deno check -q <args> ' | make!
nnoremap <buffer> <Leader>c :DenoCheck ##<CR>
" leader + t でdeno test
" command! -nargs=* DenoTest let &makeprg='deno test' | make
command! -nargs=* DenoTest :sp <Bar> term deno test -A <args>
nnoremap <buffer> <Leader>t :DenoTest<CR>

augroup MyTypeScriptCmd
autocmd!
" セーブするたびに現在ファイルをdeno fmt
autocmd BufWritePost *.ts,*.js !deno fmt -q %
" セーブするたびに現在開いているバッファ全てにdeno lint
" autocmd BufWritePost *.ts,*.js DenoLint ##
" セーブするたびに現在ファイルをdeno lint
autocmd BufWritePost *.ts,*.js DenoLint %

if executable("deno")
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
