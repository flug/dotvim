"Airline

let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline_section_c='%t'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '⮀'
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = '⎇'''
let g:airline_symbols.paste = ''
let g:airline_symbols.whitespace = ''


