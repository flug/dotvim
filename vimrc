"autoload plugin
"execute pathogen#infect()
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/docteurklein/php-getter-setter.vim'
Plug 'https://github.com/nono/vim-handlebars.git'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/nginx.vim'
Plug 'kien/ctrlp.vim'
Plug 'https://github.com/ivalkeen/vim-ctrlp-tjump'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'https://github.com/vim-scripts/matchit.zip'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/auto_mkdir'
Plug 'https://github.com/hallettj/jslint.vim'
Plug 'https://github.com/vim-scripts/bufkill.vim'
Plug 'brookhong/DBGPavim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'Townk/vim-autoclose'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'bling/vim-bufferline'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'Shougo/neocomplete'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'tpope/vim-ragtag'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/php.vim-html-enhanced'
Plug 'wookiehangover/jshint.vim'
Plug 'vim-scripts/PHP-correct-Indenting'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/rking/ag.vim'
Plug 'bcicen/vim-vice'
Plug 'stephpy/vim-yaml',  {'for': 'yml'}
Plug 'evidens/vim-twig'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } 
call plug#end()

" don't try to be compatible with old specs of vi
set nocompatible

" add some color
syntax on

set modelines=0
set encoding=utf-8
set scrolloff=3
set noeol
set showmode

set hidden
set visualbell
set cursorline
set ttyfast

" display line numbers relative to the current line
set relativenumber
set number
" save undo history to a file
set undofile

"""""""""""""""""""
" Color and Fonts "
"""""""""""""""""""
set t_Co=256
"set background=dark
colorscheme vice
"color "happy_hacking"
"let g:molokai_original = 1
"lef g:rehash256 = 1 

filetype plugin indent on

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.hg|\.svn|\.settings|\.sass-cache|cache|log|.rsync_cache)$',
      \ 'file': '.un\~$\|.project$\|.buildpath$\|composer.phar$',
      \ }
let g:ctrlp_working_path_mode = 2
let g:ctrlp_follow_symlinks=1
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --path-to-agignore=~/.agignore -g ""'
else
  let g:ctrlp_user_command = ['.git/', 'ack-grep -f %s']
endif
set grepprg=ag\ --ignore-dir\ cache\ --ignore-dir\ .rsync_cache\ --ignore-dir\ web/bundles\ --follow\ --smart-case

let g:ctrlp_extensions = ['tag']
"let g:neocomplcache_enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1

" ZEN coding shortcuts ;)
nmap <silent> <Leader>z :call emmet#expandAbbr(3,"")<CR>i
imap <silent> <Leader>z <Esc>h :call emmet#expandAbbr(3,"")<CR>i

" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" ctrlp configuration
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:8,results:8'

set tags+=.git/tags

" remove trailing spaces
autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx
autocmd BufNewFile,BufRead *.md,*.mkdn,*.markdown :set filetype=markdown

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

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>


function! HLNext (blinktime)
  highlight RedOnRed ctermfg=red ctermbg=red
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  echo matchlen
  let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
	\ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
	\ . '\|'
	\ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
	\ . '\|'
	\ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
  let ring = matchadd('RedOnRed', ring_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

set cc=81
hi Normal          guifg=#F8F8F2 guibg=#1C1C1C
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=233 guibg=#2c2d27
highlight CursorColumn ctermbg=233 guibg=#2c2d27
highlight CursorLine ctermbg=233 guibg=#2c2d27
highlight LineNr ctermbg=233 guibg=#2c2d27

" Vim UI {
highlight clear SignColumn      " SignColumn should match background for
" things like vim-gitgutter
" show commands at the bottom right
set showcmd
set ruler
set laststatus=2

"let g:airline_powerline_fonts = 1
"let g:airline_theme='sol'
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

set backspace=indent,eol,start
set linespace=0
set ignorecase
set smartcase
set wildmode=longest,list,full
set wildmenu
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" }

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

let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

let g:php_cs_fixer_path = "~/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
"let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.

let g:gitgutter_eager = 0 " Avoid gitgutter lag

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

:set regexpengine=1
:syntax enable
" Vim on the iPad
if &term == "xterm-ipad"
  nnoremap <Tab> <Esc>
  vnoremap <Tab> <Esc>gV
  onoremap <Tab> <Esc>
  inoremap <Tab> <Esc>`^
  inoremap <Leader><Tab> <Tab>
endif
