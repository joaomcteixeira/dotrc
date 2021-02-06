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





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"# pre set commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme codewise

" https://stackoverflow.com/questions/1549263
silent !mkdir -p $HOME/.vim/undo  "silent !mkdir $HOME/.vim/undo > /dev/null 2>&1
silent !mkdir -p $HOME/.vim/swp  "silent !mkdir $HOME/.vim/swp > /dev/null 2>&1
silent !mkdir -p $HOME/.vim/view



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"# set commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=1000
set showcmd
set showmode
set nowrap
set linebreak  " combines with wrap when active
set nobackup
set noswapfile
set undofile
set hidden " switch buffer without saving https://superuser.com/questions/163589
set list  " show whitespaces as characters
set undodir=$HOME/.vim/undo//
set directory=$HOME/.vim/swp//
set viewdir=$HOME/.vim/view//
" fold folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldcolumn=3
set foldmethod=manual
"set foldmethod=marker
"set foldmethod=indent  "commands, za, zo, zc, zR, zM
"set foldmethod=syntax
set tabstop=4 sts=4 shiftwidth=4 expandtab
set autoindent      "Keep indentation from previous line
set hlsearch
set incsearch  " highlights search as you type
set scrolloff=8
" from https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
" fuzzy recursive finding in :e and :b
set path+=**
set wildmenu
" status line
set laststatus=2
set statusline=%n\ %{gitbranch}\ %t\ %r%m%=\ %l\/%L\|%c\ %p%%\ \|\ %{strftime('%a\ %d\/%b\/%Y\ %H:%M\ %p')}




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"# Lets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let gitbranch_ = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" https://vi.stackexchange.com/questions/14622
let g:netrw_fastbrowse = 0
"let g:netrw_winsize = 25






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"# Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python specific commands
command! Flist g/^\s*\(def\|class\)\s/#
command! Dlist g/^\h\w*\s*[=]\s*.*$/#
command! -nargs=1 Pfunc :call <SID>insert_pyfunc(<q-args>)
command! -nargs=1 PClass :call <SID>insert_pyclass(<q-args>)

" Git specific commands
command! Commit :call <SID>GitCommit()
command! Push !git push origin

" C-tags commands
" Create the `tags` file (may need to install ctags first)
" General MakeTags that excludes building folders
" NOW WE CAN
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

command! MakeTagsG !ctags -R
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

" make tags here at dot folder
command! MakeTagsH !universal-ctags -R .

" make tags for this file
command! MakeTagsT !universal-ctags %








""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#" auto commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup auto_save_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" Line Numberig
" from https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"# File Browsing
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

" Spell Checking
autocmd FileType markdown setlocal spell spelllang=en_us
autocmd FileType rst setlocal spell spelllang=en_us




"# Key Mappings

" https://vim.fandom.com/wiki/Insert_current_date_or_time
nnoremap <F5> "=strftime("%c")<CR>p
" https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
nnoremap <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Text Editing
" Move visual selection
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv


" quick binds
" https://vi.stackexchange.com/questions/8741/
nnoremap <esc><esc> :silent! nohls<cr>
nnoremap ; :
nnoremap : ;


" bind tab to esc
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>


" Navigation
nnoremap <S-f> <C-f>
nnoremap <S-b> <C-b>
nnoremap n nzz
nnoremap N Nzz
nnoremap ,, `^


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


"# comma remaps for vim
nnoremap ,b :buffers<cr>
nnoremap ,c :set cursorline! cursorcolumn!<cr>
nnoremap ,e :1wincmd w <bar> :30vs +Ex<cr>
nnoremap ,n :set number! relativenumber!<cr>
nnoremap ,z :%s/\s\+$//e<cr><C-O>
nnoremap ,v :e /home/joao/GitHub/run_commands/vimrc<cr>


" comma remaps for Python
nnoremap ,d :Dlist<cr>
nnoremap ,f :Flist<cr>
nnoremap ,k :up <bar> !tox -e check -- %<cr>
nnoremap ,o :up <bar>
          \ :let g:CPROFILEORI=expand('%:t:r') <bar>
          \ :let b:CPROFILE=expand('%:t:r') . '.cProfile_out' <bar>
          \ :execute '!python -m cProfile -o ' . b:CPROFILE . ' ' . expand('%:p') <bar>
          \ :let CPROFILEOUTPUT=system('python -c "import pstats; from pstats import SortKey; p = pstats.Stats(' . "'" . b:CPROFILE . "'" . '); p.sort_stats(SortKey.TIME).print_stats(50)"') <bar>
          \ :tabe <bar>
          \ :put =CPROFILEOUTPUT <bar>
          \ :exec 'saveas' g:CPROFILEORI  . '\.cProfile_read' <cr>
nnoremap ,p :up <bar> !python %:p<cr>
nnoremap ,q :s/(/(\r        /g <bar> s/, /,\r        /g <bar> s/\():\|)/)/,\r        ):/g<cr>
nnoremap ,r :e /home/joao/Dropbox/labo-documents/My_Books/Programming/python/python_recipes.py<cr>
nnoremap ,t :up <bar> !tox -e py37 -- %<cr>
nnoremap ,y :up <bar> !tox -e py38 -- %<cr>

" R specific bindings, not used so frequently
nnoremap ,R :up <bar> :let b:RMARKTMP="!R -e rmarkdown::render\"('" . expand("%:t") . "', output_file='" . expand("%:t:r") . ".html'" . ")\"" <bar> :execute b:RMARKTMP
nnoremap ,RR :up <bar> :let b:RMARKTMP="!R -e \"rmarkdown::render('" . expand("%:t") . "')\"" <bar> :execute b:RMARKTMP
nnoremap ,S :up <bar> :!Rscript %
nnoremap ,SS :up <bar> :!R CMD BATCH %


" comma remaps for PlantUML
nnoremap ,j :up <bar> !java -jar ~/software/plantuml/plantuml.jar %:p -tsvg<cr>
nnoremap ,1 mty}}pddbbdd't<C-V>}mb<BS>$A -down- <Esc>gvd'bjPkd't<C-V>}<BS>:%!column<Space>-t<Esc>


" comma remaps for writing
nnoremap ,s :set spell! spelllang=en_us<cr>
nnoremap ,w :set nowrap!<cr>


" comma remaps to edit text
nnoremap ,2 {j<C-V>}<BS>:%!column<Space>-t<Esc>
nnoremap ,3 {j<C-V>}<BS>$:%sort<Esc>


" other
nnoremap ,0 :colorscheme codewise<cr>
nnoremap <C-S-P> :call <SID>SynStack()<CR>





"# Display improvement

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

function! StatuslineGit()
  let l:branchname = g:gitbranch_
  return strlen(l:branchname) > 0?'['.l:branchname.']':''
endfunction
let gitbranch = StatuslineGit()


" useful links
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
" https://jonasjacek.github.io/colors/

" Some colour schemes I like (apart from mine :-P)
" https://raw.githubusercontent.com/tacahiroy/vim-colors-isotake/master/colors/isotake.vim

" Show syntax highlighting groups for word under cursor
" With this function you can identify the syntax group name
" usage: control+p
" see binding
" nnoremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstacK(LIne('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"# GitHub Integration commands
function! s:GitCommit()
  !git add %
  !git commit
endfunction

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

"# Relevant Links
" https://stackoverflow.com/questions/16768059/how-to-understand-these-vim-scripts
" https://www.youtube.com/watch?v=aHm36-na4-4

"# Plugins to consider
" https://github.com/maxboisvert/vim-simple-complete
