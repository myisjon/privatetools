"必须要在家目录下面存在 .vim文件夹
" Make Vim more useful
set nocompatible
set autoindent
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/
set directory=~/.vim/
if exists("&undodir")
    set undodir=~/.vim/
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
"set cursorline
set shiftwidth=4        " 自动缩进宽度
"set softtabstop         " 敲入tab键时实际占有的列数
set tabstop=4           " tab等同的空格数量
set expandtab           " 使用空格代替tab键

" Show “invisible” characters
set lcs=tab:▸-,trail:.,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
"set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader><leader>s :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
noremap <leader><leader>u :!dos2unix %<CR>L
noremap <leader>p :cprev<CR>
noremap <leader>n :cnext<CR>
"toggle .c/.h
noremap <leader>a :A<CR>
noremap <leader>m :w<CR>:make<CR><CR>
imap <C-l> <C-o>:w<CR>
noremap <C-l> :w<CR>

" 撤销条数
set undolevels=10000

set nocompatible              " be iMproved, required
filetype off                  " required
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'gmarik/Vundle.vim'
"Plugin 'a.vim'
"call vundle#end()            " required
filetype plugin indent on    " required

"跳到上次文件打开的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" 开启paste模式
set pastetoggle=<f5>
"80 column tag
set cc=119

" 去掉行尾为空格
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" 高亮显示行末空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" 添加vim-plug
call plug#begin('~/.vim/plugged')


" 配置vim-plug; url: https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/.vim/vim_plug_update'

" Initialize plugin system

" set python autocomplete
" url: https://github.com/davidhalter/jedi-vim
Plug 'https://github.com/davidhalter/jedi-vim.git'

" set supertab
" url: https://github.com/ervandew/supertab
Plug 'https://github.com/ervandew/supertab.git'
call plug#end()

