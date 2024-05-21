" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
" set number

" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Set shift width to 4 spaces.
set shiftwidth=3

" Set tab width to 4 columns.
set tabstop=3

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"""""""""""""""""""""""""""""""""""

call mkdir($HOME . "/.vim/backup", "p", 0o700)
call mkdir($HOME . "/.vim/swap", "p", 0o700)
call mkdir($HOME . "/.vim/undo", "p", 0o700)

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

""""""""""""""""""""""

function! SearchReplace()
  " Prompt the user for the search pattern
  let l:search_pattern = input('Enter search pattern: ')

  " Prompt the user for the replacement string
  let l:replace_string = input('Enter replacement string: ')

  " Prompt the user to confirm if the replacement should be global
  let l:global = input('Global replace? (y/n): ')
  if l:global == 'y'
    let l:global_flag = 'g'
  else
    let l:global_flag = ''
  endif

  " Prompt the user to confirm if the search should be case-sensitive
  let l:case_sensitive = input('Case sensitive? (y/n): ')
  if l:case_sensitive == 'y'
    let l:case_flag = ''
  else
    let l:case_flag = 'i'
  endif

  " Construct and execute the search and replace command
  execute '%s/' . l:search_pattern . '/' . l:replace_string . '/' . l:case_flag . l:global_flag
endfunction

" Create a command to call the function
command! SearchReplace call SearchReplace()
