"
" Joao M.C.Teixeira
" joaomcteixeira@gmail.com
" Vim'ing since 2019
"
" Search for "# to scroll headers
" topics are separated by 25 empty lines
"
" Plugins I use and how to install them, for Vim +8
"
" VimCompletesMe
" https://github.com/ajh17/VimCompletesMe
" to install simply run this in your home folder
" git clone git://github.com/ajh17/VimCompletesMe.git ~/.vim/pack/vendor/start/VimCompletesMe
"
" vim-eunuch
" https://github.com/tpope/vim-eunuch
" to install simply run this in your home folder
" git clone https://github.com/tpope/vim-eunuch ~/.vim/pack/tpope/start/vim-eunuch




















"# Basic Configurations
set nocompatible
set history=1000
set showcmd
set showmode
set nowrap
set nobackup
set undofile
" https://superuser.com/questions/163589
set hidden
set list

" https://stackoverflow.com/questions/1549263
" two possible solutions for the same problem
" 1
"silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
"silent !mkdir $HOME/.vim/swp > /dev/null 2>&1
" 2
silent !mkdir -p $HOME/.vim/undo
silent !mkdir -p $HOME/.vim/swp
set undodir=$HOME/.vim/undo//
set directory=$HOME/.vim/swp//


nnoremap ; :
"nnoremap : ;

" indentantion
"filetype plugin on
set tabstop=4 sts=4 shiftwidth=4 expandtab
"set number
set autoindent      "Keep indentation from previous line
"set smartindent     "Automatically inserts indentation in some cases
"set cindent         "Like smartindent, but stricter and more customisable
set foldmethod=indent  "commands, za, zo, zc, zR, zM
" https://vi.stackexchange.com/questions/8741/how-to-automatically-turn-off-hlsearch-after-im-done-searching
set linebreak
set hlsearch
"set ignorecase
"set smartcase
nnoremap <esc><esc> :silent! nohls<cr>

" other option
" call matchadd('ColorColumn', '\%v81v', 100)

" Line Numberig
" from https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" Status line
"function! GitBranch()
"  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
"endfunction

"Initially I had the GitBranch() and StatuslineGit() directly in the
"statusline, however: https://github.com/vim/vim/issues/3197
" So I decided to define the gitbranch as global variable prior to defining
" the statusline. I usually don't change branch while in vim. If I start using
" that feature, I will have to update this as well.
"
" other links:
" https://shapeshed.com/vim-statuslines
" https://stackoverflow.com/questions/8065777/is-it-possible-to-display-the-date-time-in-vim-over-putty
" https://stackoverflow.com/questions/28284276/how-i-can-show-the-time-in-vim-status-bar
" https://linux.die.net/man/3/strftime

let gitbranch_ = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

function! StatuslineGit()
  let l:branchname = g:gitbranch_
  return strlen(l:branchname) > 0?'['.l:branchname.']':''
endfunction

let gitbranch = StatuslineGit()

set laststatus=2
set statusline=%n\ %{gitbranch}\ %t\ %r%m%=\ %l\/%L\|%c\ %p%%\ \|\ %{strftime('%a\ %d\/%b\/%Y\ %H:%M\ %p')}




















"# Color Schemes
" useful links
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" https://jonasjacek.github.io/colors/

" Some colour schemes I like (apart from mine :-P)
" https://raw.githubusercontent.com/tacahiroy/vim-colors-isotake/master/colors/isotake.vim

" Show syntax highlighting groups for word under cursor
" With this function you can identify the syntax group name
" usage: control+p
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


syntax on
colorscheme codewise
"colorscheme jmctred

" notes from the past
"match ExtraWhitespace /\w\s\+$/
"match IndentSpace /^\s\+$/

" ************************* PYTHON ************************************
"" Datatypes
"highlight pythonString ctermbg=NONE ctermfg=94 cterm=NONE
"highlight pythonNumber ctermbg=None ctermfg=19 cterm=NONE
"" Expressions
"highlight link pythonTripleQuotes pythonString
"highlight link pythonQuotes pythonString
"highlight pythonFunction ctermbg=NONE ctermfg=28 cterm=bold
"highlight pythonStatement ctermbg=NONE ctermfg=0 cterm=bold
"highlight pythonDecorator ctermbg=NONE ctermfg=240 cterm=NONE
"highlight link pythonDecoratorName pythonDecorator
"highlight pythonBuiltin ctermbg=NONE ctermfg=54 cterm=none
"" Conditionals
"highlight pythonConditional ctermbg=NONE ctermfg=1 cterm=NONE
"highlight link pythonRepeat pythonConditional
"highlight link pythonExceptions pythonConditional
"highlight link pythonOperator pythonConditional
"highlight pythonException ctermbg=NONE ctermfg=0 cterm=bold
"" ********************************************************************* 
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
























"# Lint Syntax
"augroup LintSyntax
"    autocmd!
"    "autocmd BufReadPost,FileReadPost *.py syntax match trailwhitespace /\S\s\+$/
"    autocmd BufReadPost,FileReadPost *.py syntax match idblock /^\s\{4}$/
"    autocmd BufReadPost,FileReadPost *.py syntax match idblockB /^\s\{8}$/
"    autocmd BufReadPost,FileReadPost *.py syntax match idblockC /^\s\{12}$/
"    autocmd BufReadPost,FileReadPost *.py syntax match badindent /^\s\{1,3}\S/
"    autocmd BufReadPost,FileReadPost *.py syntax match badindentA /^\s\{5,7}\S/
"    autocmd BufReadPost,FileReadPost *.py syntax match badindentB /^\s\{9,11}\S/
"    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass1 /^\s*\w.*\n\{,2}\(def\|class\)\s/ 
"    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass2 /^\s*\w.*\n\{4,}\(def\|class\)\s/ 
"    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass3 /^\s*\w.*\n\s+\(def\|class\)\s/ 
"    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass4 /^\s*\w.*\n\{3,}\s+\(def\|class\)\s/ 
"    "autocmd BufReadPost,FileReadPost *.py syntax match ddef /\p\n\ndef\s/
"    "autocmd BufReadPost,FileReadPost *.py syntax match ddefa /\p\n\s*def\s/
"    "autocmd BufReadPost,FileReadPost *.py syntax match ddefb /\p\n\{4,}def\s/
"    "autocmd BufReadPost,FileReadPost *.py syntax match ddefc /\p\n\nclass\s/
"    "autocmd BufReadPost,FileReadPost *.py syntax match ddefd /\p\n\{4,}class\s/
"    autocmd BufReadPost,FileReadPost *.py syntax match mathwrong /\s=\(+\|-\|\/\|*\)\s/
"    "autocmd BufReadPost,FileReadPost *.py syntax match badcommenta /\S\s#/
"    "autocmd BufReadPost,FileReadPost *.py syntax match badcommentb /\S#/
"
"    "autocmd BufReadPost,FileReadPost *.py hi link trailwhitespace ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi idblock ctermbg=255 ctermfg=NONE cterm=NONE
"    autocmd BufReadPost,FileReadPost *.py hi link idblockB idblock
"    autocmd BufReadPost,FileReadPost *.py hi link idblockC idblock
"    autocmd BufReadPost,FileReadPost *.py hi link badindent ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link badindentA ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link badindentB ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link ddefclass1 ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link ddefclass2 ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link ddefclass3 ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link ddefclass4 ErrorMsg
"    autocmd BufReadPost,FileReadPost *.py hi link mathwrong ErrorMsg
"    "autocmd BufReadPost,FileReadPost *.py hi link badcommenta ErrorMsg
"    "autocmd BufReadPost,FileReadPost *.py hi link badcommentb ErrorMsg
"augroup END
























"# Fast mapping

" Navigation
nnoremap <S-f> <C-f>
nnoremap <S-b> <C-b>
nnoremap n nzz
nnoremap N Nzz





" New windows
nnoremap <Space>h :wincmd h<CR>
nnoremap <Space>j :wincmd j<CR>
nnoremap <Space>k :wincmd k<CR>
nnoremap <Space>l :wincmd l<CR>
nnoremap <Space>v :wincmd v <bar> :wincmd l<CR>
nnoremap <Space>s :wincmd s <bar> :wincmd j<CR>
nnoremap <Space>c :wincmd c<CR>
nnoremap <Space>b :1wincmd c<CR>
nnoremap <Space>= :wincmd =<cr>


" New tabs
let $tabcounter = 1

function! Sum()
  tabnew $tabcounter
  let $tabcounter = $tabcounter + 1
endfunction

nnoremap <tab>n :call Sum()<cr>
nnoremap <tab>l :tabnext<cr>
nnoremap <tab>h :tabprev<cr>
nnoremap <tab>c :tabclose<cr>























"# comma remaps
" opens a file browser windo on the left
"nnoremap ,e :1wincmd w <bar> :wincmd v <bar> :edit . <bar> :vertical resize 30<cr>
nnoremap ,b :buffers<cr>
nnoremap ,c :set cursorline! cursorcolumn!<cr>
nnoremap ,e :1wincmd w <bar> :30vs +Ex<cr>
nnoremap ,f :Flist<cr>
nnoremap ,j :up <bar> !java -jar ~/software/plantuml/plantuml.jar %:p -tsvg<cr>
nnoremap ,k :up <bar> !tox -e check -- %<cr>
nnoremap ,n :set number! relativenumber!<cr>
nnoremap ,p :up <bar> !python %:p<cr>
nnoremap ,q :s/(/(\r        /g <bar> s/, /,\r        /g <bar> s/\():\|)/)/,\r        ):/g<cr>
nnoremap ,r :e /home/joao/Dropbox/labo-documents/My_Books/Programming/python/python_recipes.py<cr>
nnoremap ,s :set spell! spelllang=en_us<cr>
nnoremap ,t :up <bar> !tox -e py37 -- %<cr>
nnoremap ,v :e /home/joao/GitHub/run_commands/vimrc<cr>
nnoremap ,w :set nowrap!<cr>
nnoremap ,y :up <bar> !tox -e py38 -- %<cr>
nnoremap ,z :%s/^\s*$/<cr><C-O>

"nnoremap ,R ... " this one is placed bellow in the R section

" plantUML bindings
" https://vi.stackexchange.com/questions/16094/add-a-block-of-text-to-end-of-lines
nnoremap ,1 mty}}pddbbdd't<C-V>}mb<BS>$A -down- <Esc>gvd'bjPkd't<C-V>}<BS>:%!column<Space>-t<Esc>
nnoremap ,2 {j<C-V>}<BS>:%!column<Space>-t<Esc>
nnoremap ,3 {j<C-V>}<BS>$:%sort<Esc>
nnoremap ,0 :colorscheme codewise<cr>





















"# Python specific commands

command! Flist g/^\s*\(def\|class\)\s/#

" https://stackoverflow.com/questions/57074531/vim-command-to-insert-multiline-text-with-argument
function! s:insert_pyclass(classname)
    let l:indent = repeat(' ', indent('.'))
    let l:text = [
        \ 'class <TMPL>:',
        \ '    """',
        \ '    """',
        \ '    def __init__(self):',
        \ '        """',
        \ '        Parameters',
        \ '        ----------',
        \ '        """',
        \ '        return',
    \ ]
    call map(l:text, {k, v -> l:indent . substitute(v, '\C<TMPL>', a:classname, 'g')})
    call append('.', l:text)
endfunction

command! -nargs=1 PClass :call <SID>insert_pyclass(<q-args>)

function! s:insert_pyfunc(funcname)
    let l:indent = repeat(' ', indent('.'))
    let l:text = [
        \ 'def <TMPL>():',
        \ '    """',
        \ '    Function description here.',
        \ '',
        \ '    Parameters',
        \ '    ----------',
        \ '',
        \ '    Returns',
        \ '    -------',
        \ '    """',
        \ '',
        \ '    return',
    \ ]
    call map(l:text, {k, v -> l:indent . substitute(v, '\C<TMPL>', a:funcname, 'g')})
    call append('.', l:text)
endfunction

command! -nargs=1 Pfunc :call <SID>insert_pyfunc(<q-args>)



























"# R commands and related
nnoremap ,R :up <bar> :let b:RMARKTMP="!R -e rmarkdown::render\"('" . expand("%:t") . "', output_file='" . expand("%:t:r") . ".html'" . ")\"" <bar> :execute b:RMARKTMP






































"# File Browsing
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

" from https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
" General MakeTags that excludes building folders
command! MakeTagsG !universal-ctags -R
    \ --exclude=.git
    \ --exclude=.tox
    \ --exclude=alphas
    \ --exclude=build
    \ --exclude=dist
    \ --exclude=docs
    \ --exclude=htmlcov
    \ --exclude=pip-wheel-metadata
    \ .

" specific for my Python projects
command! MakeTags !universal-ctags -R src/ tests/

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" https://vi.stackexchange.com/questions/14622
let g:netrw_fastbrowse = 0
"let g:netrw_winsize = 25

























"# Spell Checking
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType rst setlocal spell spelllang=en_us
command! Spell setlocal spell! spelllang=en_us


























"# GitHub Integration commands

function! s:GitCommit()
  !git add %
  !git commit
endfunction

command! Commit :call <SID>GitCommit()
command! Push !git push origin






"# Relevant Links
" https://stackoverflow.com/questions/16768059/how-to-understand-these-vim-scripts
" https://www.youtube.com/watch?v=aHm36-na4-4

"# Plugins to consider
" https://github.com/maxboisvert/vim-simple-complete
