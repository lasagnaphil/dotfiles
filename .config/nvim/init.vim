call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/goyo.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'cakebaker/scss-syntax.vim'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'vim-scripts/asmx86_64'

Plug 'pangloss/vim-javascript'

Plug 'donRaphaco/neotex', { 'for': 'tex' }

call plug#end()

" Colors
syntax on

filetype on
au BufNewFile,BufRead *.rs set filetype=rust

" set ruby compiler plugin
autocmd FileType ruby compiler ruby

" Spaces & Tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set ai
set si

" set tab spacing for ruby
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2

" set tab spacing for tex
autocmd Filetype tex setlocal tabstop=2 shiftwidth=2 softtabstop=2

" UI Config
set number
set wildmenu
set showmatch

" Display status line always
set statusline=2
set laststatus=2
set ttimeoutlen=50

" Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za

" Movement
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]

" Leader shortcuts
let mapleader = ","

" Duh.
inoremap jk <Esc>

" Better split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" More natural split opening
set splitbelow
set splitright

" Enable mouse support
set mouse=a

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" CTRL-n to toggle tree view
map <C-n> :NERDTreeTabsToggle<CR>

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" fzf.vim
map <C-p> :Files<CR>

" Neotex
let g:neotex_enabled = 2
let g:neotex_pdflatex_alternative = 'xelatex'
let g:tex_flavor = 'latex'
