command! -nargs=* NimRun :sp <Bar> term nim c -r <args> %
command! -nargs=* NimBuild :sp <Bar> term nim c <args> %
command! -nargs=* NimBuildLib :!nim c --tlsEmulation:off --app:lib --out:%:t:r.so <args> %
command! -nargs=* NimTest :sp <Bar> term testament pattern <args> 'tests/*.nim'
nnoremap <buffer> <Leader>r :NimRun<CR>
nnoremap <buffer> <Leader>b :NimBuild<CR>
nnoremap <buffer> <Leader>t :NimTest<CR>
