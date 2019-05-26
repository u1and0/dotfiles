autocmd FileType arduino set
            \ makeprg=arduino-cli\ compile\ --fqbn\ arduino:avr:uno\ %:h
autocmd FileType arduino command! -nargs=*
            \ Arduino :!arduino-cli <args>
autocmd FileType arduino command!
            \ ArduinoCompile :!arduino-cli compile --fqbn arduino:avr:uno %:h
autocmd FileType arduino command!
            \ ArduinoUpload :!arduino-cli
            \ upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:h
autocmd FileType arduino command! -nargs=1
            \ ArduinoNew :!arduino-cli sketch new <args>
