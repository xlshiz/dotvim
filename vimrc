" **dein {{{1
" *Settings {{{2
set all&			" Reset all
if has('vim_starting')
	set nocompatible		" Be iMproved
	set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim/
endif
call dein#begin(expand('~/.vim/bundle/'))

" *My Bundles {{{2
" --------
call dein#add('w0rp/ale')
call dein#add('jiangmiao/auto-pairs')
" --------
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('xlshiz/ctrlp-fastmatcher.vim')
call dein#add('xlshiz/ctrlp-filetag.vim')
call dein#add('dyng/ctrlsf.vim')
" --------
" NeoBundleLazy	'Raimondi/delimitMate'
call dein#add('xlshiz/DoxygenToolkit.vim', {'on_cmd': 'Dox'})
call dein#add('DrawIt', {'lazy': 1})
" --------
" call dein#add('mbbill/echofunc')
" call dein#add('Shougo/echodoc.vim')
" --------
call dein#add('junegunn/fzf.vim')
" --------
call dein#add('Mark')
call dein#add('matchit.zip')
" --------
" call dein#add('Shougo/neocomplcache.vim')
" call dein#add('Shougo/neocomplete.vim')
call dein#add('scrooloose/nerdcommenter')
call dein#add('scrooloose/nerdtree')
" --------
call dein#add('xuhdev/SingleCompile', {'on_cmd': 'SingleCompile'})
" call dein#add('scrooloose/syntastic')
" --------
call dein#add('majutsushi/tagbar')
" NeoBundleLazy	'taglist.vim'
" --------
call dein#add('SirVer/ultisnips')
" --------
call dein#add('bling/vim-airline')
call dein#add('junegunn/vim-easy-align')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('tpope/vim-fugitive')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-repeat')
call dein#add('honza/vim-snippets')
call dein#add('bronson/vim-trailing-whitespace')
" NeoBundleLazy	'Shougo/vimshell.vim'
" NeoBundleLazy	'vimwiki/vimwiki'
" --------
call dein#add('gcmt/wildfire.vim')
" --------
call dein#add('Valloric/YouCompleteMe')
" --------color--------
call dein#add('morhetz/gruvbox')
call dein#add('tomasr/molokai', {'lazy': 1})
call dein#add('altercation/vim-colors-solarized', {'lazy': 1})
" --------language--------
call dein#add('docunext/closetag.vim', {'on_ft': ['html', 'xml']})			" html标签配对
call dein#add('tpope/vim-surround', {'on_ft': ['html', 'xml']})
call dein#add('plasticboy/vim-markdown', {'on_ft': ['md', 'markdown']})
call dein#add('jceb/vim-orgmode', {'on_ft': 'org'})
call dein#add('hdima/python-syntax', {'on_ft': 'python'})
call dein#add('hynek/vim-python-pep8-indent', {'on_ft': 'python'})
call dein#add('Glench/Vim-Jinja2-Syntax', {'on_ft': 'python'})

call dein#end()
"}}}2
"}}}1
" *Settings {{{1
if has('gui_running')
	source $VIMRUNTIME/mswin.vim
	unmap  <C-Y>
	iunmap <C-Y>
	unmap  <C-S>
	iunmap <C-S>
	unmap  <C-Z>
	iunmap <C-Z>
	unmap  <C-F4>
	iunmap <C-F4>
	cunmap <C-F4>
	set guioptions+=m
	set guioptions-=T
	set guioptions-=l
	set guioptions-=L
	set guioptions+=r
	set guioptions+=R
	set guioptions-=a
endif
if has('mouse')				"如果该Vim支持鼠标，则启用鼠标支持
	set mouse=a
	if exists('$TMUX')  		" 支持在tmux中使用鼠标托动大小
		set ttymouse=xterm2
	endif
endif
let mapleader = ","			"设置导键
let mapleader = "\<space>"			"设置导键
set wak=no				"alt键盘不作为菜单选择快捷键使用
set showcmd				"显示输入过的命令
set noshowmode
set nobackup				"不自动备份
set noswapfile				"关闭交换文件
set writebackup				"写备份
set directory-=.			"不在当前目录产生swap文件
set showmatch				"在输入括号时光标会短暂地跳到与之相匹配的括号处
set matchtime=2				"闪烁两秒
set nonumber				"不显示行号
set relativenumber number		"显示相对行号
" set autochdir				"自动改变当前目录
set ignorecase				"默认搜索不区分大小写
set smartcase				"当输入大写字母是自动开启区分大小写
set incsearch				"打开递进式搜索
set hls					"高亮显示搜索匹配
set ambiwidth=double
set sessionoptions+=unix,slash		"设置会话文件的格式
set completeopt=longest,menu		"设置全能补全不产生预览窗口
set wildmenu				"状态栏提示预览
set wildmode=longest:full		"和下边的选项配合，命令行输入的时候，tab不补全，只进行预览。
set scrolloff=3				"滚屏是光标上下保留的行数
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口

if $VIM_HATE_SPACE_ERRORS != '0'
	let c_space_errors=1
endif

set backspace=indent,eol,start
set whichwrap+=b,s,<,>,[,]
set selection=inclusive
set novisualbell         		" 蜂鸣器静音
set noerrorbells         		" 蜂鸣器静音

" 重启后撤销历史可用 persistent undo
let s:undo_cache_dir=$HOME.'/.cache/vim_undo'
if v:version >= 703
	if exists('*mkdir') && !isdirectory(s:undo_cache_dir)
		sil! cal mkdir(s:undo_cache_dir, 'p')
	en
	autocmd VimLeave * call RemoveOverTimeFiles(7, s:undo_cache_dir)
	set undofile
	exec "set undodir=".s:undo_cache_dir
	set undolevels=1000
endif

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif
"}}}1
" *Nice Window Title {{{1
if has('title') && (has('gui_running') || &title)
	set titlestring=
	set titlestring+=%f\ 			"file name
	set titlestring+=%h%m%r%w 		"flag
	set titlestring+=\ -\ %{v:progname} 	"program name
endif
"}}}1
" *Encoding {{{1
set formatoptions+=Mm	"正确地处理中文字符的折行和拼接
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,default
"}}}1
" *Fix Cursor in TMUX {{{1
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"}}}1
" *My Modes {{{1
function EnglishMode()
	setlocal shiftwidth=8
	setlocal tabstop=8
	iunmap <C-K>
	setlocal spell
endfunction
command -nargs=0 EnglishMode call EnglishMode()

function SMode()
	let b:asmsyntax = 'gas'
	set syntax=gas
endfunction

function AsmMode()
	let b:asmsyntax = 'masm'
	setlocal syntax=asmx86
endfunction

function CMode()
	setlocal shiftwidth=4
	setlocal tabstop=4
	setlocal cindent
	set list 				"显示空白字符
	set listchars=tab:▸\ ,trail:▫
	" autocmd BufWritePre *.c FixWhitespace
endfunction
command -nargs=0 CMode call CMode()

function KernelMode()
	setlocal cindent
	setlocal cinoptions+=:0t0(0
	setlocal tw=78
	set list 				"显示空白字符
	set listchars=tab:▸\ ,trail:▫
	" autocmd BufWritePre *.c FixWhitespace
endfunction
command -nargs=0 KernelMode call KernelMode()

function PyMode()
	setlocal tabstop=4
	setlocal shiftwidth=4
	setlocal expandtab
	setlocal autoindent
	set list 				"现实空白字符
	set listchars=tab:▸\ ,trail:▫
endfunction

syntax on
filetype on
filetype plugin indent on
if has("autocmd")
	au BufNewFile,BufRead *.s,*.S call SMode()
	au BufNewFile,BufReadPre *.asm call AsmMode()
	au BufNewFile,BufRead *.[ch],*.cpp,*.cc call KernelMode()
	" au BufNewFile,BufRead *.py call PyMode()
else
	set autoindent
	set smartindent
endif
"}}}1
" *My Functions {{{1
function CreatCtags(flag)
	if has("win32")
		let bs = "\\"
		let hd = "\""
	elseif has("unix")
		let bs = "/"
		let hd = ""
	else
		echoerr("Unknow System")
	endif
	if a:flag == 1
		if hd == ""
			execute "!ctags --c-kinds=+p --fields=+lS ".expand("%:t")
		else
			execute "!start ctags --c-kinds=+p --fields=+lS ".hd.expand("%:t").hd
		endif
	elseif a:flag == 2
		let NowPath = getcwd()
		call inputsave()
		let ProjPath = input("Path to build CTAGS: ", NowPath, "dir")
		call inputrestore()
		if ProjPath == ""
			return
		endif
		let ProjPathLen = strlen(ProjPath)
		if ProjPath[ProjPathLen-1] != bs
			let ProjPath = ProjPath.bs
			let ProjPathLen += 1
		endif
		execute "!ctags -R --c-kinds=+p --fields=+lS ".hd.ProjPath."\*".hd
		if ProjPath[:(ProjPathLen-2)] != NowPath
			call rename("tags", ProjPath."tags")
		endif
		execute "set tags+=".ProjPath."tags"
	endif
endfunction

let g:prj_dir = "."
function AddPrjSet()
	let NowPath = getcwd()
	call inputsave()
	redraw
	let g:prj_dir = input("input Project path: ", NowPath, "dir")
	call inputrestore()
	if g:prj_dir == "" || !isdirectory(g:prj_dir)
		return
	endif
	if filereadable(g:prj_dir."/tags")
		execute "set tags+=".g:prj_dir."/tags"
	endif
	if has("cscope")
		set nocsverb
		if filereadable(g:prj_dir."/cscope.out")
			execute "cs add ".g:prj_dir."/cscope.out"
		elseif $CSCOPE_DB != ""
			execute "cs add $CSCOPE_DB"
		endif
		set csverb
	endif
endfunction

function WriteSession(filename)
	mksession "~/.cscope/".filename
endfunction

function OpenSession(filename)
	source "~/.cscope/".filename
endfunction

" function! StripTrailing()
	" let previous_search=@/
	" let previous_cursor_line=line('.')
	" let previous_cursor_column=col('.')
	" %s/\s\+$//e
	" let @/=previous_search
	" call cursor(previous_cursor_line, previous_cursor_column)
" endfunction

" " strip trailing whitespace on c
" augroup whitespace
	" autocmd BufWritePre *.c call StripTrailing()
" augroup END

function! RemoveOverTimeFiles(time, dir)
	silent! execute '!find '.a:dir.'/ -mtime +'.a:time.' -type f -exec rm -f {} \;'
endfunction

function! WantPasteMode()
	if(&relativenumber == &number)
		set relativenumber! number!
	elseif(&number)
		set number!
	else
		set relativenumber!
	endif
	set paste!
	if(&paste)
		set mouse-=a
	else
		set mouse+=a
	endif
endfunc
nnoremap <F2> :call WantPasteMode()<CR>
"}}}1
" *Key Maps{{{1
map <c-h>	<c-w>h
map <c-j>	<c-w>j
map <c-k>	<c-w>k
map <c-l>	<c-w>l
map <leader>wh	<c-w>h
map <leader>wj	<c-w>j
map <leader>wk	<c-w>k
map <leader>wl	<c-w>l
map \1		<c-w>o
map \d		<c-w>c
map <leader>bd	:bd!<CR>
imap <c-f>	<c-o>f
map <F5>	:SingleCompile<CR>
map <c-F5>	:SingleCompileRun<CR>
map <leader>fs	:up<CR>
map <leader>q	:qa!<CR>
map <leader>x	:xa<CR>
map <leader>ag	:CtrlSF<CR>
map <leader>ao	:CtrlSFOpen<CR>
map <leader>aa	:CtrlSF 
" map <leader>2	:Tlist<CR>
map <leader>2	:TagbarToggle<CR>
map <leader>3	:CtrlPFiletag<cr>
map <leader>44	:call CreatCtags(1)<CR><CR>
map <leader>43	:call CreatCtags(2)<CR><CR>
map <leader>41	:call AddPrjSet()<CR>
map <leader>g	:tag 
map <leader>bb	:CtrlPBuffer<CR>
map <leader>td	:NERDTreeToggle<CR>
map <leader>tf	:NERDTreeFind<CR>
map <leader>l	:Tabularize /
" map <leader><space>	:FixWhitespace<CR>
map Y 		y$
noremap <C-Q>		<C-V>
if has('eval')
	inoremap <silent> <C-\><C-D> <c-r>=strftime("%Y-%m-%d")<CR>
	noremap <silent> <C-\><C-D> i// <c-r>=strftime("%Y-%m-%d")<CR> shixl<ESC>
endif
"}}}1
" **Plugins Settings {{{1
" *ctrlp {{{2
let g:ctrlp_extensions = ['filetag']
let g:ctrlp_match_func = { 'match': 'fastmatcher#matcher' }
let g:ctrlp_max_files = 0
let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_lazy_update = 200
let g:ctrlp_match_window = 'order:ttb,max:25'
let g:ctrlp_custom_ignore = {
    \ 'file': '\v\.(exe|so|dll|o|ko|order|symvers|mod\.c)$|\vtags|\vTAGS|\vFILETAG',
    \ }
if has("unix")
	let g:ctrlp_user_command =
		\ 'find %s -type f | grep -v -P "\.git/|\.svn/|\.hg|\.o$|\.ko$|/\.|^\.|tags$|TAGS$|FILETAG$|\.order$|\.symvers$|\.mod\.c"'
endif
if executable('ag')
	let g:ctrlp_user_command = 
		\ 'ag %s -l --nocolor -g "" | grep -v -P "\.git/|\.svn/|\.hg|\.o$|\.ko$|/\.|^\.|tags$|TAGS$|FILETAG$|\.order$|\.symvers$|\.mod\.c"'
endif
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }
func! MyCtrlPMappings()
	nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc
func! s:DeleteBuffer()
	let line = getline('.')
	let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
				\ : fnamemodify(line[2:], ':p')
	exec "bd" bufid
	exec "norm \<F5>"
endfunc
autocmd VimLeave * call RemoveOverTimeFiles(14, $HOME.'/.cache/ctrlp')

func! CtrlPHook()
	if g:prj_dir != "."
		exec "CtrlP ".g:prj_dir
	else
		exec "CtrlP"
	endif
endfunc
command -nargs=0 CtrlPHook call CtrlPHook()
let g:ctrlp_cmd = "CtrlPHook"
"}}}2
" *Doxy {{{2
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_briefTag_post = "- "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_paramTag_post=": "
let g:DoxygenToolkit_returnTag=   "@return "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="shixl"
let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_startCommentBlock = "/*"
let g:DoxygenToolkit_interCommentTag = "*"
let g:DoxygenToolkit_interCommentBlock = "*"
" *}}}2
" *Tagbar {{{2
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 2
let g:tagbar_sort = 0
" let g:tagbar_ctags_bin = '/usr/bin/ctags'
"}}}2
" *Ack.vim {{{2
if executable('ag')
	let g:ackprg = 'ag --nogroup --column'
endif
" }}}2
" *Tlist {{{2
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close=1
" let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
"}}}2
" *Ctags {{{2
set tags=tags,./tags,../tags
"}}}2
" *Cscope {{{2
if has("cscope")
	set csto=1
	set cst
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>		" 查找本C符号
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>		" 查找本定义
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>		" 查找调用本函数的函数
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>		" 查找本字符串
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>		" 查找本egrep模式
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>		" 查找本文件
	nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>		" 查找本文件包含的文件
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>		" 查找本函数调用的函数
	nmap <C-\>k :cs kill 0<CR>						"
endif
"}}}2
" *Diff {{{2
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"set diffexpr=MyDiff()
"}}}2
" *airline {{{2
set laststatus=2
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_section_z = '(%3.10l,%3.10v):%2B'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
"}}}2
" *NERDCommenter {{{2
let NERDSpaceDelims = 1
"}}}2
" *Neocomplete {{{2
if (dein#is_sourced("neocomplete.vim"))
	"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
	" Disable AutoComplPop.
	let g:acp_enableAtStartup = 0
	" Use neocomplete.
	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

	" Define dictionary.
	let g:neocomplete#sources#dictionary#dictionaries = {
				\ 'default' : '',
				\ 'vimshell' : $HOME.'/.vimshell_hist',
				\ 'scheme' : $HOME.'/.gosh_completions'
				\ }

	" Define keyword.
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	" Plugin key-mappings.
	inoremap <expr><C-g>     neocomplete#undo_completion()
	inoremap <expr><C-l>     neocomplete#complete_common_string()

	" Recommended key-mappings.
	" <CR>: close popup and save indent.
	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplete#close_popup() . "\<CR>"
		" For no inserting <CR> key.
		"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	" <TAB>: completion.
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	" inoremap <expr><C-y>  neocomplete#close_popup()
	" inoremap <expr><C-e>  neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
	"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplete#enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplete#enable_insert_char_pre = 1

	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1

	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

	" Enable omni completion.
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	" Enable heavy omni completion.
	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns = {}
	endif
	"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	autocmd VimLeave * call RemoveOverTimeFiles(14, $HOME.'/.cache/neocomplete')
endif
"}}}
" *syntastic {{{
if (dein#is_sourced("syntastic"))
	let g:syntastic_error_symbol='>>'
	let g:syntastic_warning_symbol='>'
	let g:syntastic_check_on_open=1
	let g:syntastic_enable_highlighting = 0
	"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
	let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
	let g:syntastic_javascript_checkers = ['jsl', 'jshint']
	let g:syntastic_html_checkers=['tidy', 'jshint']
	highlight SyntasticErrorSign guifg=white guibg=black
endif
"}}}
" *YCM {{{
if (dein#is_sourced("YouCompleteMe"))
	"youcompleteme  默认tab  s-tab 和自动补全冲突
	"let g:ycm_key_list_select_completion=['<c-n>']
	let g:ycm_key_list_select_completion = ['<Down>']
	"let g:ycm_key_list_previous_completion=['<c-p>']
	let g:ycm_key_list_previous_completion = ['<Up>']
	let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
	let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
	let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
	let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
	let g:ycm_collect_identifiers_from_tags_files = 1
	let g:ycm_cache_omnifunc = 0
	let g:ycm_show_diagnostics_ui = 0

	" 跳转到定义处, 分屏打开
	" let g:ycm_goto_buffer_command = 'horizontal-split'
	nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

	"let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开

	" 引入可以补全系统，以及python的第三方包
	let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/repos/github.com/Valloric/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

	" 黑名单,不启用
	let g:ycm_filetype_blacklist = {
				\ 'tagbar' : 1,
				\ 'gitcommit' : 1,
				\}
	" 错误和警告使用不同的标志
	let g:ycm_error_symbol = '>>'
	let g:ycm_warning_symbol = '>'
endif
"}}}
" *UltiSnips {{{
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}}
" *DelimitMate {{{
if (dein#is_sourced("delimitMate"))
	au BufNewFile,BufRead *.c,*.cpp,*.h let b:delimitMate_matchpairs = "(:),[:]"
endif
" }}}
" *Easy-align {{{
if (dein#is_sourced("vim-easy-align"))
	let g:easy_align_delimiters={}
	au BufNewFile,BufRead *.c,*.cpp,*.h let g:easy_align_delimiters['d'] = { 'pattern': '\(const\|static\|struct\)\@<! ', 'left_margin': 0, 'right_margin': 0 }
endif
" }}}
"}}}1
" *Platform(Linux and Win) {{{1
if has("win32")
	set guifont=Courier_New:h12
	set background=dark
	colorscheme gruvbox
	if has("autocmd")
		au GUIEnter * simalt ~x
	endif
	let Tlist_Ctags_Cmd = "c:\\windows\\ctags.exe"
	let MRU_File = expand("$VIM/vimfiles/mru/_vim_mru_files")	"mru set
	set shellpipe=2>&1\|\ tee 					" For tee
	set helplang=cn							"中文帮助设置
elseif has("unix")
	if has('gui_running')
		set guifont=Source\ Code\ Pro\ Medium\ 12
		colorscheme gruvbox
	else
		set termguicolors
		set t_Co=256
		" set background=dark
		" colorscheme molokai
		colorscheme gruvbox
	endif
	if has("autocmd")
	endif
else
	echoerr "Unknow System"
endif
"}}}1
" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1
