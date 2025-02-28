set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set termguicolors
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set termguicolors
set sw=2
set relativenumber

set noswapfile

" Inicializa vim-plug y establece la ubicación donde se instalarán los plugins
call plug#begin('~/.local/share/nvim/plugged')

" Inspeccionador de colores
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" typing
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'dense-analysis/ale'


"IA
Plug 'jamjarlabs/vim-llm'


" Search plug
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Finaliza la sección de plugins
call plug#end()

"Seccion de personalizacion de colores de IDE
"" Usar Gruvbox como esquema de colores
set background=dark
let g:gruvbox_contrast_dark = "dark"
colorscheme gruvbox

" Establecer fondo transparente

" Evitar conflictos con Treesitter
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_selection = 0

" Asegurar que Treesitter esté habilitado
lua << EOF
require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

"Resaltado para JavaScript
highlight @keyword.javascript guifg=#fe8019
highlight @variable.javascript guifg=#FFEBB5
highlight @punctuation.bracket.javascript guifg=#FFE599
highlight @punctuation.delimiter.javascript guifg=#c0c0c0
highlight @operator.javascript guifg=#FFBE55
highlight @number.javascript guifg=#c0c0c0
highlight javaScriptReserved guifg=#83a598

" Resaltado para HTML
highlight @tag.html guifg=#d79921 gui=bold
highlight @constant.html guifg=#b2b2b2
highlight link @tag.delimiter.html Normal
highlight @tag.attribute.html guifg=#bfbfbf

" Configuración adicional
set laststatus=2
set noshowmode

" Establece el esquema de color después de call plug#end()


"Mapping
"


set shiftwidth=4
set expandtab


" Evita que Enter inserte una nueva línea si el menú de autocompletado está visible
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
nnoremap <leader>o :!xdg-open % &<CR>


let mapleader = " "
nnoremap <S-w> :w<CR>
nnoremap <S-W> :w!<CR>
nnoremap <S-q> :q<CR>
nnoremap <S-Q> :q!<CR>

" plugs
" faster scrolling
" Aumenta la velocidad del scroll con Ctrl + rueda del mouse
nnoremap <S-s> <C-d>


" run current file
nnoremap <Leader>n :!node %<cr>

" nerdtree map
nnoremap <Leader>f :NERDTree<CR>
nnoremap <silent> <S-f> :NERDTreeToggle<CR>

nnoremap <C-f> :NERDTreeFind<CR>

" tabs navigation

nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>r :tabclose<CR>

map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>

"Abrir el actual archivo html
nnoremap <Leader>k :!microsoft-edge-stable %:p<CR>

"Search fzf mapping
nnoremap <silent> <S-r> :Files<CR>

"Copia todo el texto del archivo
nnoremap <Leader>y ggVG"+y
"→ Permite pegar en modo insertar usando Ctrl + V.
inoremap <C-v> <C-r>+
"Permite pegar en el modo de comando (:) con Ctrl + V.
cnoremap <C-v> <C-r>+ COC CONFIG start
" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-b>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s)
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics


"FACILIDADES PARA LENGUAJE DE PROGRAMACION C

" COnfigurar :make para compilar cualquier programa en C
"
" Configuración para archivos C
autocmd FileType c set makeprg=gcc\ -o\ %<\ %\ -L/usr/local/lib\ -lcs50\ -Wl,-rpath,/usr/local/lib

" Mapeo para compilar y ejecutar el programa
nnoremap <leader>c :make<CR>

" Configuración para mostrar errores de compilación
autocmd FileType c set errorformat=%f:%l:%c:%m
autocmd FileType c set makeprg+=%<
" Comando personalizado para compilar y ejecutar C

command! Run make && ./%<

"atajo de teclado para comando :Run
"TERMINAL INTEGRADA DE NVIM ATAJO
" Función para alternar la terminal
function! ToggleTerminal()
    " Verifica si hay un búfer de terminal abierto
    let term_buf = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&buftype") == "terminal"')
    if !empty(term_buf)
        " Si hay un búfer de terminal abierto, ciérralo
        execute 'bd! ' . term_buf[0]
    else
        " Si no hay un búfer de terminal abierto, ábrelo en una ventana inferior con un tamaño específico
        belowright split | term
        terminal
        resize -5
    endif
endfunction

" Mapear <leader>t para alternar la terminal
nnoremap <leader>t :call ToggleTerminal()<CR>

"" Moverse entre ventanas con Shift + H, J, K, L
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l

"Al presionar "Esc" en la terminal integrada entrará en modo normal y podré desplazarmae
tnoremap <Esc> <C-\><C-n>

set swapfile
set directory=~/.local/state/nvim/swap//
autocmd VimEnter * silent! !rm -f ~/.local/state/nvim/swap/*

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


" Cargar Codeium automáticamente


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



