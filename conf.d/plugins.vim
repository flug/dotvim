"autoload plugin
"execute pathogen#infect()
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/nono/vim-handlebars.git'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/nginx.vim'
Plug 'kien/ctrlp.vim'
Plug 'https://github.com/ivalkeen/vim-ctrlp-tjump'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'https://github.com/vim-scripts/matchit.zip'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/auto_mkdir'
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
Plug 'Shougo/neosnippet'
"Plug 'https://github.com/Shougo/neosnippet-snippets'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'tpope/vim-ragtag'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/php.vim-html-enhanced'
Plug 'https://github.com/2072/PHP-Indenting-for-VIm'
Plug 'php-vim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' } 
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
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/craigemery/vim-autotag'
Plug 'https://github.com/jelera/vim-javascript-syntax', {'for': 'js'}
Plug 'https://github.com/jiangmiao/simple-javascript-indenter', {'for': 'js'}
Plug 'https://github.com/shawncplus/phpcomplete.vim'

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } 
call plug#end()


