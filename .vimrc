" Install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source '~/.vimrc'
endif
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'scrooloose/nerdtree'
call plug#end()


" Basics
let mapleader = ','
set relativenumber
set number
" Keep buffers around
set hidden
" Better /search
set ignorecase
set smartcase
" Fix ugly split
set fillchars=""
" Highlight all search
set hlsearch
" tabs are evil 
set tabstop=2 shiftwidth=2 expandtab

" Update when changed externally
set autoread

map <leader>n :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=50


" Coc recommended
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" Splits
set splitbelow
set splitright 
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>

" Theme
set termguicolors
set background=light
colorscheme solarized8_high

nnoremap <silent> <leader>, :Files<CR>
nnoremap <silent> <leader>. :History<CR>
nnoremap <silent> <leader>p :Prettier<CR>
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

"SYNTAX
set foldlevel=99
set conceallevel=1
let g:javascript_conceal_function = "ƒ"
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window (hover types)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



