" nerdtree map
nnoremap <silent> <S-f> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Configuración para NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Cerrar NERDTree si es el único buffer abierto
autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") | quit | endif


