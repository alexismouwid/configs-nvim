" Configuración para archivos C
autocmd FileType c set makeprg=gcc\ -o\ %<\ %\ -L/usr/local/lib\ -lcs50\ -Wl,-rpath,/usr/local/lib

" Mapeo para compilar y ejecutar el programa
nnoremap <leader>c :make<CR>

" Configuración para mostrar errores de compilación
autocmd FileType c set errorformat=%f:%l:%c:%m
autocmd FileType c set makeprg+=%<
" Comando personalizado para compilar y ejecutar C

command! Run make && ./%<

