
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

