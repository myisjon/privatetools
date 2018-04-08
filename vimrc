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
" Highlight current line and column
set cursorline cursorcolumn

highlight CursorColumn cterm=NONE ctermbg=3 ctermfg=15  guibg=NONE guifg=NONE

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

"使用语法高亮折叠
set foldenable
set foldmethod=syntax
set foldlevelstart=200

" 支持c++ 11/14/17语法高亮
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" 支持缩紧对齐展示
" colorscheme default
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red  ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green  ctermbg=4
" set ts=4 sw=4 et
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" nnoremap <silent> <Leader>i <Plug>IndentGuidesToggle

" config pathogen
" execute pathogen#infect()

" 配置nerdTree Plus
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowBookmarks=1
map  :silent! NERDTreeToggle

" config nerdTree files highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" 添加vim-plug
call plug#begin('~/.vim/plugged')


" 配置vim-plug; url: https://github.com/junegunn/vim-plug
" install vim-plug: curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

" set NERDTree
" url(vim-pathogen): https://github.com/tpope/vim-pathogen
Plug 'https://github.com/tpope/vim-pathogen.git'
" url: https://github.com/scrooloose/nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'

" 支持c++ 11高亮语法
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'

" 缩紧对齐标签
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'

call plug#end()

