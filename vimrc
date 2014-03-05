set nocompatible " no more legacy
set laststatus=2 " show status lines 2 lines up so I see it

" Vundle specifics
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundle 'less.vim'
Bundle 'groenewege/vim-less'
Bundle 'scrooloose/nerdtree'
Bundle 'gudleik/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tsaleh/vim-align'
Bundle 'altercation/vim-colors-solarized'
Bundle 'freitass/todo.txt-vim'
Bundle 'danchoi/ruby_bashrockets.vim'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ

"  Comments
set formatoptions-=cro " disables comment continuation

" Nerdtree should not open on load
let g:NERDTreeHijackNetrw=0

" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'

if has("gui_running")
  map <D-p> :execute 'CtrlP '<cr>
endif

let g:ctrlp_custom_ignore = '\v[\/]\.git$'

map <D-t> :tabnew<cr>
imap <D-t> <Esc>:tabnew<cr>

" Older .vimrc
let mapleader=","

set noswapfile  " medication for the herpes of text editing

set modeline
set modelines=2

set ignorecase " ignore case if all lowercase
set smartcase  " if some uppercase do not ignore case

set title " shows file name
set scrolloff=5  " pads lines for search results so we're never on edge of screen

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set ruler " shows cursor position
set number " shows numbers in left side

set showcmd " I think that shows the visual selection in the command area
set showmatch
set lazyredraw
set copyindent
set nobackup

" Don't wrap lines longer than the window's width
set nowrap
set linebreak
set sidescroll=5
set listchars+=precedes:<,extends:>

" ensure windows aren't crushed too small in split views
set winwidth=140     " active split
set winminwidth=10  " other splits

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" Automatically save all files on blur
autocmd BufLeave,FocusLost * silent! wall

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
set background=dark
colorscheme solarized
let g:solarized_termtrans=0
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_termcolors=256
set cursorline

function ToggleBackgroundColor()
  if !exists("g:solarized_background")
    let g:solarized_background = &background
  endif
  let g:solarized_background = ( g:solarized_background == "dark"? "light" : "dark" )
  if exists("g:colors_name")
    let l:colors_name = g:colors_name
    let &background = g:solarized_background
    let g:colors_name = l:colors_name
    exe "colorscheme " . g:colors_name
  endif
endfunction
map <Leader>b :call ToggleBackgroundColor()<CR>

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
map ; :nohlsearch<CR> " remove highlight

set list

autocmd BufWritePre * :%s/\s\+$//e " delete trailing space automatically
autocmd BufWritepre  *    set noinsertmode
autocmd FileType c        setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8 noautoindent smartindent " 8 spaces instead of my usual 2
autocmd FileType make     setlocal noexpandtab

autocmd BufNewFile,BufRead *.dryml setfiletype xml
autocmd BufNewFile,BufRead Gemfile setfiletype ruby

" set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*/vendor/*
set wildignore=*/tmp/*,*.so,*.swp,*.zip,.git,vendor/plugins

set shortmess=atI
set visualbell
set noerrorbells

" NERD_tree
map <Leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""

"Default to autoindenting of C like languages
"This is overridden per filetype below
set noautoindent smartindent

"The rest deal with whitespace handling and
"mainly make sure hardtabs are never entered
"as their interpretation is too non standard in my experience
set softtabstop=2
set tabstop=2
" Note if you don't set expandtab, vi will automatically merge
" runs of more than tabstop spaces into hardtabs. Clever but
" not what I usually want.
set expandtab
set shiftwidth=2
set shiftround
set nojoinspaces
set smarttab

""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""

"Syntax highlighting if appropriate
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set incsearch "For fast terminals can highlight search string as you type
endif

if &diff
  "I'm only interested in diff colours
  syntax off
endif

let g:ragtag_global_maps = 1

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1

"flag problematic whitespace (trailing and spaces before tabs)
"Note you get the same by doing let c_space_errors=1 but
"this rule really applys to everything.
highlight RedundantSpaces term=standout ctermbg=black guibg=black
match RedundantSpaces /\s\+$\| \+\ze\t/ "\ze sets end of match so only spaces highlighted
"use :set list! to toggle visible whitespace on/off
set listchars=tab:>-,trail:.,extends:>

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set filetype=ruby
au BufNewFile,BufRead *.jbuilder      set filetype=ruby

""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""

" align plugin stuff
call Align#AlignCtrl('W=|p1P1')
map <Leader>aa :Align =><CR>
map <Leader>ab :Align = <CR>
map <D-C-=> mzgg=G'z<Esc>

"allow deleting selection without updating the clipboard (yank buffer)
vnoremap x "_x
vnoremap X "_X

"<home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<CR>
nnoremap <silent> <home> :call Home()<CR>
function Home()
  let curcol = wincol()
  normal ^
  let newcol = wincol()
  if newcol == curcol
    normal 0
  endif
endfunction

"<end> goes to end of screen before end of line
imap <kend> <end>
nmap <kend> <end>
inoremap <silent> <end> <C-O>:call End()<CR>
nnoremap <silent> <end> :call End()<CR>
function End()
  let curcol = wincol()
  normal g$
  let newcol = wincol()
  if newcol == curcol
    normal $
  endif
  "The following is to work around issue for insert mode only.
  "normal g$ doesn't go to pos after last char when appropriate.
  "More details and patch here:
  "http://www.pixelbeat.org/patches/vim-7.0023-eol.diff
  if virtcol(".") == virtcol("$") - 1
    normal $
  endif
endfunction

if has("gui_running")
  " commenting
  map <D-/> Vgc<ESC>
  vmap <D-/> gc<ESC>

  "Ctrl-{up,down} to scroll.
  "The following only works in gvim?
  "Also vim doesn't have default C-{home,end} bindings?
  nmap <C-up> <C-y>
  imap <C-up> <C-o><C-y>
  nmap <C-down> <C-e>
  imap <C-down> <C-o><C-e>

  imap <D-]> <Esc><D-]>
endif

"
" window splitting mappings
nmap <Leader>v :vsplit<CR> <C-w><C-w>
" x
" PREFER SAVING EASILY
nmap <Leader>s :w<CR>

" <leader>S opens a scratch buffer
nmap <Leader>S :Scratch<CR>

" Activate yaml plugin on .yaml or .yml
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugin/yaml.vim

nmap <Leader>n :set number<CR>

" set ttimeoutlen=10
" set timeoutlen=150

" Auto-center the view on the next search term
nmap n nzz
nmap N Nzz

set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=1

" taken from http://stackoverflow.com/questions/13850914/vim-overloaded-mapping-for-multiple-modes
function! MapBoth(keys, rhs)
    execute 'nmap' a:keys a:rhs
    execute 'imap' a:keys '<C-o>' . a:rhs
endfunction

" Arrows baby
" http://stackoverflow.com/questions/8813855/in-vim-how-can-i-make-esc-and-arrow-keys-work-in-insert-mode/8815003#8815003
" nnoremap <Esc>A <up>
" nnoremap <Esc>B <down>
" nnoremap <Esc>C <right>
" nnoremap <Esc>D <left>
" inoremap <Esc>A <up>
" inoremap <Esc>B <down>
" inoremap <Esc>C <right>
" inoremap <Esc>D <left>

" fixing append in line
map <S-a> $a

" Easy window navigation
call MapBoth('<C-h>', '<C-w>h')
call MapBoth('<C-j>', '<C-w>j')
call MapBoth('<C-k>', '<C-w>k')
call MapBoth('<C-l>', '<C-w>l')

" easy tab navigation
nnoremap <S-h> gT
nnoremap <S-l> gt

" Restore Cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" FROM Gary Bernhardt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != 1 || match(current_file, '\<validators\>') != 1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = substitute(new_file, '\.jbuilder$', '_jbuilder_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_jbuilder_spec.rb', '.jbuilder', '')
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>/ :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>t :w\|:silent exe "! echo \"spring rspec --format documentation %\" > test-commands"<cr>
map <leader>l :w\|:silent exe "! echo \"spring rspec --format documentation " . "%" . ":" . line('.') . "\" > test-commands"<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    let alternate_file = AlternateForCurrentFile()
    if in_test_file
        let test_file = expand("%")
        call RunTests(test_file . command_suffix)
    else
        let test_file = alternate_file
        call RunTests(test_file . command_suffix)
    endif
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    exec ": silent !bundle exec spin push " . a:filename
    :redraw!
endfunction

" Allow ci( to work as desired
function New_cib()
    if search("(","bn") == line(".")
        sil exe "normal! f)ci("
        sil exe "normal! l"
        startinsert
    else
        sil exe "normal! f(ci("
        sil exe "normal! l"
        startinsert
    endif
endfunction

nnoremap ci( :call New_cib()<CR>
nnoremap cib :call New_cib()<CR>

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END
