call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/goyo.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'cakebaker/scss-syntax.vim'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'vim-scripts/asmx86_64'

Plug 'pangloss/vim-javascript'

Plug 'donRaphaco/neotex', { 'for': 'tex' }

Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'

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

" nvim-lsp settings
lua <<EOF
    require'nvim_lsp'.clangd.setup{}
    require'nvim_lsp'.pyls.setup{}
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Deoplete
let g:deoplete#enable_at_startup=1

