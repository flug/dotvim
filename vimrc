for vconf in split(glob($HOME.'/.vim/conf.d/*.vim'), '\n')
  exe 'source' vconf
endfor
" don't try to be compatible with old specs of vi
set nocompatible

" add some color
syntax on

set modelines=0
set encoding=utf-8
set scrolloff=3
set showmode
set hidden
set visualbell
set cursorline
set ttyfast

set expandtab     " converts tabs to spaces
set autoindent    " automatically copy indentation from previous line
set smartindent   " indents one extra level according to current syntax

" display line numbers relative to the current line
set relativenumber
set number
let g:current_dir = getcwd()
let g:projet_dir = g:current_dir.'/.vimproject'
let undodir = g:projet_dir . '/undo' 
" save undo history to a file
set undofile
"set undodir
filetype on
filetype plugin on

"""""""""""""""""""
" Color and Fonts "
"""""""""""""""""""
set t_Co=256
"set background=dark
colorscheme vice
"color "happy_hacking"
"let g:molokai_original = 1
"lef g:rehash256 = 1


augroup Fix_command_in_help_buffer
  au!
  autocmd FileType help exec 'nnoremap <buffer><silent><c-p> :<c-u>CtrlP ' . getcwd() .'<cr>'
  au FileType help exec "nnoremap <silent><buffer> q :q<CR>"
augroup END

set grepprg=ag\ --ignore-dir\ cache\ --ignore-dir\ var\ --ignore-dir\ .rsync_cache\ --ignore-dir\ web/bundles\ --follow\ --smart-case

let g:neocomplcache_enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1

" ZEN coding shortcuts ;)
nmap <silent> <Leader>z :call emmet#expandAbbr(3,"")<CR>i
imap <silent> <Leader>z <Esc>h :call emmet#expandAbbr(3,"")<CR>i
let g:user_emmet_mode='a'
" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"set tags+=.git/tags

" remove trailing spaces
autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx
autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown :set filetype=markdown
autocmd BufNewFile,BufReadPost .php_cs set filetype=php

set keywordprg=pman

" php related stuff
set makeprg=php\ -ln\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

cabbr <expr> %% expand('%:p:h')
set incsearch
set gdefault

"remap the leader to something easier to type
let mapleader = "ç"

"clear the highlighting
nnoremap <leader><space> :noh<cr>

set cc=81
hi Normal          guifg=#F8F8F2 guibg=#54564b

let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=233 guibg=#54564b
highlight CursorColumn ctermbg=233 guibg=#54564b
highlight CursorLine ctermbg=233 guibg=#54564b
highlight LineNr ctermbg=233 guibg=#54564b

" Vim UI {
highlight clear SignColumn      " SignColumn should match background for
                                " things like vim-gitgutter
" show commands at the bottom right
set showcmd
set ruler
set laststatus=2

"let g:airline_powerline_fonts = 1
"let g:airline_theme='sol'
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmode=longest,list,full
set wildmenu
    :highlight ExtraWhitespace ctermbg=red guibg=red
    :autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" }
set linespace=0
syntax enable "Enable syntax highlighting "


" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal Z
endfunction

map <silent> <F2> :call StripTrailingWhitespace()<CR>
map! <silent> <F2> :call StripTrailingWhitespace()<CR>

let g:dbgPavimBreakAtEntry = 0

let g:php_cs_fixer_path = "~/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config_file = '.php_cs'      " works only if you open vim in the root of the project
let g:php_cs_fixer_php_path = "php"             " Path to PHP
"let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                  " Return the output of command if 1, else an inline information.

let g:gitgutter_eager = 0 " Avoid gitgutter lag

nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>
map <C-n> :NERDTreeToggle<CR>
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

:command! -bang -range -nargs=1 -complete=file MoveWrite  <line1>,<line2>write<bang> <args> | <line1>,<line2>delete _
:command! -bang -range -nargs=1 -complete=file MoveAppend <line1>,<line2>write<bang> >> <args> | <line1>,<line2>delete _

" Key (re)Mappings {
" disable noob keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" @see http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim
inoremap <C-c> <Esc><Esc>

"Make moving around windows faster
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }
"====[ Open any file with a pre-existing swapfile in readonly mode "]=========

augroup NoSimultaneousEdits
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
  autocmd SwapExists * echohl ErrorMsg
  autocmd SwapExists * echo 'Duplicate edit session (readonly)'
  autocmd SwapExists * echohl None
  autocmd SwapExists * sleep 2
augroup END

set regexpengine=1
" Vim on the iPad
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
