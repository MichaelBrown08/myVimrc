" Set some vim-specific settings
set number splitright splitbelow cursorline

" Vim-Plug
call plug#begin('~/.vim/plugged')
" Vim features
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'

" Code features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'tpope/vim-fugitive'
call plug#end()

"-- AUTOCOMPLETION --
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" vim-prettier ------------------------------------------------
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
" -------------------------------------------------------------

" nerdtree ----------------------------------------------------
" Autostart NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" NERDTree remaps
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" -------------------------------------------------------------

" coc nvim settings -------------------------------------------
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> go :<C-u>CocList outline<CR>
nnoremap <silent> gO :<C-u>CocList --tab outline<CR>

"-- CocFloating color change
highlight CocFloating ctermbg=4
" -------------------------------------------------------------

"-- Vim Indent Guides --
set background=dark
let g:indent_guides_enable_on_vim_startup = 1

"-- Ack.vim using Silversearcher-ag --
let g:ackprg = 'ag --nogroup --nocolor --column'

"-- New line in Normal --
nmap <CR> o<Esc>

"-- Fix for Vim opening in replace mode --
set t_u7=
set encoding=UTF-8
