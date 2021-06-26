set number
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" auto format javascript, typescript, less, scss, css, json, graphql and
" markdown files
Plug 'prettier/vim-prettier', {'do': 'npm install'}

" syntax and indentation support for just about every language
Plug 'sheerun/vim-polyglot'

" vimscript status bar
Plug 'vim-airline/vim-airline'

" file browser tab
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" visual indentation lines
Plug 'nathanaelkane/vim-indent-guides'

" conquer of completion - all things autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Initialize plugin system
call plug#end()

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

" -- DEOPLETE autocompletion --
" let g:deoplete#enable_at_startup = 1
" inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"-- Vim Prettier settings --
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" -- Vim Prettier autoformat without pragma --
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

"-- Vim Indent Guides --
set background=dark
let g:indent_guides_enable_on_vim_startup = 1

"-- Coc Settings --
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nnoremap <silent> go :<C-u>CocList outline<CR>
nnoremap <silent> gO :<C-u>CocList --tab outline<CR>

"-- New line in Normal --
nnoremap <CR> o<Esc>

"-- Fix for Vim opening in replace mode --
set t_u7=
