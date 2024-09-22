set nocompatible              " required
filetype off                  " required
set encoding=utf-8
set clipboard=unnamedplus     " set yanked lines into global clipboard


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'junegunn/seoul256.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'prettier/vim-prettier'
Plugin 'alvan/vim-closetag'

" Formatter
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()
" filetype plugin indent on    " required

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_config_present = 1

" Closetag
let g:closetag_filetypes = 'html,xhtml,phtml'

" HTML Formatter
augroup html_settings
    autocmd!
    
    autocmd BufNewFile,BufRead *.html set tabstop=2
    autocmd BufNewFile,BufRead *.html set softtabstop=2
    autocmd BufNewFile,BufRead *.html set shiftwidth=2
    autocmd BufNewFile,BufRead *.html set expandtab
    autocmd BufNewFile,BufRead *.html set autoindent
    autocmd BufNewFile,BufRead *.html set textwidth=80
    autocmd BufNewFile,BufRead *.html set formatoptions+=t
augroup END

" Extra functions and values
" SimpylFold
filetype plugin indent on    " Enable filetype detection and folding
let g:SimpylFold_docstring_preview=1	" Preview folded docstrings
let g:SimpylFold_fold_import = 0

" RelativeNumber
set relativenumber

" Python formatter and tabular
augroup python_settings
    autocmd!
    
    autocmd BufNewFile,BufRead *.py set tabstop=4
    autocmd BufNewFile,BufRead *.py set softtabstop=4
    autocmd BufNewFile,BufRead *.py set shiftwidth=4
    autocmd BufNewFile,BufRead *.py set textwidth=79
    autocmd BufNewFile,BufRead *.py set expandtab
    autocmd BufNewFile,BufRead *.py set autoindent
    autocmd BufNewFile,BufRead *.py set fileformat=unix
augroup END

" Change shortcuts
let mapleader = " " " map leader to Space
nnoremap <leader>w <C-w>w
nnoremap <leader>c :%y+<CR>
nnoremap <leader>s :w<CR>:PrettierAsync<CR>
nnoremap <leader>q ggVG
" yank current line into clipboard
nnoremap yy "+yy    
" yank multiple lines into clipboard
nnoremap y <Plug>(Yank-to-clipboard)
" custom mapping to yank lines into clipboard
function! YankToClipboard()
	normal! "+y
endfunction
" redifine yank call
xnoremap y :<C-U>call YankToClipboard()<CR>

" Backspace remove
set backspace=indent,eol,start

" Unified colorscheme (default: dark)
" colo seoul256

" Powerline
set laststatus=2
set noshowmode

" Gruvbox colorscheme
set background=dark
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox

" Syntaxis
let python_highlight_all=1
syntax on

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
