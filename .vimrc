" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" multi-encoding setting
"let g:vjde_iab_exts='java'
"let g:vjde_cfu_java_dot=1
"let g:vjde_cfu_java_para=1
"let g:vjde_show_preview=1 

behave mswin
"source /home/users/sshao/.vim/mswin.vim
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          _
"      __ | \
"     /   | /
"     \__ | \
" by Amix - http://amix.dk/
"
" Maintainer:	Amir Salihefendic <amix3k at gmail.com>
" Version: 2.0
" Last Change: 12/08/06 13:39:28
"
" Sections:
" ----------------------
"   *> General
"   *> Colors and Fonts
"   *> Fileformats
"   *> VIM userinterface
"   ------ *> Statusline
"   *> Visual
"   *> Moving around and tabs
"   *> General Autocommands
"   *> Parenthesis/bracket expanding
"   *> General Abbrevs
"   *> Editing mappings etc.
"   *> Command-line config
"   *> Buffer realted
"   *> Files and backups
"   *> Folding
"   *> Text options
"   ------ *> Indent
"   *> Spell checking
"   *> Plugin configuration
"   ------ *> Yank ring
"   ------ *> File explorer
"   ------ *> Minibuffer
"   ------ *> Tag list (ctags) - not used
"   ------ *> LaTeX Suite things
"   *> Filetype generic
"   ------ *> Todo
"   ------ *> VIM
"   ------ *> HTML related
"   ------ *> Ruby & PHP section
"   ------ *> Python section
"   ------ *> Cheetah section
"   ------ *> Java section
"   ------ *> JavaScript section
"   ------ *> C mappings
"   ------ *> SML
"   ------ *> Scheme bindings
"   *> Snippets
"   ------ *> Python
"   ------ *> javaScript
"   *> Cope
"   *> MISC
"
"  Tip:
"   If you find anything that you can't understand than do this:
"   help keyword OR helpgrep keywords
"  Example:
"   Go into command-line mode and type helpgrep nocompatible, ie.
"   :helpgrep nocompatible
"   then press <leader>c to see the results, or :botright cw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

func! MySys()
  return "linux"
endfunc

"Set shell to be bash
if MySys() == "linux" || MySys() == "mac"
  "set shell=bash
else
  set shell=C:\cygwin\bin\sh
endif

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :retab <cr> :w!<cr>
"nmap <leader>f :e ~/buffer<cr>
"Quit All
nmap <leader>e :qa!<cr>
"Remove Highlight
nmap <leader>h :noh<cr>

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>v :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
"autocmd! bufwritepost vimrc source ~/vim_local/vimrc

"delete to end of the file
"map <leader>d :.,$ d<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

colorscheme ron

if has("gui_running")
  set guioptions-=T
  let psc_style='cool'
else
  set background=dark
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=sqlanywhere<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

autocmd BufEnter * :syntax sync fromstart

"Highlight current
if has("gui_running")
  "set cursorline
  "hi cursorline guibg=#333333 
  "hi CursorColumn guibg=#333333
endif

"Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

"Pattern matching
hi MatchParen guifg=#000000 guibg=#D0D090 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
"set cmdheight=2

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

  """"""""""""""""""""""""""""""
  " => Statusline
  """"""""""""""""""""""""""""""
  "Always hide the statusline
  set laststatus=2

  function! CurDir()
     let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
     return curdir
  endfunction

  "Format the statusline
  set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L



""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
"map <space> /
"map <c-space> ?

"Smart way to move btw. windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"Actually, the tab does not switch buffers, but my arrows
"Bclose function ca be found in "Buffer related" section
map <leader>q :Bclose<cr>
"map <down> <leader>bd
"Use the arrows to something usefull
nmap <tab> :bn<cr>
nmap <C-z> :bn<cr>
nmap <C-x> :bp<cr>
"map <right> :bn<cr>
"map <left> :bp<cr>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
"set switchbuf=usetab
"set stal=2

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
inoremap $1 ()<esc>:let leavechar=")"<cr>i
inoremap $2 []<esc>:let leavechar="]"<cr>i
inoremap $4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap $3 {}<esc>:let leavechar="}"<cr>i
inoremap $q ''<esc>:let leavechar="'"<cr>i
inoremap $w ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(vim\)\@! inoremap " ""<esc>:let leavechar='"'<cr>i
au BufNewFile,BufRead *.\(txt\)\@! inoremap ' ''<esc>:let leavechar="'"<cr>i

imap <m-l> <esc>:exec "normal f" . leavechar<cr>a
imap <d-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Comment for C like languages
autocmd BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css inoremap $c /**<cr>  **/<esc>O

"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Amir Salihefendic


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $$ e ./

cno $q <C-\>eDeleteTillSlash()<cr>

cno $c e <C-\>eCurrentFileDir("e")<cr>

cno $tc <C-\>eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
map <c-q> :sb 

"Open a dummy buffer for paste
"map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Buffer - reverse everything ... :)
"map <F9> ggVGg?

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile
set noar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set fen
"set fdl=0
set foldlevelstart=20


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
"set shiftwidth=2
"set softtabstop=2
"set tabstop=2
set shiftwidth=4
set softtabstop=4
set tabstop=4

set backspace=2
set smarttab
set lbr
set tw=500

   """"""""""""""""""""""""""""""
   " => Indent
   """"""""""""""""""""""""""""""
   "Auto indent
   set ai

   "Smart indet
   set si

   "C-style indeting
   set cindent

   "Wrap lines
   set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """"""""""""""""""""""""""""""
   " => Yank Ring
   """"""""""""""""""""""""""""""
   map <leader>y :YRShow<cr>

   """"""""""""""""""""""""""""""
   " => File explorer
   """"""""""""""""""""""""""""""
   "Split vertically
   let g:explVertical=1

   "Window size
   let g:explWinSize=35

   let g:explSplitLeft=1
   let g:explSplitBelow=1

   "Hide some files
   let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'

   "Hide the help thing..
   let g:explDetailedHelp=0


   """"""""""""""""""""""""""""""
   " => Minibuffer
   """"""""""""""""""""""""""""""
   "let g:miniBufExplorerMoreThanOne = 0
   "let g:miniBufExplModSelTarget = 0
   "let g:miniBufExplUseSingleClick = 1
   "let g:miniBufExplMapWindowNavVim = 1
""   let g:miniBufExplVSplit = 25
   "let g:miniBufExplSplitBelow=0

   "WindowZ
"   map <c-w><c-t> :WMToggle<cr>

"   let g:bufExplorerSortBy = name

   let g:Tb_MoreThanOne=0
   let g:Tb_ModSelTarget = 1
   """"""""""""""""""""""""""""""
   " => Tag list (ctags) - not used
   """"""""""""""""""""""""""""""
   let Tlist_Ctags_Cmd = "ctags"
   "let Tlist_Auto_Highlight_Tag = 0
   "let Tlist_Sort_Type = "name"
   "let Tlist_Show_Menu = 1
   "map <leader>t :Tlist<cr>


   """"""""""""""""""""""""""""""
   " => LaTeX Suite things
   """"""""""""""""""""""""""""""
   set grepprg=grep\ -nH\ $*
   let g:Tex_DefaultTargetFormat="pdf"
   let g:Tex_ViewRule_pdf='xpdf'

   "Bindings
   autocmd BufRead *.tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

   "Auto complete some things ;)
   autocmd BufRead *.tex inoremap $i \indent 
   autocmd BufRead *.tex inoremap $* \cdot 
   autocmd BufRead *.tex inoremap $i \item 
   autocmd BufRead *.tex inoremap $m \[<cr>\]<esc>O


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   " => Todo
   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim

   """"""""""""""""""""""""""""""
   " => VIM
   """"""""""""""""""""""""""""""
   autocmd BufRead,BufNew *.vim map <buffer> <leader><space> :w!<cr>:source %<cr>
   

   """"""""""""""""""""""""""""""
   " => HTML related
   """"""""""""""""""""""""""""""
   " HTML entities - used by xml edit plugin
   let xml_use_xhtml = 1
   "let xml_no_auto_nesting = 1

   "To HTML
   let html_use_css = 1
   let html_number_lines = 0
   let use_xhtml = 1


   """"""""""""""""""""""""""""""
   " => Ruby & PHP section
   """"""""""""""""""""""""""""""
   autocmd BufRead *.rb map <buffer> <leader><space> :w!<cr>:!ruby %<cr>
   autocmd BufNewFile,BufRead *.php compiler php
   autocmd BufNewFile,BufRead *.php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
   autocmd BufNewFile,BufRead *.php map <buffer> <F8> <leader>cd:!php %<cr>


   """"""""""""""""""""""""""""""
   " => Python section
   """"""""""""""""""""""""""""""
   "Run the current buffer in python - ie. on leader+space
   "au BufNewFile,BufRead *.py so ~/vim_local/syntax/python.vim
   autocmd BufNewFile,BufRead *.py map <buffer> <leader><space> :w!<cr>:!python %<cr>
   "autocmd BufNewFile,BufRead *.py so ~/vim_local/plugin/python_fold.vim

   "Set some bindings up for 'compile' of python
   autocmd BufNewFile,BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
   autocmd BufNewFile,BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
   autocmd BufNewFile,BufRead *.py nmap <buffer> <F8> :w!<cr>:make<cr>

   "Python iMaps
   au BufNewFile,BufRead *.py set cindent
   au BufNewFile,BufRead *.py inoremap <buffer> $r return 
   au BufNewFile,BufRead *.py inoremap <buffer> $s self 
   au BufNewFile,BufRead *.py inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
   au BufNewFile,BufRead *.py inoremap <buffer> $i import 
   au BufNewFile,BufRead *.py inoremap <buffer> $p print 
   au BufNewFile,BufRead *.py inoremap <buffer> $d """<cr>"""<esc>O

   "Run in the Python interpreter
   function! Python_Eval_VSplit() range
     let src = tempname()
     let dst = tempname()
     execute ": " . a:firstline . "," . a:lastline . "w " . src
     execute ":!python " . src . " > " . dst
     execute ":pedit! " . dst
   endfunction
   au BufNewFile,BufRead *.py vmap <F7> :call Python_Eval_VSplit()<cr> 


   """"""""""""""""""""""""""""""
   " => Cheetah section
   """""""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.tmpl set ft=xml
   autocmd BufNewFile,BufRead *.tmpl set syntax=cheetah


   """""""""""""""""""""""""""""""
   " => Java section
   """""""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.java compiler ant
   autocmd BufNewFile,BufRead *.java map <buffer> <F8> :make 

   "Java iMaps
   au BufNewFile,BufRead *.java :inoremap <buffer> <C-t> System.out.println();<esc>hi

   "Java comments
   autocmd FileType java let b:jcommenter_class_author='ssl'
   autocmd FileType java let b:jcommenter_file_author='ssl'
"   autocmd BufNewFile,BufRead *.java source /usr/share/vim/vim70/plugin/jcommenter.vim
   autocmd BufNewFile,BufRead *.java map <buffer> <F4> :call JCommentWriter()<cr>

   "Abbr'z
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $m public static void main(String[] args) {<cr>}<esc>O<Space>
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $c public class {<cr>}<esc>k$hi<space>
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $pr private
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $r return
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $pu public
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $i import
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $b boolean
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $v void
   autocmd BufNewFile,BufRead *.java inoremap <buffer> $s String


   """"""""""""""""""""""""""""""
   " => JavaScript section
   """""""""""""""""""""""""""""""
"   au BufNewFile,BufRead *.js so ~/vim_local/syntax/javascript.vim
   function! JavaScriptFold() 
     set foldmethod=marker
     set foldmarker={,}
     set foldtext=getline(v:foldstart)
   endfunction
   au BufNewFile,BufRead *.js call JavaScriptFold()
   au BufNewFile,BufRead *.js imap <c-t> console.log();<esc>hi
   au BufNewFile,BufRead *.js imap <c-a> alert();<esc>hi
   au BufNewFile,BufRead *.js set nocindent
   au BufNewFile,BufRead *.js inoremap <buffer> $r return 

   au BufNewFile,BufRead *.js inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space> 
   au BufNewFile,BufRead *.js inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka


   """"""""""""""""""""""""""""""
   " => C mappings
   """""""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.c map <buffer> <leader><space> :w<cr>:!gcc %<cr>
   autocmd BufNewFile,BufRead *.c map <buffer> <F8> :!./a.out<cr>


   """""""""""""""""""""""""""""""
   " => SML
   """""""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.sml map <silent> <buffer> <leader><space> <leader>cd:w<cr>:!sml %<cr>


   """"""""""""""""""""""""""""""
   " => Scheme bidings
   """"""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.scm map <buffer> <leader><space> <leader>cd:w<cr>:!petite %<cr>
   autocmd BufNewFile,BufRead *.scm inoremap <buffer> <C-t> (pretty-print )<esc>i
   autocmd BufNewFile,BufRead *.scm vnoremap <C-t> <esc>`>a)<esc>`<i(pretty-print <esc>


""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""
   "You can use <c-j> to goto the next <++> - it is pretty smart ;)

   """""""""""""""""""""""""""""""
   " => Python
   """""""""""""""""""""""""""""""
   autocmd BufNewFile,BufRead *.py inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("def <++>(<++>):\n<++>\nreturn <++>")<cr>
   autocmd BufRead,BufNewFile *.py inorea <buffer> cclass <c-r>=IMAP_PutTextWithMovement("class <++>:\n<++>")<cr>
   autocmd BufRead,BufNewFile *.py inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for <++> in <++>:\n<++>")<cr>
   autocmd BufRead,BufNewFile *.py inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>")<cr>
   autocmd BufRead,BufNewFile *.py inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if <++>:\n<++>\nelse:\n<++>")<cr>


   """""""""""""""""""""""""""""""
   " => JavaScript
   """""""""""""""""""""""""""""""
   autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("function <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm,*.js inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>


   """""""""""""""""""""""""""""""
   " => HTML
   """""""""""""""""""""""""""""""
   autocmd BufRead,BufNewFile *.tmpl,*.htm inorea <buffer> cahref <c-r>=IMAP_PutTextWithMovement('<a href="<++>"><++></a>')<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm inorea <buffer> cbold <c-r>=IMAP_PutTextWithMovement('<b><++></b>')<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm inorea <buffer> cimg <c-r>=IMAP_PutTextWithMovement('<img src="<++>" alt="<++>" />')<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm inorea <buffer> cpara <c-r>=IMAP_PutTextWithMovement('<p><++></p>')<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm inorea <buffer> ctag <c-r>=IMAP_PutTextWithMovement('<<++>><++></<++>>')<cr>
   autocmd BufRead,BufNewFile *.tmpl,*.htm inorea <buffer> ctag1 <c-r>=IMAP_PutTextWithMovement("<<++>><cr><++><cr></<++>>")<cr>


   """""""""""""""""""""""""""""""
   " => Java
   """""""""""""""""""""""""""""""
   autocmd BufRead,BufNewFile *.java inorea <buffer> cfun <c-r>=IMAP_PutTextWithMovement("public <++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr> 
   autocmd BufRead,BufNewFile *.java inorea <buffer> cfunpr <c-r>=IMAP_PutTextWithMovement("private <++> <++>(<++>) {\n<++>;\nreturn <++>;\n}")<cr> 
   autocmd BufRead,BufNewFile *.java inorea <buffer> cfor <c-r>=IMAP_PutTextWithMovement("for(<++>; <++>; <++>) {\n<++>;\n}")<cr> 
   autocmd BufRead,BufNewFile *.java inorea <buffer> cif <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}")<cr> 
   autocmd BufRead,BufNewFile *.java inorea <buffer> cifelse <c-r>=IMAP_PutTextWithMovement("if(<++>) {\n<++>;\n}\nelse {\n<++>;\n}")<cr>

   autocmd BufRead,BufNewFile *.tmpl,*.js,*.htm inoremap $r return 

   "Presse c-q insted of space (or other key) to complete the snippet
   imap <C-q> <C-]>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Cope
map <silent> <leader><cr> :noh<cr>

"Orginal for all
map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>c :botright cw 10<cr>
"map <c-u> <c-l><c-j>:q<cr>:botright cw 10<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"A function that inserts links & anchors on a TOhtml export.
" Notice:
" Syntax used is:
"   *> Link
"   => Anchor
function! SmartTOHtml()
   TOhtml
   try
    %s/&quot;\s\+\*&gt; \(.\+\)</" <a href="#\1" style="color: cyan">\1<\/a></g
    %s/&quot;\(-\|\s\)\+\*&gt; \(.\+\)</" \&nbsp;\&nbsp; <a href="#\2" style="color: cyan;">\2<\/a></g
    %s/&quot;\s\+=&gt; \(.\+\)</" <a name="\1" style="color: #fff">\1<\/a></g
   catch
   endtry
   exe ":write!"
   exe ":bd"
endfunction

"ssl map F2 to omni
imap <F2> <C-X><C-O>
imap <F3> <C-N><C-P>
"map <F4> :NERDTreeClose<cr>
map <F5> :call MyDirTree()<cr>
fun! MyDirTree()
    if exists("t:NERDTreeWinName")
        if bufwinnr(t:NERDTreeWinName) > 0
            :NERDTreeClose
            wincmd j
        else
            :NERDTree
        endif
    else
        :NERDTree
    endif
endfunction
map <F6> :q<cr>
map <F12> :Tlist<cr>
map <F10> <C-W>w

"" file types
au BufNewFile,BufRead *.vw set filetype=sql
au BufNewFile,BufRead *.tbl set filetype=sql
au BufNewFile,BufRead *.idx set filetype=sql
au BufNewFile,BufRead *.gnt set filetype=sql
au BufNewFile,BufRead *.pr set filetype=sql
au BufNewFile,BufRead *.tr set filetype=sql
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.tt set filetype=html syntax=tt2html
au BufNewFile,BufRead *.tmpl set filetype=html syntax=tt2html

" toggle paste / mouse mode
nmap <leader>p :call InvertPasteAndMouse()<CR>
fun! InvertPasteAndMouse()
    if &mouse == ''
        set mouse=a | set nopaste
        echo "mouse mode on, paste mode off"
    else
        set mouse= | set paste
        echo "mouse mode off, paste mode on"
    endif
endfunction 

" toggle line number mode
nmap <leader>n :call LineNumber()<CR>
fun! LineNumber()
    if &nu < 1
        set nu
        echo "line number on."
    else
        set nonu
        echo "line number off."
    endif
endfunction 

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

set fileencodings=ucs-bom,utf8,GB18030,Big5,latin1
