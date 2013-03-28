" Enable syntax highlighting
syntax on

" User colors
hi User1 cterm=bold ctermfg=4 guifg=#ffcc33 term=inverse,bold
hi User2 cterm=bold ctermfg=2 guifg=#99bbff
hi User3 cterm=bold ctermfg=6 guifg=#99ff00
hi User4 cterm=bold ctermfg=4 guifg=#ffcc33
hi User5 cterm=bold ctermfg=2 guifg=#99bbff

" Apply syntax highlight only if terminal has 16 colors
if &t_Co >= 16 
	hi User1 term=inverse,bold cterm=inverse,bold ctermfg=6
	hi User2 cterm=bold ctermfg=10
	hi User5 cterm=bold ctermfg=10
	hi User4 cterm=none ctermfg=3

	" Editable
	hi Type         ctermfg=2    cterm=none         ctermbg=none      term=none
	hi String       ctermfg=3    cterm=none         ctermbg=none      term=none
	hi PreProc      ctermfg=4    cterm=bold         ctermbg=none      term=none
	hi Include      ctermfg=4    cterm=underline,bold ctermbg=none    term=none
	hi Constant     ctermfg=5    cterm=bold         ctermbg=none      term=none
	hi Boolean      ctermfg=5    cterm=italic       ctermbg=none      term=none
	hi Error        ctermfg=9    cterm=inverse,bold ctermbg=none      term=none
	hi Todo         ctermfg=9    cterm=bold         ctermbg=none      term=none
	hi Statement    ctermfg=10   cterm=bold         ctermbg=none      term=none
	hi Operator     ctermfg=10   cterm=none         ctermbg=none      term=none
	hi Comment      ctermfg=11   cterm=bold         ctermbg=none      term=none
	hi Search       ctermfg=11   cterm=inverse      ctermbg=none      term=none
	hi Float        ctermfg=12   cterm=bold         ctermbg=none      term=none
	hi Character    ctermfg=12   cterm=bold         ctermbg=none      term=none
	hi Label        ctermfg=13   cterm=bold         ctermbg=none      term=none
	hi Special      ctermfg=13   cterm=none         ctermbg=none      term=none
	hi Number       ctermfg=14   cterm=bold         ctermbg=none      term=none
	hi Identifier   ctermfg=14   cterm=none         ctermbg=none      term=none
	hi Visual       ctermfg=none cterm=none         ctermbg=4         term=none
	hi Underlined   ctermfg=none cterm=underline    ctermbg=none      term=none

	" Ex
	hi Directory    ctermfg=10   cterm=bold         ctermbg=none      term=none

	" Buffer separation
	hi StatusLine   ctermfg=10   cterm=none         ctermbg=none      term=none
	hi StatusLineNC ctermfg=12   cterm=none         ctermbg=none      term=none
	hi VertSplit    ctermfg=3    cterm=none         ctermbg=none      term=none

	" Menu elements
	hi ModeMsg      ctermfg=14   cterm=bold         ctermbg=none      term=none
	hi MoreMsg      ctermfg=14   cterm=bold         ctermbg=none      term=none
	hi FoldColumn   ctermfg=14   cterm=none         ctermbg=none      term=none
	hi Folded       ctermfg=14   cterm=none         ctermbg=none      term=none
	hi PMenuSel     ctermfg=11   cterm=bold         ctermbg=none      term=none
	hi PMenuSbar    ctermfg=11   cterm=none         ctermbg=none      term=none
	hi LineNr       ctermfg=10   cterm=bold         ctermbg=none      term=none
	hi WildMenu     ctermfg=10   cterm=bold         ctermbg=none      term=none
	hi PMenuThumb   ctermfg=10   cterm=bold         ctermbg=none      term=none
	hi PMenu        ctermfg=10   cterm=none         ctermbg=none      term=none
	hi ErrorMsg     ctermfg=9    cterm=bold         ctermbg=none      term=none
	hi WarningMsg   ctermfg=9    cterm=italic       ctermbg=none      term=none
	hi SpecialKey   ctermfg=6    cterm=bold         ctermbg=none      term=none
	hi Question     ctermfg=4    cterm=italic       ctermbg=none      term=none
	hi Title        ctermfg=4    cterm=none         ctermbg=none      term=none

	" Diff
	hi DiffAdd      ctermfg=2    cterm=bold         ctermbg=none      term=none
	hi DiffChange   ctermfg=none cterm=none         ctermbg=none      term=none
	hi DiffDelete   ctermfg=1    cterm=bold         ctermbg=none      term=none
	hi DiffText     ctermfg=none cterm=none         ctermbg=4         term=none

	" Pgsql syntax fix
	hi clear pgsqlOperator
	hi clear perlOperator
	hi link  pgsqlOperator Operator 
	hi link  perlOperator  Operator 

	" Html syntax fix
	hi clear Underlined

	" Misc
	hi Include cterm=bold
else
	hi FoldColumn   term=none cterm=none ctermbg=none
	hi Folded       term=none cterm=none ctermbg=none
	hi StatusLine   term=none cterm=none ctermbg=none ctermfg=2
	hi StatusLineNC term=none cterm=none ctermbg=none ctermfg=4
	hi VertSplit    term=none cterm=none ctermbg=none ctermfg=2
endif

" Enable modeline
set modeline
set modelines=5

" Disable mouse
set mouse=

" Last window has statusline only if there are at least two windows
set laststatus=1

" Full path to file
set statusline=%3*%{RelPath()}%*%2*%f%*

" File state flags
set statusline+=%(\ %1*%m%w%r%y%*%)

" Move following to right
set statusline+=\ %=

" Line and column numbers
" set statusline+=\ \ %2*[%*%4*%l%*%2*,\ %*%4*%c%V%*%2*]%*

" Position from start (in percents)
set statusline+=\ %2*%P%*

" Ruler
set rulerformat=%50(%3*%{RelPath()}%*%5*%f%*%=%(\ %1*%m%w%r%y%*%)\ %2*%P%*%)
set ruler

" RegExp magic
set magic

" Show popup for completion variants
set wildmenu

" Do not try to be compatible
set nocompatible

" Fold code blocks
set foldenable
set foldmethod=syntax

" Folding in vim files
let g:vimsyn_folding='afp'
"                     |||   Perl scripts
"                     ||    Functions
"                     |     Autocommands

let g:vimsyn_noerror=1

" Help language
set helplang=en

" Turn off indentation
set noautoindent
set nosmartindent
set nocindent

" Tab config
set tabstop=4
set shiftwidth=4

" View perldoc in new window
function! PerlDoc()
	normal yy
	let l:line = @
	normal yiw
	let l:word = @
	exe ':new'
	if l:line =~ '^\v\s*(use|require)\s'
		exe ':resize'
		let l:line = substitute(l:line, '^\v\s*%(use|require)\s+(%(\w+\:\:)*\w+).*$', '\1', '')
		exe ':0r!perldoc -t '. l:line
	else
		" Get class name from lines
		" like   my $win = new Gtk2::Window;
		" or     my $win = Gtk2::Window->new();
		if l:line =~ '\v%(%(new\s+)@<=(%(\w+\:\:)*\w+))|\1\-\>new'
			if l:line =~ '\v((\w+\:\:)*\w+\-\>new)'
				let l:line = substitute(l:line, '^\v.*\s(%(\w+\:\:)*\w+)\-\>new.*$', '\1', '')
				echo l:line
			else
				let l:line = substitute(l:line, '^\v.*new\s+(%(\w+\:\:)*\w+).*$', '\1', '')
			endif
			exe ':resize'
			exe ':0r!perldoc -t '. l:line
		else
			exe ':0r!perldoc -t -f '. l:word
		endif
	endif
	normal :0
endfunction

" Pod navigation
function! PerlPod()
	let l:l1 = strpart(getline('.'), 0, col('.'))
	let l:l2 = strpart(getline('.'), col('.'))
	let l:l1 = matchstr(l:l1, '\v%(\w+\:\:)*\w+\:{0,2}$')
	let l:l2 = l:l1 . matchstr(l:l2, '^\v\:{0,2}%(\w+\:\:)*\w+')
	if l:l2 =~ '^\v((\w+\:\:)*\w+)$'
		exe ':q'
		exe ':new'
		exe ':resize'
		exe ':0r!perldoc -t '. l:l2
	endif
endfunction

" View vim help in new window
function! VimDoc()
	normal yiw
	exe ':help '. @
endfunction

" Smart tab
function! TabCmp()
	if col('.') > 1 && strpart(getline('.'), col('.')-2, 3) =~ '^\w'
		return "\<C-P>"
	else
		return "\<Tab>"
	endif
endfunction

" Tags completion
function! TagCmp()
	normal diw
	let word = @
	if word =~ '\v^(html|t?body|div|ul|li|d[ltd]|form|table|t[rdh]|h[1-6])$'
		exe 'normal a<'. word . '></' . word . ">\<ESC>bbl"
	elseif word =~ '^\v(img|br|input)$'
		exe 'normal a<'. word . "/>\<ESC>h"
	elseif word =~ '^\v(p)$'
		exe 'normal a<'. word . ">\<ESC>"
	else
		normal u
	endif
endfunction

" Get full path for statusline
function! RelPath()
	let l:full=expand("%:p")
	let l:rel=expand("%")
	let dir=getcwd()
	if dir != l:rel && l:full =~ '\m^\V'. dir && dir !~ '\m^\~' && l:rel !~ '\m^/'
		return dir.'/'
	else
		return ''
	endif
endfunction

" Transform colors from #FFF and #FFFFFF to rgba(255, 255, 255, 1.0)
function! Hex2rgb()
	normal yiw
	let l:s = @
	let l:s = substitute(l:s, '\c\v +$', '', 'g')
	echo strlen(l:s)

	if strlen(l:s) == 3
		let l:s = substitute(l:s, '\c\v([0-9A-F])', '\1\1', 'g')
	elseif strlen(l:s) != 6
		return ''
	endif

	normal bd2w

	let l:r = '0x'. strpart(l:s, 0, 2)
	let l:g = '0x'. strpart(l:s, 2, 2)
	let l:b = '0x'. strpart(l:s, 4, 2)
	return printf('rgba(%i, %i, %i, 1.0)', l:r, l:g, l:b)
endfunction

" Autocommands
if has('autocmd')
	if has('perl')
		" Folds and syntax for perl files
		let perl_fold=1
		let perl_fold_blocks=1
		let perl_nofold_packages=1
		let perl_no_extended_vars=1
		"let perl_want_scope_in_variables=1
		"let perl_include_pod=1

		augroup perl
			au!
			au FileType perl setlocal foldcolumn=5

			" Interpreter/debugger
			au FileType perl compiler perl
			au FileType perl setlocal makeprg=perl\ $*\ %
			au FileType perl nmap <buffer> <F9> :make -cw<CR>

			" Additional extensions
			au BufEnter *.bml  set filetype=perl
			au BufEnter *.tmpl set filetype=tmpl

			" Docs
			au FileType perl nmap <buffer> <F1> :call PerlDoc()<CR>:set nomod<CR>:set filetype=pod<CR><CR>
			au FileType pod  nmap <buffer> <F1> :call PerlPod()<CR>:set nomod<CR>:set filetype=pod<CR>1G
		augroup end
	endif

	augroup vim
		au!
		au FileType vim setlocal foldcolumn=2

		" Search help by word under cursor
		au FileType vim  nmap <buffer> <F1> :call VimDoc()<CR>:set nomod<CR>:set filetype=help<CR>

		" Apply vimrc settings on the fly
		au FileType vim  nmap <buffer> <F9> :source %<CR>

		" Help navigation
		au FileType help nmap <buffer> <F1> <C-]>
		au FileType help nmap <buffer> <F2> <C-T>
	augroup end

	augroup main
		au!
		" Expand\collapse folds by space
		au FileType perl,c,cpp,javascript,ruby,sh,vim,tt2,tt2html,css nmap <buffer> <SPACE> za

		" Highlight tabs
		au FileType perl,c,cpp,javascript,ruby,sh,vim,tt2,tt2html,css,sql,tmpl,html.epl,html,coffee,python setlocal list
		au FileType perl,c,cpp,javascript,ruby,sh,vim,tt2,tt2html,css,sql,tmpl,html.epl,html,coffee,python setlocal listchars=tab:\|\ 

		" Close brackets
		au FileType perl,c,cpp,javascript,ruby,sh,sql,html.epl,python             imap <buffer> [ []<LEFT>
		au FileType perl,c,cpp,javascript,ruby,sh,tt2,tt2html,sql,html.epl,python imap <buffer> { {}<LEFT>

		" Turn on indent
		au FileType perl,c,cpp,javascript,ruby,sh,html,vim,tex,css,html.epl,coffee,python setlocal autoindent
		au FileType perl,c,cpp,javascript,ruby,sh,html,python                             setlocal smartindent

		" Compiler
		au FileType ruby,c,cpp,tex nmap <buffer> <F9> :make!<CR>
	augroup end

	augroup javascript
		au!
		"au FileType javascript let g:javaScript_fold=1
		au FileType javascript setlocal foldcolumn=6
	augroup end

	" Use spaces instead of tabs on lj machines
	if hostname() =~ '^lj'
		augroup expandtab
			au!
			au FileType perl setlocal expandtab

			" Remove i option
			" to omit included files scan
			au FileType perl setlocal complete=.,w,b,u,t
		augroup end
	endif

	augroup tex
		au!
		au FileType tex setlocal foldcolumn=2
		au FileType tex set makeprg=pdflatex\ $*\ %
		au FileType tex nmap <buffer> <F3> :!evince %<.pdf <CR>
	augroup end

	augroup html
		au!
		au FileType tt2 set filetype=tt2html
		au FileType tt2html,html,html.epl nmap <buffer> <F3> :call TagCmp()<CR>i
		au FileType tt2html,html,html.epl imap <buffer> <F3> <ESC>:call TagCmp()<CR>i
		au FileType html.epl imap <% <%= %><LEFT><LEFT><LEFT><SPACE>
	augroup end

	augroup css
		au!
		au FileType css inoremap <buffer> { {<CR><TAB><CR>}<ESC><<ka
		" au FileType css inoremap <buffer> : :<SPACE>
		" au FileType css inoremap <buffer> ; ;<CR>
		au FileType css inoremap <buffer> , ,<SPACE>
		au FileType css imap     <buffer> <F3>  <C-R>=Hex2rgb()<CR>
		au FileType css nmap     <buffer> <F3> i<C-R>=Hex2rgb()<CR><ESC>
	augroup end

	augroup misc
		au!
		au FileType xdefaults set makeprg=xrdb\ $*\ %
		au FileType xdefaults nmap <buffer> <F9> :make!<CR><CR>
	augroup end

	augroup qfix
		au!
		au FileType qf nmap <buffer> <F5> :lnext<CR>
		au FileType qf nmap <buffer> <F6> :lprevious<CR>
		au FileType qf nmap <buffer> <F7> :lclose<CR>
	augroup end
endif

" Set window title
if has('title')
	set title
endif

" Do not replace tabs with spaces
set noexpandtab

" Show mode and commands
set showcmd
set showmode

" Show line numbers
set number

if has('extra_search')
	" Highlight search results
	set hlsearch

	" Use incomplete pattern to search
	set incsearch
endif

" Highlight matching bracket
set showmatch

set shortmess=asIWtT
"             |||||| Truncate messages in the middle if they are too long
"             |||||  Truncate file messages at start if they are too long
"             ||||   Do not give 'written' message
"             |||    Do not give intro message
"             ||     Do not give 'search hit BOTTOM' message
"             |      Use all abbreviation

" Filetype settings
filetype on
filetype plugin on
filetype indent off

" Move between windows
nmap J <C-w>j
nmap K <C-w>k
nmap L <C-w>l
nmap H <C-w>h

" Fast save
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i
vmap <F2> <ESC>:w<CR>v

" Turn off search results highlight
nmap <F3> :nohlsearch<CR>

" Toggle special characters visibility
nmap <F8> :set invlist<CR>

" Force quit
nmap <F10> :q!<CR>
imap <F10> <ESC>:q!<CR>
vmap <F10> <ESC>:q!<CR>

" Resize window
nmap <F11> :resize<CR>
imap <F11> <ESC>:resize<CR>i

" Ex
nmap <F12> :Ex<CR>

" Smart tab
inoremap <Tab> <C-R>=TabCmp()<CR>

" vim: set filetype=vim :
