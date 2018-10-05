" vim: sw=2 ts=2 et:

set scrolloff=1
set number
set isfname+=32
set nojoinspaces
set showmode
set confirm
set history=1000
set viewoptions=folds,options,cursor,unix,slash
set foldenable
set hidden
set noautochdir
set laststatus=2
set autoread
set foldcolumn=1
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.pyc
set hlsearch
set cursorline
set ignorecase
set undolevels=1000
set backup
set backupdir=~/tmp
set directory=~/tmp
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set breakindent
set showbreak=..
set linebreak
set t_md=
set colorcolumn=80

let mapleader = "\<Space>"
nnoremap ñ :
nnoremap Ñ :
nnoremap <leader>- <C-w>_
nnoremap <leader>q q:
nnoremap <BS> <C-^>
nnoremap <silent> <leader>z <C-w>z
nnoremap <leader><leader> :noh<CR>
command! -bar SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
nnoremap <silent> <leader>n :SC<CR>
nnoremap <leader>w :set list!<CR>
nnoremap <silent> <leader>r :set wrap!<CR>
nnoremap <silent> <leader>d :bp\|bd#<CR>
nnoremap <leader>n :set number!<CR>

inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

nnoremap j gj
nnoremap k gk

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <leader>m :tab split<CR>
nnoremap <leader>k :tabclose<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading "$*"
  set grepformat=%f:%l:%c:%m

  " let $FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob \"!.git/*\""
endif


syntax on

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/src/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  nnoremap <leader>o :Files<CR>
  nnoremap <leader>l :Buffers<CR>
  nnoremap <leader>ñ :History<CR>
Plug 'junegunn/goyo.vim'
  nnoremap <F11> :Goyo<CR>
  let g:goyo_height = 100
  let g:goyo_linenr = 1

  function! s:goyo_enter()
    silent !tmux set status off
    set scrolloff=999
    set colorcolumn=80
  endfunction

  function! s:goyo_leave()
    silent !tmux set status on
    set scrolloff=1
  endfunction

  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()

Plug 'junegunn/limelight.vim'
  nnoremap <F10> :Limelight!!<CR>

Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_light = "soft"
Plug 'jacoborus/tender.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
  nnoremap <F12> :Gblame!<CR>
Plug 'justinmk/vim-ipmotion'
  let g:ip_skipfold = 1
Plug 'Konfekt/FastFold'
Plug 'romainl/vim-qf'
  nmap Q <Plug>QfCtoggle
  nmap <C-q> <Plug>QfLtoggle
  nmap Ç <Plug>QfSwitch
  nmap <Home> <Plug>QfCprevious
  nmap <End> <Plug>QfCnext
  nmap <C-Home> <Plug>QfLprevious
  nmap <C-End> <Plug>QfLnext
  let g:qf_mapping_ack_style = 1
  let g:qf_auto_quit = 0
  let g:qf_max_height = 3
  let g:qf_auto_open_quickfix = 0
  augroup quickfix
      autocmd!
      autocmd FileType qf setlocal wrap nonumber
  augroup END

 Plug 'posva/vim-vue'
call plug#end()

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme gruvbox

augroup vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <F5> :so%<CR>
augroup END

augroup cpp
    autocmd!
    autocmd FileType c,cpp,d nnoremap <F5> :make!<CR>
    autocmd FileType c,cpp,d nnoremap <leader>/ f;
    autocmd FileType c,cpp,d setlocal ts=4 sw=4 expandtab breakindent sbr=.. linebreak
augroup END

augroup py
    autocmd!
    autocmd FileType python setlocal cc=80 ts=4 sw=4 expandtab
augroup END

augroup vue
    autocmd!
    autocmd FileType vue,javascript syntax sync fromstart
    autocmd FileType vue,javascript setlocal ts=2 sw=2 expandtab
augroup END

augroup rust
  set colorcolumn=100
  autocmd!
  autocmd FileType rust nnoremap <F5> :!cargo build <CR>
  autocmd FileType rust nnoremap <F6> :!cargo check <CR>
  autocmd FileType rust nnoremap <F7> :!cargo fmt <CR>
augroup END
