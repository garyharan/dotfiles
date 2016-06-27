set nocompatible " no more legacy
set laststatus=2 " show status lines 2 lines up so I see it

" Vundle specifics
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required
Plugin 'gmarik/Vundle'

Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'danchoi/ruby_bashrockets.vim'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tsaleh/vim-align'
Plugin 'altercation/vim-colors-solarized'
Plugin 'freitass/todo.txt-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular' " Aligns csv files
Plugin 'terryma/vim-expand-region'
Plugin 'kennethzfeng/vim-raml'

" FROM https://github.com/garbas/vim-snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'elixir-lang/vim-elixir'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ

"  Comments
set formatoptions-=cro " disables comment continuation

" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase  = 1

" ExpandRegion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Rubocop
map <Leader>r :!rubocop -a %<CR>


" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" CtrlP
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_height = 40


if has("gui_running")
  map <D-p> :execute 'CtrlP '<cr>

  " avoids the unwanted substitution press enter key or type command to continue message
  map <D-s> :w<cr>
  imap <D-s> <esc>:w<cr>
endif

" http://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
if executable('ag')
  set grepprg='ag\ --nogroup\ --nocolor'
  let g:ctrlp_user_command='ag %s -l --nocolor --hidden -g ""'
  let g:ctrlp_use_caching = 0
end
let g:ctrlp_custom_ignore = 'spec/cassettes\|.git'

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
set linebreak
set sidescroll=5
set listchars+=precedes:<,extends:>

" ensure windows aren't crushed too small in split views
set winwidth=120     " active split
set winminwidth=80  " other splits
map <C-=> :winc

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
set cursorline

" Solarized
let g:solarized_termcolors=256 " http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized

colorscheme solarized

set background=dark

call togglebg#map('<Leader>b')
syntax enable

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
map ; :nohlsearch<CR> " remove highlight

set list

au BufRead,BufNewFile *.hamlc set ft=haml

autocmd BufWritePre * :%s/\s\+$//e " delete trailing space automatically
autocmd BufWritepre  *    set noinsertmode
autocmd FileType c        setlocal noexpandtab shiftwidth=8 softtabstop=8 tabstop=8 noautoindent smartindent " 8 spaces instead of my usual 2
autocmd FileType make     setlocal noexpandtab

autocmd BufNewFile,BufRead *.dryml setfiletype xml
autocmd BufNewFile,BufRead Gemfile setfiletype ruby

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
function! Home()
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
function! End()
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

" window splitting mappings
nmap <Leader>v :vsplit<CR> <C-w><C-w>
" x
" PREFER SAVING EASILY
" nmap <Leader>s :w<CR>

" <leader>S opens a scratch buffer
nmap <Leader>S :Scratch<CR>

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

" fixing append in line
map <S-a> $a

" Easy window navigation
call MapBoth('<C-h>', '<C-w>h')
call MapBoth('<C-j>', '<C-w>j')
call MapBoth('<C-k>', '<C-w>k')
call MapBoth('<C-l>', '<C-w>l')

function! AutoWidth()
  let curwidth=system("wc -l " . bufname("%") . " | awk '{print $1}' ")
  let curwidth=curwidth + 1
  execute ":vertical resize " . curwidth
endfunction

map <leader>w :call AutoWidth()<cr>

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
  return AlternateForFile(expand("%"))
endfunction

function! AlternateForFile(filename)
  let new_file      = a:filename

  if new_file ==? 'Gemfile'
    return 'Gemfile.lock'
  elseif new_file ==? 'Gemfile.lock'
    return 'Gemfile'
  end

  if a:filename !~ '^spec/'
    let new_file = substitute(new_file, '^app/',  'spec\/',      '')
    let new_file = substitute(new_file, '^lib/',  'spec\/lib\/', '')
    let new_file = substitute(new_file, '\.rb',   '_spec\.rb',   '')
  else
    let new_file = substitute(new_file, '^spec\/lib\/',   'lib\/', '')
    let new_file = substitute(new_file, '^spec\/',        'app\/', '')
    let new_file = substitute(new_file, '_spec\.rb',      '\.rb',  '')
  end

  return new_file
endfunction

function! AssertEquality(value, expectation)
  if a:value != a:expectation
    echoerr a:value . ' does not match ' . a:expectation
  endif
endfunction

function! TestAlternateForFile()
  call AssertEquality(AlternateForFile('spec/lib/adwords/api_spec.rb'), 'lib/adwords/api.rb')
  call AssertEquality(AlternateForFile('lib/adwords/api.rb'),           'spec/lib/adwords/api_spec.rb')
  call AssertEquality(AlternateForFile('app/controllers/application_controller.rb'), 'spec/controllers/application_controller_spec.rb')
  call AssertEquality(AlternateForFile('Gemfile'), 'Gemfile.lock')
endfunction

call TestAlternateForFile()

nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>/ :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>t :w\|:silent exe "! echo \"spring rspec --format documentation %\" > test-commands"<cr>
map <leader>l :w\|:silent exe "! echo \"spring rspec --format documentation " . "%" . ":" . line('.') . "\" > test-commands"<cr>

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
function! New_cib()
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


iab xdate     <c-r>=strftime("%d/%m/%y")<cr>
iab xdatetime <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


if !exists( "*RubyEndToken" )

  function RubyEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction

endif

imap <buffer> <CR> <C-R>=RubyEndToken()<CR>
