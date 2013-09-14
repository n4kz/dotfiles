" Enable syntax highlighting
syntax on

" Special variables for perl syntax
let perl_fold             = 1
let perl_fold_blocks      = 1
let perl_nofold_packages  = 1
let perl_no_extended_vars = 1
let perl_include_pod      = 1

" Enable modeline
set modeline
set modelines=5

" Highlight tabs
set listchars=tab:\|\ ,trail:.

" Disable mouse
set mouse=

" Show statusline always
set laststatus=2

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

" Autocommands
if has('autocmd')
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
		au FileType javascript setlocal foldcolumn=5
	augroup end

	augroup tex
		au!
		au FileType tex setlocal foldcolumn=2
		au FileType tex set makeprg=pdflatex\ $*\ %
		"au FileType tex nmap <buffer> <F8> :!evince %<.pdf <CR>
	augroup end

	augroup html
		au!
		au FileType tt2 set filetype=tt2html
		au FileType html.epl imap <% <%= %><LEFT><LEFT><LEFT><SPACE>
	augroup end

	augroup css
		au!
		au FileType css inoremap <buffer> { {<CR><TAB><CR>}<ESC><<ka
		au FileType css inoremap <buffer> , ,<SPACE>
	augroup end

	augroup misc
		au!
		au FileType xdefaults set makeprg=xrdb\ $*\ %
		au FileType xdefaults nmap <buffer> <F9> :make!<CR><CR>

		" Some syntax files override this setting
		au BufEnter * setlocal tabstop=4
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

" Show commands and mode
set showcmd
set showmode

" Show line numbers
set number

" Keep two lines above and below cursor
set scrolloff=2

" Remove i option
" to omit included files scan for completion
set complete=.,w,b,u,t

" Fix backspace
set backspace=indent,eol,start

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
nmap 'j <C-w>j
nmap 'k <C-w>k
nmap 'l <C-w>l
nmap 'h <C-w>h

" Fast save
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

" Turn off search results highlight
nmap <F3> :nohlsearch<CR>

" Toggle special characters visibility
nmap <F4> :set invlist<CR>

" Toggle GitGutter
nmap <F8> :GitGutterToggle<CR>

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

" Disabled airline extensions
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled      = 0

" Change gitgutter signs for removed lines
let g:gitgutter_sign_modified_removed = '~̲'

" One char modes
let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '' : 'S',
\ }

" Airline settings
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_c = '%t'
let g:airline_section_y = '[%l, %c]'
let g:airline_section_z = '%P'

" Airline theme
let g:airline_theme = 'bubblegum'

" Load pathogen
runtime bundle/pathogen/autoload/pathogen.vim

" Init pathogen
execute pathogen#infect()

" Generate docs
Helptags

" Load overrides
runtime vimrc.local

" vim: set filetype=vim :
