" ** vim-plug {{{1
" * Settings {{{2
set all&			" Reset all
if has('vim_starting')
	set nocompatible		" Be iMproved
endif
function! Rc_plug_cond(cond, ...)
	let opts = get(a:000, 0, {})
	return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
function! Rc_plug_test(cond)
	return a:cond ? {} : { 'on': [], 'for': [] }
endfunction
function! s:is_source(cond)
	return has_key(g:plugs, a:cond)
endfunction
call plug#begin(expand('~/.vim/bundle/'))

"* My Bundles {{{2
" --------finder--------
if has('python')  || has('python3')
	Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
else
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'xlshiz/ctrlp-filetag.vim'
endif

" --------completer--------
if executable('node')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'Shougo/neco-vim'
	Plug 'neoclide/coc-neco'
elseif has('python')  || has('python3')
	Plug 'roxma/nvim-yarp'
	if !has('nvim')
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'ncm2/ncm2'
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-ultisnips'
	Plug 'ncm2/ncm2-pyclang', {'for': 'c'}
	Plug 'ncm2/ncm2-vim',{'for':'vim'}
	Plug 'Shougo/neco-vim',{'for':'vim'}
	" Plug 'ncm2/ncm2-vim-lsp'
	" Plug 'prabirshrestha/async.vim'
	" Plug 'prabirshrestha/vim-lsp'
else
	Plug 'Shougo/neocomplcache.vim'
endif

" --------coding--------
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'xlshiz/DoxygenToolkit.vim', {'on': 'Dox'}
Plug 'vim-scripts/Mark'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdcommenter'
Plug 'xuhdev/SingleCompile', {'on': 'SingleCompile'}
Plug 'majutsushi/tagbar'
" Plug 'vim-scripts/taglist.vim'
Plug 'gcmt/wildfire.vim'

" " --------ui--------
Plug 'gruvbox-community/gruvbox'
Plug 'tomasr/molokai'
Plug 'bling/vim-airline'

" " --------other--------
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/DrawIt', {'on': 'DIstart'}
Plug 'h-youhei/vim-fcitx'
Plug 'scrooloose/nerdtree'
if has('python')  || has('python3')
	Plug 'SirVer/ultisnips'
endif
Plug 'junegunn/vim-easy-align'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'xlshiz/vim-snippets'
Plug 'bronson/vim-trailing-whitespace'

" " --------language--------
Plug 'docunext/closetag.vim', {'for': ['html', 'xml']}			" html标签配对
Plug 'tpope/vim-surround', {'for': ['html', 'xml']}
Plug 'plasticboy/vim-markdown', {'for': ['md', 'markdown']}
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'tpope/vim-speeddating', {'for': 'org'}
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'python'}

call plug#end()
"}}}2
"}}}1
" * Settings {{{1
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
set nowritebackup			"关闭写备份
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
set completeopt=noinsert,menuone,noselect
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
set hidden
set shortmess+=c
if has('signs')
	set signcolumn=yes
endif

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
" * Nice Window Title {{{1
if has('title') && (has('gui_running') || &title)
	set titlestring=
	set titlestring+=%f\ 			"file name
	set titlestring+=%h%m%r%w 		"flag
	set titlestring+=\ -\ %{v:progname} 	"program name
endif
"}}}1
" * Encoding {{{1
set formatoptions+=Mm	"正确地处理中文字符的折行和拼接
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,default
"}}}1
" * Fix Cursor in TMUX {{{1
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"}}}1
" * My Modes {{{1
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

function CPPMode()
	setlocal shiftwidth=4
	setlocal tabstop=4
	setlocal cindent
	set list 				"显示空白字符
	set listchars=tab:▸\ ,trail:▫
	" autocmd BufWritePre *.c FixWhitespace
endfunction
command -nargs=0 CPPMode call CPPMode()

function KernelMode()
	setlocal cindent
	setlocal cinoptions+=:0t0(0
	setlocal tw=78
	set list 				"显示空白字符
	set listchars=tab:▸\ ,trail:▫
	au BufNewFile,BufRead *.h set filetype=c
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
	au BufNewFile,BufReadPre *.s,*.S call SMode()
	au BufNewFile,BufReadPre *.asm call AsmMode()
	au BufNewFile,BufReadPre *.[ch] call KernelMode()
	au BufNewFile,BufReadPre *.cpp,*.cc call CPPMode()
	" au BufNewFile,BufRead *.py call PyMode()
else
	set autoindent
	set smartindent
endif
"}}}1
" * My Functions {{{1
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

function! StripTrailing()
	let previous_search=@/
	let previous_cursor_line=line('.')
	let previous_cursor_column=col('.')
	%s/\s\+$//e
	let @/=previous_search
	call cursor(previous_cursor_line, previous_cursor_column)
endfunction

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
"}}}1
" * Key Maps{{{1
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
map <leader>fs	:up<CR>
map <leader>q	:qa!<CR>
map <leader>x	:xa<CR>
map <leader>44	:call CreatCtags(1)<CR><CR>
map <leader>43	:call CreatCtags(2)<CR><CR>
map <leader>41	:call AddPrjSet()<CR>
map <leader>g	:tag 
map Y 		y$
noremap <C-Q>		<C-V>
if has('eval')
	inoremap <silent> <C-\><C-D> <c-r>=strftime("%Y-%m-%d")<CR>
	noremap <silent> <C-\><C-D> i// <c-r>=strftime("%Y-%m-%d")<CR> shixl<ESC>
endif
" =====================
map <F4>	:SingleCompile<CR>
map <c-F4>	:SingleCompileRun<CR>
map <leader>pp	:CtrlSF<CR>
map <leader>po	:CtrlSFOpen<CR>
map <leader>p/	:CtrlSF 
if s:is_source("taglist.vim")
	map <leader>2	:Tlist<CR>
endif
if s:is_source("tagbar")
	map <leader>2	:TagbarToggle<CR>
endif
if s:is_source("ctrlp.vim")
	map <leader>3	:CtrlPFiletag<cr>
	map <leader>bb	:CtrlPBuffer<CR>
endif
map <leader>td	:NERDTreeToggle<CR>
map <leader>tf	:NERDTreeFind<CR>
map <leader>l	:Tabularize /
"}}}1
" ** Plugins Settings {{{1
" * asyncomplete {{{2
if s:is_source("asyncomplete.vim")
	au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
				\ 'name': 'file',
				\ 'whitelist': ['*'],
				\ 'priority': 10,
				\ 'completor': function('asyncomplete#sources#file#completor')
				\ }))
endif
"}}}2
" * airline {{{2
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
" * ale {{{2
let g:ale_disable_lsp = 1
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
"}}}2
" * auto-pair {{{2
if s:is_source("auto-pairs")
	let g:AutoPairsFlyMode = 0
	let g:AutoPairsMapCR = 0
	au FileType c let b:AutoPairs = AutoPairsDefine({'/*': '*/'})
endif
"}}}2
" * coc {{{2
if s:is_source("coc.nvim")
	set updatetime=300
	" Use K to show documentation in preview window
	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	" use <tab> for trigger completion and navigate to the next complete item
	function! s:coc_confirm()
		let hasSelected = coc#rpc#request('hasSelected', [])
		if hasSelected | return "\<C-y>" | endif
		return "\<C-g>u\<CR>\<c-r>=AutoPairsReturn()\<CR>"
	endfunction
	inoremap <silent><expr> <cr> pumvisible() ? <SID>coc_confirm() :
					   \"\<C-g>u\<CR>\<c-r>=AutoPairsReturn()\<CR>"
	let g:coc_snippet_next = '<tab>'
	let g:coc_snippet_prev = '<s-tab>'
	imap <C-j> <Plug>(coc-snippets-expand-jump)

	nmap <leader>rn <Plug>(coc-rename)
	nmap <silent> [e <Plug>(coc-diagnostic-prev)
	nmap <silent> ]e <Plug>(coc-diagnostic-next)
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gD <Plug>(coc-references)
endif
"}}}2
" * Cscope {{{2
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
" * Ctags {{{2
set tags=tags,./tags,../tags
"}}}2
" * ctrlp {{{2
if s:is_source("ctrlp.vim")
	let g:ctrlp_extensions = ['filetag']
	let g:user_command_async = 1
	let g:ctrlp_max_files = 0
	let g:ctrlp_clear_cache_on_exit = 1
	" let g:ctrlp_lazy_update = 200
	let g:ctrlp_match_window = 'order:ttb,max:25'
	let g:ctrlp_custom_ignore = {
				\ 'file': '\v\.(exe|so|dll|o|ko|order|symvers|mod\.c)$|\vtags|\vTAGS|\vFILETAG',
				\ }
	if has("unix")
		if executable('fd')
			let g:ctrlp_user_command = 'fd -t f %s'
		endif
		let g:ctrlp_user_command =
					\ 'find %s -type f | grep -v -P "\.git/|\.svn/|\.hg|\.o$|\.ko$|tags$|TAGS$|FILETAG$|\.order$|\.symvers$|\.mod\.c$"'
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
endif
"}}}2
" * ctrlsf {{{2
let g:ctrlsf_auto_focus = {
			\ "at": "start",
			\ }
"}}}2
" * Doxy {{{2
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
" * Easy-align {{{
if s:is_source("vim-easy-align")
	let g:easy_align_delimiters={}
	au BufNewFile,BufRead *.c,*.cpp,*.h let g:easy_align_delimiters['d'] = { 'pattern': '\(const\|static\|struct\)\@<! ', 'left_margin': 0, 'right_margin': 0 }
endif
" }}}
" * vim-easymotion {{{
map <leader>j	<Plug>(easymotion-prefix)
map <leader>jj 	<Plug>(easymotion-sn)
map <leader>jl 	<Plug>(easymotion-j)
" }}}
" * LeaderF {{{2
if s:is_source("LeaderF")
	let g:Lf_ShortcutF = '<leader>a'
	let g:Lf_ShortcutB = '<leader>e'
	let g:Lf_CacheDirectory = $HOME."/.cache/"
	let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.projectile', 'compile_commands.json']
	let g:Lf_WorkingDirectoryMode = 'Ac'
	autocmd VimLeave * call RemoveOverTimeFiles(14, $HOME.'/.cache/.LfCache')
endif
"}}}2
" * ncm2 {{{2
if s:is_source("ncm2")
	autocmd BufEnter * call ncm2#enable_for_buffer()
	au TextChangedI * call ncm2#auto_trigger()
	inoremap <silent> <Plug>(MyCR) <CR><C-R>=AutoPairsReturn()<CR>
	" imap <expr> <CR> (pumvisible() ? "\<C-N>\<Plug>(MyCR)" : "\<Plug>(MyCR)")
	inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<Plug>(MyCR)", 'im')
endif
"}}}2
" * neocomplcache {{{2
if s:is_source("neocomplcache.vim")
	let g:neocomplcache_enable_at_startup = 1
endif
"}}}2
" * NERDCommenter {{{2
let NERDSpaceDelims = 1
"}}}2
" * Tagbar {{{2
let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 2
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 2
" let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_type_c = {
			\ 'kinds' : [
			\ 'd:macros:1:0',
			\ 'p:prototypes:1:0',
			\ 'f:functions:0:0',
			\ 'v:variables:1:0',
			\ 't:typedefs:1:0',
			\ 'g:enums:1:0',
			\ 'e:enumerators:1:0',
			\ 'u:unions:1:0',
			\ 's:structs:1:0',
			\ ],
			\ }
"}}}2
" * Tlist {{{2
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close=1
" let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
"}}}2
" * UltiSnips {{{
if s:is_source("ultisnips")
	let g:UltiSnipsExpandTrigger       = "<tab>"
	let g:UltiSnipsJumpForwardTrigger  = "<tab>"
	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
endif
" }}}
" * vim-lsp {{{
if s:is_source("vim-lsp")
	let g:lsp_diagnostics_enabled = 0
	let g:lsp_diagnostics_echo_cursor = 1
	let g:lsp_highlights_enabled = 1
	let g:lsp_textprop_enabled = 1
	let g:lsp_signs_enabled = 1
	let g:lsp_highlight_references_enabled = 0
	if executable('ccls')
		au User lsp_setup call lsp#register_server({
					\ 'name': 'ccls',
					\ 'cmd': {server_info->['ccls']},
					\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
					\ 'initialization_options': {},
					\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
					\ })
	endif
endif
" }}}
" * YCM {{{
if s:is_source("YouCompleteMe")
	"youcompleteme  默认tab  s-tab 和自动补全冲突
	"let g:ycm_key_list_select_completion=['<c-n>']
	let g:ycm_key_list_select_completion = ['<Down>']
	"let g:ycm_key_list_previous_completion=['<c-p>']
	let g:ycm_key_list_previous_completion = ['<Up>']
	let g:ycm_server_log_level = 'info'
	let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
	let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
	let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
	let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
	let g:ycm_collect_identifiers_from_tags_files = 1
	let g:ycm_cache_omnifunc = 0
	let g:ycm_show_diagnostics_ui = 0
	let g:ycm_min_num_identifier_candidate_chars = 3
	let g:ycm_key_invoke_completion = '<c-z>'
	noremap <c-z> <NOP>
	let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
	nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

	"let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开

	" 引入可以补全系统，以及python的第三方包
	let g:ycm_global_ycm_extra_conf = "~/.vim/global_conf.py"

	" 黑名单
	" let g:ycm_filetype_blacklist = {
				" \ 'tagbar' : 1,
				" \ 'gitcommit' : 1,
				" \ 'txt' : 1,
				" \}
	" 白名单
	" let g:ycm_filetype_blacklist = {
	let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "h":1,
			\ "sh":1,
			\ "py":1,
			\ "go":1,
			\ "lua":1,
			\ "java":1,
			\ }
	" 错误和警告使用不同的标志
	let g:ycm_error_symbol = '>>'
	let g:ycm_warning_symbol = '>'
endif
"}}}
"}}}1
" * Platform(Linux and Win) {{{1
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
		" colorscheme molokai
	else
		" set termguicolors
		set t_Co=256
		set background=dark
		colorscheme gruvbox
		" colorscheme molokai
	endif
else
	echoerr "Unknow System"
endif
"}}}1
" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1
