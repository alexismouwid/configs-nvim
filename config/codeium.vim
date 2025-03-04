" Activar Codeium en modo Insert
"packadd codeium
autocmd InsertEnter * CodeiumEnable

" Atajos de teclado para Codeium
inoremap <C-g> <Cmd>Codeium Accept<CR>
inoremap <M-[> <Cmd>Codeium CyclePrev<CR>
inoremap <M-]> <Cmd>Codeium CycleNext<CR>
inoremap <C-x> <Cmd>Codeium Clear<CR>
set runtimepath^=~/.vim packpath^=~/.vim
packadd codeium

" Configuración para Codeium
let g:codeium_filetypes = {
      \ 'html': v:true,
      \ 'javascript': v:true,
      \ 'css': v:true,
      \ 'lua': v:true
      \ }
 " Activar Codeium en modo Insert
 autocmd VimEnter * Codeium Enable

