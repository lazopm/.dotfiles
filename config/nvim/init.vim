" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Basics
let mapleader = ','
set expandtab
set shiftwidth=4
set softtabstop=4
set relativenumber
set number

call plug#begin('~/.vim/plugged')

" File tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

" Theme
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
set background=dark
let g:airline_theme='oceanicnext'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_nvim_statusline = 0
nnoremap <silent> <leader>, :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>? :History<CR>

"Javascript Syntax
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

call plug#end()

colorscheme OceanicNext
