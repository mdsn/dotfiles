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
set showcmd

if has("nvim")
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/usr/bin/python3'
endif

let mapleader = "\<Space>"
nnoremap <leader>- <C-w>_
nnoremap <BS> <C-^>
nnoremap <silent> <leader>z <C-w>z
nnoremap <leader><leader> :noh<CR>
command! -bar SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
nnoremap <silent> <leader>n :SC<CR>
nnoremap <leader>' :set list!<CR>
nnoremap <silent> <leader>w :set wrap!<CR>
nnoremap <silent> <leader>d :bp\|bd#<CR>
nnoremap <leader>N :set number!<CR>

inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

nnoremap j gj
nnoremap k gk

nnoremap <leader>w <C-w>
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

  let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow
    \ --glob "!.git/*"
    \ --glob "!node_modules"
    \ --glob "!*.pyc"'
endif

syntax on

function! OnGit()
  return FugitiveHead() != ''
endfunction

function! Branch()
  if OnGit()
      return ' ' . FugitiveHead() . ' '
  else
      return ' '
endfunction

set statusline=
set statusline+=%n
set statusline+=%{Branch()}
set statusline+=%f
set statusline+=%=
set statusline+=%m%r%h%w
set statusline+=\ %p%%
set statusline+=%7L

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/src/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_OPTS = '--no-bold'
  nnoremap <leader>o :Files<CR>
  nnoremap <leader>c :Commands<CR>
  nnoremap <leader>l :Buffers<CR>
  nnoremap <leader>ñ :History<CR>
  nnoremap <leader>gl :BCommits<CR>
  nnoremap <leader>s :Rg <C-R><C-W>

  nmap <leader>t :BLines<CR>
  nmap <leader>r :Tags<CR>
  nnoremap <leader>f :call fzf#vim#tags(expand('<cword>'))<CR>

  let g:fzf_commits_log_options = '--color=always --format="%C(yellow)%h%d%C(reset) %s %C(green)%cr"'
Plug 'junegunn/limelight.vim'
  nnoremap <F10> :Limelight!!<CR>
Plug 'junegunn/goyo.vim'
  nnoremap <F9> :Goyo<CR>
  let g:goyo_height = "100%"
  let g:goyo_linenr = 1

Plug 'junegunn/vim-peekaboo'
Plug 'morhetz/gruvbox'
  let g:gruvbox_contrast_light = "soft"
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-ipmotion'
  let g:ip_skipfold = 1
Plug 'junegunn/vim-after-object'
  autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'Konfekt/FastFold'
Plug 'romainl/vim-qf'
  nmap <leader>q <Plug>QfCtoggle
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
Plug 'bfrg/vim-cpp-modern'
Plug 'xolox/vim-misc'
Plug 'vim-python/python-syntax'
  let g:python_version_2 = 1
  let g:python_highlight_all = 1

call plug#end()

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme gruvbox

augroup vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <F5> :so%<CR>
  autocmd FileType vim setlocal ts=2 sw=2 expandtab cc=80
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
    autocmd FileType python nnoremap <F7> :!isort %<CR>:redraw!<CR>
    autocmd FileType python nnoremap <F8> :!black %<CR>
augroup END

set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %tarning\ -\ %m
set errorformat+=%f:\ line\ %l\\,\ col\ %c\\,\ %trror\ -\ %m
augroup js
    autocmd!
    autocmd FileType vue,javascript syntax sync fromstart
    autocmd FileType vue,javascript setlocal ts=2 sw=2 expandtab
    autocmd FileType vue,javascript setlocal makeprg=eslint\ --format\ compact\ %
    autocmd FileType vue,javascript nnoremap <F5> :make!<CR>
augroup END

augroup rust
  autocmd!
  autocmd FileType rust nnoremap <F5> :!cargo build <CR>
  autocmd FileType rust nnoremap <F6> :!cargo check <CR>
  autocmd FileType rust nnoremap <F7> :!cargo fmt <CR>
augroup END

" vim: set sw=2 ts=2 et:
