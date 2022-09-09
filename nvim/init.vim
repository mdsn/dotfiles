call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  nnoremap <leader>o <cmd>Telescope find_files<cr>
  nnoremap <leader>l <cmd>Telescope buffers<cr>
  nnoremap <leader>h <cmd>Telescope oldfiles<cr>
  nnoremap <leader>r <cmd>Telescope live_grep<cr>
Plug 'ayu-theme/ayu-vim'
  " let ayucolor="light"
  let ayucolor="dark"
Plug 'feline-nvim/feline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'petertriho/nvim-scrollbar'
Plug 'lewis6991/gitsigns.nvim'
Plug 'justinmk/vim-ipmotion'
  let g:ip_skipfold=1
call plug#end()

nnoremap j gj
nnoremap k gk
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-k> <up>
nnoremap <bs> <c-^>
command! -bar SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
nnoremap <silent> <leader>n :SC<cr>
nnoremap <leader>w <c-w>
nnoremap <leader><leader> :noh<cr>
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <leader>k :tabclose<cr>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt

set number
set showmode
set confirm
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set updatetime=300

if empty("$DISPLAY")
else
  set cursorline
  set termguicolors
  colorscheme ayu
endif

" let &runtimepath .= ',~/.config/nvim/lua'
lua require('feline-setup')
lua <<EOF
require('feline').setup()
require('gitsigns').setup()
require('telescope').setup()
require('scrollbar').setup()
require('indent_blankline').setup()
EOF

augroup rust
  autocmd!
  autocmd FileType rust setlocal makeprg=cargo
  autocmd FileType rust nnoremap <F5> :make build<cr>
  autocmd FileType rust nnoremap <F6> :make check<cr>
  autocmd FileType rust nnoremap <F7> :make fmt<cr>
  autocmd FileType rust nnoremap <F8> :make run<cr>
augroup END

augroup vim
  autocmd!
  autocmd FileType vim nnoremap <buffer> <F5> :so%<cr>
  autocmd FileType vim setlocal ts=2 sw=2 expandtab
augroup END
