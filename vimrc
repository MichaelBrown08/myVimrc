set number
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Initialize plugin system
call plug#end()

let g:ale_fixers = {'javascript': ['eslint']}

let g:ale_fix_on_save = 1

" Automatically run vim-autoformat.
" https://github.com/Chiel92/vim-autoformat
au BufWrite * :Autoformat

" Autostart NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" Autoclose NERDTree if last window open
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

" NERDTree remaps
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete
