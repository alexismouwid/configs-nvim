
" Habilitar ALE
let g:ale_enabled = 1

" Definir linters para JavaScript y TypeScript
let g:ale_linters = {
\   'javascript': [],
\   'typescript': [],
\   'css': [],
\   'html': [],
\}

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier']
\}
let g:ale_fix_on_save = 1

let g:ale_javascript_prettier_use_global = 1

" Desactivar errores y advertencias en tiempo real
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_linters_ignore = {'javascript': ['eslint'], 'javascriptreact': ['eslint']}
let g:ale_linters = {}
let g:ale_echo_cursor = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_virtualtext_cursor = 'disabled'



