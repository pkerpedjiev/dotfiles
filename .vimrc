set nocompatible              " be iMproved, required
filetype plugin on
filetype off                  " required
" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
"
 Plugin 'jelera/vim-javascript-syntax'
 Plugin 'mxw/vim-jsx'
" Plugin 'pangloss/vim-javascript'
 Plugin 'nathanaelkane/vim-indent-guides'
 Plugin 'scrooloose/syntastic'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'ternjs/tern_for_vim'
 Bundle "MarcWeber/vim-addon-mw-utils"
 Bundle "tomtom/tlib_vim"
 Bundle "garbas/vim-snipmate"
 Bundle "tpope/vim-surround"
 " Optional:
 "   Bundle "honza/vim-snippets"
"  
"  " This does what it says on the tin. It will check your file on open too,
"  not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['eslint']
let g:ycm_autoclose_preview_window_after_insertion=1

" Don't only do JSX formatting on .jsx extension files
let g:jsx_ext_required = 0

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
set tabstop=4
set shiftwidth=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
set smarttab
set expandtab
set autoindent
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set undofile                    " create a file with undo history, so that it can be 
                                " performed when a file is opened after being
                                " closed
" set relativenumber              " display line numbers as relative from the cursor
set backspace=indent,eol,start
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set incsearch                   " show search matches as you type
set hlsearch                    " highlight search term
set showmatch
set wildmenu                    " make tab completion for files/buffers act like bash
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set wrap
set undolevels=1000
nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
" cnoremap <C-L> <CR>/<C-R>/
" nnoremap <C-L> <CR>/<C-R>/
cnoremap <C-L> <cr>/<up>
nnoremap <C-L> <cr>/<up>
" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" change the leader key to ","
let mapleader = ","
" nnoremap / /\v
" vnoremap / /\v
" A lot of hints found here:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" I don't want help when trying to hit escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Change the ; to act as : (duh!)
" nnoremap ; :
" reselect pasted text
nnoremap <leader>v V`]
" faster escaping to ex mode
inoremap jj <ESC>
cnoremap jj <ESC> 
" split and switch to new window
nnoremap <leader>w <C-w>v<C-w>l
syntax on
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <F5> :buffers<CR>:buffer<Space>
filetype plugin indent on
set title
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window '" . expand("%:p:~") . " - VIM'")
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
