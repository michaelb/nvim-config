
syntax enable
set encoding=utf-8
set clipboard=unnamed
set clipboard+=unnamedplus
set number
set mouse=a
set nobackup
set ignorecase
set smartcase
set expandtab
set shiftwidth=2
set shiftround
set nomodeline "useless anyway
set lazyredraw "perf?
set shortmess+=c

set spelllang=en,fr
" set completeopt+=preview "disable preview in tabnine
set completeopt=noinsert,menuone,noselect
set shortmess+=c
set noshowmode
set wildmode=longest:full,full
set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc  " macOS/Linux
set path+=**  " add current file location to path


" use ripgrep if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  let g:rg_derive_root='true'
  let g:gutentags_file_list_command = 'rg --files'
endif

" COLORS!
set termguicolors
colorscheme custom


set autoindent
filetype plugin indent on
" set cindent

set foldmethod=indent
set foldlevel=6
set incsearch "jumps to search word as you type (annoying but excellent)
set wildignore=*.o,*.obj,*.bak,*.exe "ignore those in tabfind completion

" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

"save / restore session
command! S ToggleWorkspace
let g:workspace_session_disable_on_args=1

