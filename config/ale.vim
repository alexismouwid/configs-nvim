

" Habilitar ALE
let g:ale_enabled = 1

" Definir linters para JavaScript y TypeScript
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'css': ['stylelint'],
\   'html': ['tidy'],
\}

" Habilitar Prettier como formateador
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\}

" Aplicar formateo al guardar
let g:ale_fix_on_save = 1

" Mostrar errores y advertencias en tiempo real
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
autocmd BufWritePOst * silent! call ale#Queue(1)

