" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Basics
let mapleader = ','
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set number
set hidden
set smartcase
autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif
tnoremap <Esc> <C-\><C-n>

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
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
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

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"UI
Plug 'Shougo/denite.nvim'

"UTILS
Plug 'tpope/vim-surround'
Plug 'Shougo/neoyank.vim'

"SYNTAX
    " Javascript 
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'

    " HTML
    Plug 'othree/html5.vim'
    " Nunjucks/Jinja
    Plug 'Glench/Vim-Jinja2-Syntax'
    au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.nunj set ft=jinja

"LINT
Plug 'w0rp/ale'

let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
nnoremap <silent> <leader>l :ALEFix<CR>


"AUTOCOMPLETE
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
let g:deoplete#enable_at_startup = 1
let g:tern_request_timeout = 0.25 
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
set completeopt-=preview
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>


" Git helpers
Plug 'airblade/vim-gitgutter'

call plug#end()

colorscheme OceanicNext

call denite#custom#map(
    \ 'insert',
    \ '<C-j>',
    \ '<denite:move_to_next_line>',
    \ 'noremap'
    \)
call denite#custom#map(
    \ 'insert',
    \ '<C-k>',
    \ '<denite:move_to_previous_line>',
    \ 'noremap'
    \)

highlight ALEErrorSign ctermfg=203 ctermbg=237 guifg=#ec5f67 guibg=#343d46
