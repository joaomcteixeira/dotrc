" Welcome to my .vimrc file
"
" Joao M.C.Teixeira
" joaomcteixeira@gmail.com
" Vim'ing since 2019
"
" Search for "# to scroll headers
" topics are separated by 25 empty lines


























"# Basic Operations
" indentantion
"filetype plugin on
set tabstop=4 sts=4 shiftwidth=4 expandtab
set number
set autoindent      "Keep indentation from previous line
"set smartindent     "Automatically inserts indentation in some cases
"set cindent         "Like smartindent, but stricter and more customisable
set foldmethod=indent  "commands, za, zo, zc, zR, zM

" https://vi.stackexchange.com/questions/8741/how-to-automatically-turn-off-hlsearch-after-im-done-searching
set hlsearch
nnoremap <esc><esc> :silent! nohls<cr>

highlight ColorColumn ctermbg=248 ctermfg=NONE cterm=NONE
set colorcolumn=72,80
" other option
" call matchadd('ColorColumn', '\%v81v', 100)

" Line Numberig
" from https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
























"# Color Schemes

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


" highlights trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list
hi SpecialKey ctermbg=1 ctermfg=NONE guifg=NONE
" notes from the past
"match ExtraWhitespace /\w\s\+$/
"match IndentSpace /^\s\+$/

syntax on
set background=light
" https://jonasjacek.github.io/colors/
highlight Normal ctermbg=254 ctermfg=NONE cterm=NONE
highlight LineNr ctermbg=NONE ctermfg=248 cterm=NONE
highlight Visual ctermbg=1 ctermfg=0 cterm=NONE

" ************************* PYTHON ************************************
" Datatypes
highlight pythonString ctermbg=NONE ctermfg=94 cterm=NONE 
highlight pythonNumber ctermbg=None ctermfg=19 cterm=NONE
" Expressions
highlight link pythonTripleQuotes pythonString
highlight link pythonQuotes pythonString
highlight pythonFunction ctermbg=NONE ctermfg=28 cterm=bold
highlight pythonStatement ctermbg=NONE ctermfg=0 cterm=bold
highlight pythonDecorator ctermbg=NONE ctermfg=240 cterm=NONE
highlight link pythonDecoratorName pythonDecorator
highlight pythonBuiltin ctermbg=NONE ctermfg=54 cterm=none
" Conditionals
highlight pythonConditional ctermbg=NONE ctermfg=1 cterm=NONE
highlight link pythonRepeat pythonConditional
highlight link pythonExceptions pythonConditional
highlight link pythonOperator pythonConditional
highlight pythonException ctermbg=NONE ctermfg=0 cterm=bold
" ********************************************************************* 

























"# Lint Syntax
augroup LintSyntax
    autocmd!
    "autocmd BufReadPost,FileReadPost *.py syntax match trailwhitespace /\S\s\+$/
    autocmd BufReadPost,FileReadPost *.py syntax match idblock /^\s\{4}$/
    autocmd BufReadPost,FileReadPost *.py syntax match idblockB /^\s\{8}$/
    autocmd BufReadPost,FileReadPost *.py syntax match idblockC /^\s\{12}$/
    autocmd BufReadPost,FileReadPost *.py syntax match badindent /^\s\{1,3}\S/
    autocmd BufReadPost,FileReadPost *.py syntax match badindentA /^\s\{5,7}\S/
    autocmd BufReadPost,FileReadPost *.py syntax match badindentB /^\s\{9,11}\S/
    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass1 /^\s*\w.*\n\{,2}\(def\|class\)\s/ 
    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass2 /^\s*\w.*\n\{4,}\(def\|class\)\s/ 
    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass3 /^\s*\w.*\n\s+\(def\|class\)\s/ 
    autocmd BufReadPost,FileReadPost *.py syntax match ddefclass4 /^\s*\w.*\n\{3,}\s+\(def\|class\)\s/ 
    "autocmd BufReadPost,FileReadPost *.py syntax match ddef /\p\n\ndef\s/
    "autocmd BufReadPost,FileReadPost *.py syntax match ddefa /\p\n\s*def\s/
    "autocmd BufReadPost,FileReadPost *.py syntax match ddefb /\p\n\{4,}def\s/
    "autocmd BufReadPost,FileReadPost *.py syntax match ddefc /\p\n\nclass\s/
    "autocmd BufReadPost,FileReadPost *.py syntax match ddefd /\p\n\{4,}class\s/
    autocmd BufReadPost,FileReadPost *.py syntax match mathwrong /\s=\(+\|-\|\/\|*\)\s/
    "autocmd BufReadPost,FileReadPost *.py syntax match badcommenta /\S\s#/
    "autocmd BufReadPost,FileReadPost *.py syntax match badcommentb /\S#/

    "autocmd BufReadPost,FileReadPost *.py hi link trailwhitespace ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi idblock ctermbg=255 ctermfg=NONE cterm=NONE
    autocmd BufReadPost,FileReadPost *.py hi link idblockB idblock
    autocmd BufReadPost,FileReadPost *.py hi link idblockC idblock
    autocmd BufReadPost,FileReadPost *.py hi link badindent ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link badindentA ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link badindentB ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link ddefclass1 ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link ddefclass2 ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link ddefclass3 ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link ddefclass4 ErrorMsg
    autocmd BufReadPost,FileReadPost *.py hi link mathwrong ErrorMsg
    "autocmd BufReadPost,FileReadPost *.py hi link badcommenta ErrorMsg
    "autocmd BufReadPost,FileReadPost *.py hi link badcommentb ErrorMsg
augroup END
























"# Fast mapping
"map <Space> <Leader>
nnoremap <Space>h :wincmd h<CR>
nnoremap <Space>j :wincmd j<CR>
nnoremap <Space>k :wincmd k<CR>
nnoremap <Space>l :wincmd l<CR>
nnoremap <Space>v :wincmd v <bar> :wincmd l<CR>
nnoremap <Space>s :wincmd s <bar> :wincmd j<CR>
nnoremap <Space>c :wincmd c<CR>
nnoremap <Space>b :1wincmd c<CR>

nnoremap ; :
"nnoremap : ;

" opens a file browser windo on the left
nnoremap ,e :1wincmd w <bar> :wincmd v <bar> :edit . <bar> :vertical resize 30<cr>




















"# Python specific
noremap ,p :!python %:p<cr>
noremap ,t :!tox -e py37 -- %


command! Flist g/^\s*\(def\|class\)\s/#

" https://stackoverflow.com/questions/57074531/vim-command-to-insert-multiline-text-with-argument
function! s:insert_pyclass(classname)
    let l:indent = repeat(' ', indent('.'))
    let l:text = [
        \ 'class <TMPL>:',
        \ '    """',
        \ '    """',
        \ '    def __init__(self):',
        \ '        """'
        \ '        Parameters'
        \ '        ----------'
        \ '        """'
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
        \ '    Function description here.'
        \ ''
        \ '    Parameters'
        \ '    ----------'
        \ ''
        \ '    Returns'
        \ '    -------'
        \ '    """'
        \ ''
        \ '    return',
    \ ]
    call map(l:text, {k, v -> l:indent . substitute(v, '\C<TMPL>', a:funcname, 'g')})
    call append('.', l:text)
endfunction

command! -nargs=1 Pfunc :call <SID>insert_pyfunc(<q-args>)





















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
command! MakeTags !universal-ctags -R --exclude=.tox --exclude=.git .

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
command! Spell setlocal spell spelllang=en_us

























"# File Executions
noremap ,l :!java -jar ~/software/plantuml/plantuml.jar %:p -tsvg<cr>

























"# GitHub Integrations

function! s:GitCommit()
  !git add %
  !git commit
endfunction

command! Git :call <SID>GitCommit()
command! Push !git push origin




























"# Relevant Links
" https://stackoverflow.com/questions/16768059/how-to-understand-these-vim-scripts
" https://www.youtube.com/watch?v=aHm36-na4-4

"# Plugins to consider
" https://github.com/maxboisvert/vim-simple-complete
