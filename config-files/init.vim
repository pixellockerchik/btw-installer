set number
syntax on
set relativenumber
set cursorline

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

colorscheme gruvbox

nnoremap <C-b> :NERDTree <CR>
nnoremap <C-q> :q! <CR>
