"=============================================
"Author:hominlinx
"Version:1.1
"Email:hominlinx@gmail.com
"=============================================

"=============================================
"General 基础设置
"=============================================
set encoding=utf-8
" encoding dectection 
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set helplang=cn

" enable filetype dectection and ft(filetype) specific plugin/indent
" 文件类型检测/允许加载文件类型插件/为不同类型的文件定义不同的缩进格式
filetype plugin indent on

"--------
" Vim UI
"--------
" color scheme
set background=dark
"colorscheme vividchalk

" 取消备份。
set nobackup
set noswapfile

" 突出显示当前行等 
set cursorcolumn
set cursorline " 突出显示当前行

"- 则点击光标不会换,用于复制
set mouse =a
set selection=exclusive
set selectmode=mouse,key

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

" 代码折叠
set foldenable
" 折叠方法
" manual 手工折叠
" indent 使用缩进表示折叠
" expr 使用表达式定义折叠
" syntax 使用语法定义折叠
" diff 对没有更改的文本进行折叠
" marker 使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

"显示当前的行号列号：
set ruler

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line
set laststatus=2

"==========================================
" others 其它配置
"==========================================

autocmd! bufwritepost _vimrc source % " vimrc文件修改之后自动加载。 windows。
autocmd! bufwritepost .vimrc source % " vimrc文件修改之后自动加载。 linux。

" editor settings
set guifont=Monaco\ h9
set history=1000
set nocompatible
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set report=0                                                      " always report number of lines changed                "
set wrap                                                        " do wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " 括号配对情况
set showmode							  " set showmode
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
"set matchpairs+=<:>                                               " specially for html
" set relativenumber


" Python 文件的一般设置，比如不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai

"重新打开回到上次所编辑文件的位置
" if this not work ,make sure .viminfo is writable for you
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"=============================================
"hot key 自定义快捷键
"=============================================
"<Leader>的定义
let mapleader = ','
let g:mapleader = ','

"Quickly edit/reload the vimrc file
"<silent>表示执行键绑定时不在命令行上回显
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"better command line editing
"在命令行模式下使用了类似emace的快捷键
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"后退一个字符
cnoremap <C-B>        <Left>
" 删除光标所在的字符
cnoremap <C-D>        <Del>
 " 前进一个字符
cnoremap <C-F>        <Right>
" 取回较新的命令行
cnoremap <C-N>        <Down>
" 取回以前 (较旧的) 命令行
cnoremap <C-P>        <Up>
" 后退一个单词
"使用shell的即可
" 前进一个单词
" 使用shell的即可

"smart way to move between windows 多窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" go to beign and end using capitalized derections
noremap H 0
noremap L $
map 0 ^

" speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

"为了方便复制，用《F2》开启或关闭行号显示：
nnoremap <F2> :set nonumber! number?<CR>

"用F3 开启或关闭list功能，是否显示不可见字符
set listchars=tab:>-,eol:$
nnoremap <F3> :set list! list?<CR>

"用F4 开启或关闭换行功能
nnoremap <F4> :set wrap! wrap?<CR>

"set paste
"用F5激活/取消 paste模式，进入插入模式粘贴，代码就不会被自动缩进
set pastetoggle=<F5>
" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

"F6 激活/取消语法高亮
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

"kj   <Esc>，不用到角落去按esc了
inoremap kj <Esc>

""Jump to start and end of line using the home row keys
nmap t o<ESC>k
nmap T O<ESC>j

"标签页设置
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


"==========================================
" Plugin settings
" vundle 管理
"==========================================
set nocompatible  		"be iMproved
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'



"主题：molokai
Bundle 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

"主题 solarized
Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"##########导航##########"

"目录导航
Bundle 'vim-scripts/The-NERD-tree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

"for minibufferexpl
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1

" 默认方向键左右可以切换buffer
nnoremap <TAB> :MBEbn<CR>
noremap <leader>bn :MBEbn<CR>
noremap <leader>bp :MBEbp<CR>
noremap <leader>bd :MBEbd<CR>


"标签导航
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"标签导航 要装ctags
Bundle 'vim-scripts/taglist.vim'
set tags=tags;/
let Tlist_Ctags_Cmd="/usr/bin/ctags"
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 25

"文件搜索
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

Bundle 'mileszs/ack.vim'
 Bundle 'rking/ag.vim'
"let g:agprg="<custom-ag-path-goes-here> --column"

"##########移动##########"
"更高效的移动
",, + w  跳转
",, + fe  查找'e',快速跳转定位到某个字符位置
Bundle 'Lokaltog/vim-easymotion'

"% 匹配成对的标签，跳转
Bundle 'vim-scripts/matchit.zip'

"##########补全/自动编辑##########"

"迄今位置用到的最好的自动VIM自动补全插件
Bundle 'Valloric/YouCompleteMe'
"youcompleteme 默认tab s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_insertion=1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>


"快速插入代码片段
"Bundle 'vim-scripts/UltiSnips'
Bundle 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
let g:UltiSnipsSnippetDirectories=["snippets", "bundle/UltiSnips/UltiSnips"]

"快速 加减注释
"shift+v+方向键选中(默认当前行)   ->  ,cc  加上注释  -> ,cu 解开注释
Bundle 'scrooloose/nerdcommenter' 

"自动补全单引号，双引号等
Bundle 'jiangmiao/auto-pairs'

"for code alignment
"代码格式化用：,a= 按等号切分格式化,a: 按逗号切分格式化
Bundle 'godlygeek/tabular'
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"for visual selection
Bundle 'terryma/vim-expand-region'
map = <Plug>(expand_region_expand)
map - <Plug>(expand_region_shrink)

"for mutil cursor
Bundle 'terryma/vim-multiple-cursors'
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"for golang
Bundle 'nsf/gocode',{'rtp':'vim/'}
set rtp+=$GOROOT/misc/vim

"for Ruby
Bundle 'tpope/vim-endwise'

"web front end
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-haml'
Bundle 'nono/jquery.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'wavded/vim-stylus'

"opengl
Bundle "beyondmarc/opengl.vim"
"##########显示增强##########"

"状态栏增强展示
"Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch -> git clone
"git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
""let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = unicode'

Bundle 'bling/vim-airline'
 " --- vim-airline
set ttimeoutlen=50
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = ''
let g:airline_linecolumn_prefix = ''
let g:airline_linecolumn_prefix = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#csv#enabled = 0 
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_theme_patch_func = 'AirlineThemePatch'

function! AirlineThemePatch(palette)
    if g:airline_theme == "wombat"
        for colors in values(a:palette.inactive)
            let colors[3] = 235
        endfor
    endif
endfunction



"括号显示增强
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown', 'RoyalBlue3'],
    \ ['Darkblue', 'SeaGreen3'],
    \ ['darkgray', 'DarkOrchid3'],
    \ ['darkgreen', 'firebrick3'],
    \ ['darkcyan', 'RoyalBlue3'],
    \ ['darkred', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown', 'firebrick3'],
    \ ['gray', 'RoyalBlue3'],
    \ ['black', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['red', 'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"代码排版缩进标识
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>

"##########语法检查##########"
" 编辑时自动语法检查标红, vim-flake8目前还不支持,所以多装一个
" 使用pyflakes,速度比pylint快
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

" python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0

"##########语法高亮##########"
" for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

" for golang
Bundle 'jnwhiteh/vim-golang'
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" for markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

"for cpp
Bundle 'octol/vim-cpp-enhanced-highlight'


"设置花括号补全
set smartindent 
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
"imap { {}<ESC>i<CR><ESC>O  

"##########其他##########"
"cpp 与h之间转换
Bundle 'derekwyatt/vim-fswitch'

"==========================================
"
" 主题,及一些展示上颜色的修改
"==========================================
"开启语法高亮
syntax enable
syntax on

" 修改主题和颜色展示
colorscheme molokai
set background=dark
set t_Co=256
"colorscheme solarized
"set background=dark
"set t_Co=256

"=========================================
"
"=========================================

" 定义自动命令，如果每次vim打开时没有指定打开文件，则启用NERDTree
 autocmd vimenter * if !argc() | NERDTree | endif
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"tmux 与vim 的整合
Bundle 'benmills/vimux'
" Vimux
map rp :PromptVimTmuxCommand
nmap <silent> <leader>rp :VimuxPromptCommand<CR>
nmap <Leader>vc :VimuxCloseRunner<CR>
nmap <Leader>vl :VimuxRunLastCommand<CR>


Bundle 'benmills/vimux-golang'
map <Leader>ra :wa<CR> :GolangTestCurrentPackage<CR>
map <Leader>rf :wa<CR> :GolangTestFocused<CR>

" 针对 Ruby 文件
 autocmd FileType ruby,rdoc set tabstop=2 shiftwidth=2
"  
" 针对 Go 文件
  autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
  autocmd FileType go autocmd BufWritePre <buffer> Fmt"
"Go tags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
