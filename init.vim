" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Basics
let mapleader = ','
set expandtab
set tabstop=4
set shiftwidth=4
set relativenumber
set number
set hidden
set ignorecase
set smartcase

call plug#begin('~/.vim/plugged')

" File editor
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
augroup ranger
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe 'Ranger' | endif
augroup END

fu! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
                \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu

let g:ranger_map_keys = 0
map <leader>n :Ranger<CR>

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
let g:airline_powerline_fonts = 1

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
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
    " Javascript 
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'

    " graphql
    Plug 'jparise/vim-graphql'

    " HTML
    Plug 'othree/html5.vim'

"LINT
Plug 'w0rp/ale'

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
nnoremap <silent> <leader>l :ALEFix<CR>


"AUTOCOMPLETE
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Git helpers
Plug 'airblade/vim-gitgutter'

call plug#end()

colorscheme OceanicNext

highlight ALEErrorSign ctermfg=203 ctermbg=237 guifg=#ec5f67 guibg=#343d46
