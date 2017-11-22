"=============================================
"Author:hominlinx
"Version:1.1
"Email:hominlinx@gmail.com
"=============================================

"Plugin settings

" Bundle settings
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set nocompatible "be iMproved
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
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"NERD-Tree 建议记住该插件的快捷键
Bundle 'vim-scripts/The-NERD-tree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"标签导航
Bundle 'majutsushi/tagbar'
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"自动补全单引号，双引号等
Bundle 'jiangmiao/auto-pairs'

"文件搜索 建议学习一下
"http://blog.codepiano.com/pages/ctrlp-cn.light.html#loaded_ctrlp
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
let g:ctrlp_mruf_max=500 "指定你希望CtrlP记录的最近打开的文件历史的数目
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files=100000
let g:ctrlp_max_depth = 100


"% 匹配成对的标签，跳转
Bundle 'vim-scripts/matchit.zip'

"迄今位置用到的最好的自动VIM自动补全插件
Bundle 'Valloric/YouCompleteMe'
"youcompleteme 默认tab s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
"let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autoclose_preview_window_after_insertion=1
"关闭语法检测
let g:ycm_enable_diagnostic_signs=0
"在注释输入时也能补全
"let g:ycm_complete_in_comments=1
"let g:ycm_complete_in_strings=1
"let g:ycm_collect_identifiers_from_comments_and_strings=1 "注释和字符串的文字也会收入补全
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['scss', 'slim'] }

"快速插入代码片段
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
"定义存放代码片段的文件夹
".vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
"let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultiSnips"]

"cpp-->h
Bundle 'a.vim'

"ag 用于查询字符串
Bundle 'rking/ag.vim'

Bundle 'dyng/ctrlsf.vim'
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>c :CtrlSFClose<CR>
let g:ctrlsf_ignore = ['node_modules', 'bower_components']
"add vim gitgutter
Bundle 'airblade/vim-gitgutter'

"平滑滚动
Bundle 'yonchu/accelerated-smooth-scroll'

Plugin 'rhysd/accelerated-jk'
" cursor movement
 if isdirectory($HOME . "/.vim/bundle/accelerated-jk") " a variable
" not assigned
 nmap j <Plug>(accelerated_jk_gj)
 nmap k <Plug>(accelerated_jk_gk)
 endif
 let g:accelerated_jk_acceleration_limit = 500
 let g:accelerated_jk_acceleration_table = [10, 20, 30, 35, 40, 45, 50]"
"快速 加减注释
"shift+v+方向键选中(默认当前行) -> ,cs 加上注释 -> ,cu 解开注释
Bundle 'scrooloose/nerdcommenter'

"状态栏增强展示
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

function! AirlineInit()
    let g:airline_section_y = airline#section#create_right(['%v', '%l'])
    let g:airline_section_z = airline#section#create_right(['%P', '%L'])
endfunction
autocmd VimEnter * call AirlineInit()

function! AirlineThemePatch(palette)
    if g:airline_theme == "wombat"
        for colors in values(a:palette.inactive)
            let colors[3] = 235
        endfor
    endif
endfunction


"for show no user whitespaces
Bundle 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>


"##########语法检查##########"
"Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1 "在打开文件的时候检查
let g:syntastic_enable_highlighting = 0
let g:syntastic_mode_map      = {'mode': 'active',
            \'active_filetypes':  [],
            \'passive_filetypes': ['html', 'css', 'xhtml', 'eruby']
            \}


" Airline output for tmux
Bundle 'edkolev/tmuxline.vim'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=0
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'full'

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
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

"cmake.vim
Bundle 'vhdirk/vim-cmake'

"scons vim
Bundle 'scons.vim'

"gdb
"Bundle 'yuratomo/dbg.vim'
"let g:dbg#command_shell = 'bash'
"let g:dbg#shell_prompt = '> '
"let g:dbg#command_jdb = 'jdb'
"let g:dbg#command_gdb = 'gdb'
"Bundle 'multvals.vim'
"Bundle 'gdbvim'
"let g:vimgdb_debug_file = ""
"run macros/gdb_mappings.vim

Bundle 'Conque-GDB'
let g:ConqueGdb_Leader = ',g'
let g:ConqueGdb_SrcSplit = 'right'
let g:ConqueGdb_GdbExe = 'gdb' "or arm-linux-gdb
"let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb' "or gdb
"Bundle 'minimal_gdb'
"Bundle 'gdbmgr'
"Bundle 'Shougo/vimproc'
" Brief help
" :BundleList - list configured bundles
" :BundleInstall(!) - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

Bundle 'DrawIt'

"markdown
"
"Bundle 'scturtle/vim-instant-markdown-py'

"Google Protobuf支持
Bundle 'uarun/vim-protobuf'

"XML语法支持
Bundle 'othree/xml.vim'

"QT支持
Bundle 'Townk/vim-qt'
Bundle  'xaizek/vim-qthelp'
Bundle 'peterhoeg/vim-qml'

"bitbake 的支持
Bundle 'kergoth/vim-bitbake'


if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif
