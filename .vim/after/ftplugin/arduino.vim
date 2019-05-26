" Args
let port = "/dev/ttyACM0"
let fqbn = "arduino:avr:uno"

" Autocmd
"
" `:make` use `!arduono-cli compile` command
autocmd FileType arduino set
            \ makeprg=arduino-cli\ compile\ --fqbn\ arduino:avr:uno\ %:h
" Arduino: Whole `arduino-cli` command
autocmd FileType arduino command! -nargs=* Arduino
            \ :!arduino-cli <args>
" ArduinoCompile: compile core designated FQBN
autocmd FileType arduino command! ArduinoCompile
            \ exe "!arduino-cli compile --fqbn " . fqbn . " %:h"
" ArduinoUpload: upload to port
autocmd FileType arduino command! ArduinoUpload
            \ exe ":!arduino-cli upload -p " . port . " --fqbn " . fqbn . " %:h"
" ArduinoNew: make new directory and new ino file
autocmd FileType arduino command! -nargs=1 ArduinoNew
            \ :!arduino-cli sketch new <args>

" Keymap
nnoremap <buffer> <leader>ac :make<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
