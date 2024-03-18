setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

command! -nargs=* DenoRun :sp <Bar> term deno run -qA <args> %
nnoremap <buffer> <Leader>r :DenoRun<CR>
" staticディレクトリにtsconfig.jsonがある場合
" DenoBuild -p static
command! TscBuild let &makeprg='npx tsc' | make
nnoremap <buffer> <Leader>b :TscBuild<CR>
"
" command! -nargs=* DenoLint :sp <Bar> term deno lint <args>
setlocal efm=%f:\ line\ %l\\,\ col\ %c\ -\ %m
command! -nargs=* DenoLint let &makeprg='deno lint --compact' | make
      " \ let &l:efm='%f:\ line\ %l\\,\ col\ %c\ -\ %m' |
" command! -nargs=* DenoLint let &makeprg='deno lint --compact' |
"     \ let &l:%f:\ line\ %l\\,\ col\ %c\ -\ %m%f:\ line\ %l\\,\ col\ %c\ -\ %m |
"     make
nnoremap <buffer> <Leader>l :DenoLint<CR>

command! -nargs=* DenoTest :sp <Bar> term deno test <args>
nnoremap <buffer> <Leader>t :DenoTest<CR>

augroup MyTypeScriptCmd
autocmd!
autocmd BufWritePost *.ts,*.js !deno fmt -q %
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
