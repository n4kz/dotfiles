" Enable syntax highlighting
syntax on

" Special variables for perl syntax
let perl_no_extended_vars      = 1
let perl_include_pod           = 1
let perl_no_scope_in_variables = 1

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

" Suppress vim syntax error highlighting
let g:vimsyn_noerror=1

" Help language
set helplang=en

" Turn on indentation
set autoindent
set smartindent

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

		" Interpreter/debugger
		au FileType perl compiler perl
		au FileType perl setlocal makeprg=perl\ $*\ %
		au FileType perl nmap <buffer> <F9> :make -cw<CR>

		" Docs
		au FileType perl nmap <buffer> <F1> :call PerlDoc()<CR>:set nomod<CR>:set filetype=pod<CR><CR>
		au FileType pod  nmap <buffer> <F1> :call PerlPod()<CR>:set nomod<CR>:set filetype=pod<CR>1G
	augroup end

	augroup vim
		au!

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

		" Compiler
		au FileType ruby,c,cpp,tex,coffee nmap <buffer> <F9> :make!<CR>
	augroup end

	augroup coffee
		au!
		au FileType coffee setlocal makeprg=coffee\ $*\ %
	augroup end

	augroup tex
		au!
		au FileType tex setlocal makeprg=pdflatex\ $*\ %
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

		" Some syntax files override this setting
		au BufEnter * setlocal tabstop=4
	augroup end
endif

" Set window title
if has('title')
	set title
endif

" Do not warn on shell command execution
set nowarn

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

" Fast save
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i

" Turn off search results highlight
nmap <F3> :nohlsearch<CR>

" Toggle special characters visibility
nmap <F4> :set invlist<CR>

" Commands for quickfix window
nmap <F5> :cprevious<CR>
nmap <F6> :cnext<CR>
nmap <F7> :cwindow<CR>

" Force quit
nmap <F10> :q!<CR>
imap <F10> <ESC>:q!<CR>
vmap <F10> <ESC>:q!<CR>

" Resize window
nmap <F11> :resize<CR>
imap <F11> <ESC>:resize<CR>i

" Ex
nmap <F12> :Ex<CR>

" Make
nmap ;m :!make<CR>

" Toggle GitGutter
nmap ;g :GitGutterToggle<CR>

" Toggle paste mode
nmap ;p :set invpaste<CR>

" Toggle line numbers
nmap ;n :set invnumber<CR>

" Toggle expandtab
nmap ;e :set invexpandtab<CR>

" Quit
nmap ;q :q<CR>

" Change active buffer (dwm)
nmap ;; <C-Space>

" Move between windows
nmap ;j <C-j>j
nmap ;k <C-k>k

" Smart tab
inoremap <Tab> <C-R>=TabCmp()<CR>

" Disabled airline extensions
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled      = 0

" Change gitgutter signs for removed lines
let g:gitgutter_sign_modified_removed = '~'

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
let g:airline_section_c = '%f'
let g:airline_section_y = '[%l, %c]'
let g:airline_section_z = '%P'

" Airline theme
let g:airline_theme = 'solarized'

" JSDoc syntax for JavaScript
let g:javascript_plugin_jsdoc = 1

" Flow syntax for JavaScript
let g:javascript_plugin_flow = 1

" Embedded JSX syntax for JavaScript
let g:jsx_ext_required = 0

" Load pathogen
runtime bundle/pathogen/autoload/pathogen.vim

" Init pathogen
execute pathogen#infect()

" Generate docs
Helptags

" Dark colorscheme variant
set background=dark

" Setup colorscheme
colorscheme solarized

" Load overrides
runtime vimrc.local

" Fix solarized colorscheme
if g:colors_name == 'solarized'
	" Remove background
	hi SignColumn ctermbg=none
	hi FoldColumn ctermbg=none
	hi LineNr     ctermbg=none
	hi Folded     ctermbg=none cterm=bold

	" Fix perl highlight
	hi! link perlStatementFiledesc perlStatement
	hi! link perlVarPlain          perlType
endif

" vim: set filetype=vim :
