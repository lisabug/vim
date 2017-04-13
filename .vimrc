" Vim Configuration of Yuanqin Lu
" Last Update: 2017.04.13

" ** Vundle BEGIN **
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
execute pathogen#infect()
call vundle#begin()
" Refer to repo of Vundle on github
" https://github.com/VundleVim/Vundle.vim
" let Vundle manage Vundle, required
Plugin 'VundelVim/Vundle.vim'
" Auto Completion
Plugin 'Valloric/YouCompleteMe'
" Syntax Check
Plugin 'scrooloose/syntastic'
" Auto Comments
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Quotation, Brackets Completion
Plugin 'Raimondi/delimitMate'
" DirectoryTree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'szw/vim-ctrlspace'
" Tagbar
Plugin 'majutsushi/tagbar'
" Python Syntax Highlight
Plugin 'hdima/python-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Vundel Configure FINISH!!
" --------------------------------------------------------------------------
" ** Vundle END **

" Vim basic setting
let g:mapleader=','
let mapleader=','

" 开启语法高亮
syntax on
" 文件类型检查
filetype on
" 针对不同的文件采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

set autoread "文件修改后自动载入
set magic
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" 界面设置
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前Vim模式
set showmode
" 显示行号
set number
set laststatus=2

" 高亮search命中的文本
set hlsearch
set ignorecase
set smartcase

" 代码折叠
set foldenable
set foldmethod=indent
set foldlevel=99

" 缩进配置
set smartindent
set autoindent

" Tab相关
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast

" Statusline
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,ucs-bom,euc-kr,latin1
set helplang=cn
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B

autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"-----------------------------------------------------------------
" 插件配置

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
" 上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" YouCompletMe
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs=1
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_remove_include_errors = 1
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recompile with syntastic
inoremap <leader><leader> <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" NerdTree Configuration
let g:nerdtree_tabs_open_on_gui_startup=0 " Not open NerdTree Automotically when start Vim.
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=25
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '\.git$']
map <F7> :NERDTreeToggle<CR>
imap <F7> <ESC> :NERDTreeToggle<CR>


" Tagbar
nmap <F8> :TagbarToggle<CR>


" Python语法检查
let g:pyflakes_use_quickfix=0

"插件设置Finish
"--------------------------------------------------------------------


" tab 操作
" " TODO: ctrl + n 变成切换tab的方法
" " http://vim.wikia.com/wiki/Alternative_tab_navigation
" "
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim
" "map <C-2> 2gt
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
" TODO: 配置成功这里, 切换更方便, 两个键
" nnoremap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
vnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()


" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/zsh")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# -*- coding:utf-8 -*-")
    endif

    normal G
    normal o
    normal o
endfunc

colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
if exists('$TMUX')
    set term=screen-256color
endif
