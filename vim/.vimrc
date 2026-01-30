" ===== basics =====
set nocompatible
set number
set relativenumber
set hidden
set mouse=a
set clipboard=unnamedplus
set updatetime=300
set signcolumn=yes
syntax on
filetype plugin indent on

" Faster key-sequence timeouts (reduces “laggy” feel)
set timeoutlen=300
set ttimeoutlen=10

" Leader key
let mapleader=" "

" ===== vim-plug =====
call plug#begin('~/.vim/plugged')

" LSP + completion + diagnostics
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" ===== coc keybinds =====
" Go to definition
nmap gd <Plug>(coc-definition)
" Hover docs
nmap K :call CocActionAsync('doHover')<CR>
" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format buffer
" nmap <leader>f :call CocAction('format')<CR>

nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>


" Use Tab for completion menu
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

