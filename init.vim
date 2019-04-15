" Autoinstall vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Basics
let mapleader = ','
set tabstop=4 shiftwidth=4 expandtab
set relativenumber
set number
" Keep buffers around
set hidden 
" Better /search
set ignorecase
set smartcase

call plug#begin('~/.vim/plugged')

" File explorer 
" let g:netrw_banner = 0

" Theme
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
set background=dark
let g:airline_theme='oceanicnext'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
let g:tmuxline_powerline_separators = 0
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
Plug 'edkolev/tmuxline.vim'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
let g:fzf_nvim_statusline = 0
nnoremap <silent> <leader>, :GFiles<CR>
nnoremap <silent> <leader>< :GFiles?<CR>
nnoremap <silent> <leader>. :History<CR>
nnoremap <silent> <leader>> :Buffers<CR>
nnoremap <silent> <leader>/ :Lines<CR>

"UTILS
Plug 'tpope/vim-surround'

"SYNTAX
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

"LINT
Plug 'w0rp/ale'
let b:ale_fixers = ['prettier', 'eslint']
let b:ale_linters = ['eslint']
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_fix_on_save = 1


"AUTOCOMPLETE
" A dependency of 'ncm2'.
Plug 'roxma/nvim-yarp'
" v2 of the nvim-completion-manager.
Plug 'ncm2/ncm2'
" LanguageServer client for NeoVim.
Plug 'autozimu/LanguageClient-neovim'
" enable it for all buffers
autocmd BufEnter  *  call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['flow', 'lsp']
  \ }
Plug 'ncm2/ncm2-bufword'

" GIT
Plug 'mhinz/vim-signify'

call plug#end()

colorscheme OceanicNext

highlight ALEErrorSign ctermfg=203 ctermbg=237 guifg=#ec5f67 guibg=#343d46
