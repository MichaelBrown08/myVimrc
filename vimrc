set number
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
" Initialize plugin system
call plug#end()

let g:ale_fixers = {'javascript': ['eslint']}
 
let g:ale_fix_on_save = 1
