"autoload plugin
execute pathogen#infect()

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
set number
" display line numbers relative to the current line
set relativenumber

" save undo history to a file
set undofile

colorscheme molokai
let g:solarized_termtrans=1
let g:solarized_contrast="hight"
let g:solarized_visibility="hight"

set background=dark
filetype on
filetype plugin on

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|\.hg|\.svn|\.settings|\.sass-cache|cache|log|.rsync_cache)$',
  \ 'file': '.un\~$\|.project$\|.buildpath$\|composer.phar$',
  \ }
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_user_command = ['.git/', 'ack-grep -f %s']
let g:ctrlp_extensions = ['tag']

set tags+=.git/tags
" remove trailing spaces
autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh,js,md autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx

set grepprg=ack-grep\ --ignore-dir\ cache\ --ignore-dir\ .rsync_cache\ --follow\ --smart-case

set keywordprg=pman

" php related stuff
set makeprg=php\ -ln\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

cabbr <expr> %% expand('%:p:h')
set incsearch
set gdefault

"clear the highlighting
nnoremap <leader><space> :noh<cr>
set cc=81

" Vim UI {
    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter
    " show commands at the bottom right
    set showcmd
    set ruler
    set laststatus=2

    let g:airline_powerline_fonts = 1
    let g:airline_theme='laederon'
    set backspace=indent,eol,start
    set ignorecase
    set smartcase
    set wildmode=longest,list,full
    set wildmenu
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace "
" }

let g:dbgPavimPort = 9000
let g:dbgPavimBreakAtEntry = 0

let g:php_cs_fixer_path = "~/bin/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.

let g:gitgutter_eager = 0 " Avoid gitgutter lag

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


  "Make moving around windows faster
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Wrapped lines goes down/up to next row, rather than next line in file.
  noremap j gj
  noremap k gk
" }

set t_Co=256
set shiftwidth=2
map <C-n> :NERDTreeToggle<CR>
" Neocomplete configuration { 
  let g:neocomplete#enable_at_startup = 1
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()
" }
