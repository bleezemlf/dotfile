set nocompatible
call plug#begin('~/.vim/plugged')
"文件树
Plug 'preservim/nerdtree'
"状态栏
Plug 'itchyny/lightline.vim'
"补全括号
Plug 'jiangmiao/auto-pairs'
"代码补全
Plug 'ycm-core/YouCompleteMe'
"注释
Plug 'tpope/vim-commentary'
"修改函数参数
Plug 'gaving/vim-textobj-argument'
"自动格式化
Plug 'vim-autoformat/vim-autoformat'
call plug#end()

"this is my profile
inoremap jk <esc>
let mapleader=" "
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR> "快速编辑和重载vimrc
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR> "映射 buffer切换
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR> 
nnoremap <leader>wq :wq<CR> 
nnoremap <leader>ls :ls<CR>
nnoremap <leader>re :set relativenumber<CR>
nnoremap <leader>nr :set norelativenumber<CR>
nnoremap <leader>fd :set fdm=syntax<CR>
nnoremap <leader>bn :bNext<CR>
nnoremap <leader>t :tabnew<CR>
" nnoremap <F5> :!./%<CR>
nnoremap <F5> :!./cr.sh<CR>
nnoremap <BS> :nohl<CR>
" imap <C-S> <Esc>:w<CR>i "插入模式下的Ctrl-s映射到保存,不能用于linux

set t_Co=256 "设置为256色，增强vim颜色显示
set termguicolors "更强的24bit色彩显示，在服务器上支持不好,建议不使用默认配色方案
colorscheme desert "服务器推荐该主题

"---------------------
" Plugin configuration
"---------------------

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

"ycm
let g:ycm_enable_semantic_highlighting=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_auto_trigger=1
let g:ycm_key_invoke_completion = '<C-j>'
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"vim-commentary
" nnoremap <leader>/ gcc<CR> 

"gaving/vim-textobj-argument
let g:argumentobject_force_toplevel = 1

" autoformat
let g:autoformat_verbosemode=1 "开启详细模式便于查错
autocmd BufWrite *.sql,*.c,*.cpp,*.py,*.java,*.js :Autoformat "设置发生保存事件时执行格式化
let g:formatdef_sqlformat = '"sqlformat --keywords upper -"'
let g:formatters_sql = ['sqlformat']
let g:formatdef_clangformat_google = '"clang-format -style webkit -"' 
let g:formatters_c = ['clangformat_google']
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
"autocmd FileType vim,tex let b:autoformat_autoindent=0
"gg=G :retab :RemoveTrailingSpaces

"""
"Native vim profile
"""

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).

" Turn on syntax highlighting.
syntax on
set hlsearch
" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
" Unbind some useless/annoying default key bindings.
nmap Q <Nop>  
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
"set mouse+=a

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set scrolloff=3         " keep 3 lines always in the view when scrolling
set ai                  " set auto-indenting on for programming

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" movement relative to display lines
nnoremap <silent> <Leader>d :call ToggleMovementByDisplayLines()<CR>
function SetMovementByDisplayLines()
    noremap <buffer> <silent> <expr> k v:count ? 'k' : 'gk'
    noremap <buffer> <silent> <expr> j v:count ? 'j' : 'gj'
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction
function ToggleMovementByDisplayLines()
    if !exists('b:movement_by_display_lines')
        let b:movement_by_display_lines = 0
    endif
    if b:movement_by_display_lines
        let b:movement_by_display_lines = 0
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! nunmap <buffer> 0
        silent! nunmap <buffer> $
    else
        let b:movement_by_display_lines = 1
        call SetMovementByDisplayLines()
    endif
endfunction

highlight PMenu ctermfg=34 ctermbg=15 guifg=Green3 guibg=White
highlight PMenuSel ctermfg=15 ctermbg=202 guifg=White guibg=OrangeRed1
