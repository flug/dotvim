let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|\.hg|\.svn|\.settings|\.sass-cache|cache|log|.rsync_cache)$',
      \ 'file': '.un\~$\|.project$\|.buildpath$\|composer.phar$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_nerdtree_show_hidden = 1
let g:ctrlp_use_caching = 500
let g:ctrlp_clear_cache_on_exit = 1

let g:ctrlp_cache_dir = getcwd().'/.cache/ctrlp'
let g:ctrlp_extensions = ['funky', 'sessions' , 'k' , 'tag', 'mixed', 'quickfix', 'undo', 'line', 'changes', 'cmdline', 'menu']

" ctrlp configuration
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'
let g:ctrlp_extensions = ['tag']
