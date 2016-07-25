syntax on

"Show statusbar
set laststatus=2

"===========================================================================
"			VUNDLE CONFIGURATION
"===========================================================================
"---------------------------------------------------------------------------
" Added for Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" Vundle configruation begins
call vundle#begin()

"-------------------------------- Plugin list ------------------------------
" refer this link to solve the git issue:
" http://www.archivum.info/ubuntu-bugs@lists.ubuntu.com/2013-09/12932/(Bug-1111882)-Re-GnuTLS-recv-error-(-9)-A-TLS-packet-with-unexpected-length-was-received.html

" let Vundle manage Vundle, required
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'
" Airline
" git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline 
Plugin 'vim-airline/vim-airline'
" NERTTree
" git clone https://github.com/scrooloose/nerdtred.git ~/.vim/bundle/nerdtree 
Plugin 'scrooloose/nerdtree'
" git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim 
Plugin 'kien/ctrlp.vim'
" git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
" This bundle provides syntax highlighting and improved indentation.
Plugin 'pangloss/vim-javascript'
" git clone https://github.com/joukevandermaas/vim-ember-hbs.git ~/.vim/bundle/vim-ember-hgs
Plugin 'joukevandermaas/vim-ember-hbs'
" git clone https://github.com/jistr/vim-nerdtree-tabs.git ~/.vim/bundle/vim-nerdtree-tabs
Plugin 'jistr/vim-nerdtree-tabs'
" git clone git://github.com/altercation/vim-colors-solarized.git 
Plugin 'altercation/vim-colors-solarized'

"---------------------------------------------------------------------------
" Vundle configruation ends
call vundle#end()
filetype plugin indent on    " required

"===========================================================================
"			CTRLP CONFIGURATION
"===========================================================================
" First set up patterns to ignore
let g:ctrlp_map = '<c-p>'
" Open CTRL+P to search MRU (most recently used), files and buffers
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = ''

" Ignore these files/folders
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Ignore these folders
set wildignore+=*/out/**
set wildignore+=*/vendor/**
set wildignore+=*/tmp/*,*.so,*/node_modules,*.swp,*.zip

" Make CTRL+P only look for filenames by default
" let g:ctrlp_by_filename = '1'

"""""""""  CTRL+P Mappings """""""""
" Make CTRL+B open buffers
nnoremap <C-b> :CtrlPBuffer<CR>
" Make CTRL+F open Most Recently Used files
nnoremap <C-f> :CtrlPMRU<CR>
" Open files in a new tab
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

"===========================================================================
"			AIRLINE CONFIGURATION
"===========================================================================
let g:airline#extensions#tabline#enabled = 1



"===========================================================================
"			NERDTree CONFIGURATION
"===========================================================================
" Open at startup and move the cursor to main window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Always open the navigation tree
autocmd BufWinEnter * NERDTreeTabsOpen

" Workaround for Alt key combination
execute "set <M-m>=\em"
" Delete the buffer
nnoremap <M-m> :bd<CR>
" Switch tabs; the last command <C-w>l is to move the focus to file window
execute "set <M-n>=\en"
nnoremap <M-n> :tabn<CR><C-w>l
execute "set <M-b>=\eb"
nnoremap <M-b> :tabp<CR><C-w>l
execute "set <M-;>=\e;"
nnoremap <M-;> <C-w><C-w>

" Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind=1

" Ignore case while search
"===========================================================================
"			VIM-JAVASCRIPT CONFIGURATION
"===========================================================================
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1


"===========================================================================
"			MISC CONFIGURATION
"===========================================================================
" Function to trim trailing whitespace on save {{{
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

"autocmd BufWritePre *.vimrc *.html *.scss *.js :call TrimWhiteSpace()
autocmd FileType html,vimrc,scss,css,js autocmd BufWritePre <buffer> :call TrimWhiteSpace()

" Highlight redundant whitespaces and tabs. Only shows trailing whitespace :)
" highlight RedundantSpaces ctermbg=red
" match RedundantSpaces /\s\+$/

" Integrate the mouse
set mouse=a

" Don't apply indent while paste
" When you enable the below the 'vim-javascript' auto identation won't work
" set paste
 
" Set tab width
:set tabstop=4
" Required to do autoindent properly when apply the command gg=G (Auto indend for the whole file)
:set shiftwidth=4 
 
" Ignore case while search
:set ignorecase
 
" Show line number
:set number
" No text wrp
:set nowrap
 
" Solarized theme setting
" syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

