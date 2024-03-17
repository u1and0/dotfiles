setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal makeprg=npx\ tsc
command! -nargs=* DenoRun :sp <Bar> term deno run -qA <args> %
nnoremap <buffer> <Leader>r :DenoRun<CR>
" staticディレクトリにtsconfig.jsonがある場合
" DenoBuild -p static
command! -nargs=* DenoBuild :sp <Bar> term npx tsc <args>
nnoremap <buffer> <Leader>b :make<CR>
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
