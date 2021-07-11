
set encoding=utf-8
set clipboard=unnamed
set clipboard+=unnamedplus
set number
set mouse=a
set nobackup
set ignorecase
set smartcase
set showmatch
" set softtabstop
" set expandtab
set shiftwidth=4
autocmd FileType c setlocal shiftwidth=2 tabstop=2
set shiftround
set nomodeline "useless anyway
set lazyredraw "perf?
set shortmess+=c
set splitright

set exrc "per-project config override possible in local .nvimrc

set spelllang=en,fr
set completeopt=noinsert,menuone,noselect
" set completeopt+=preview "disable preview in tabnine
set noshowmode
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc  " macOS/Linux
set path+=**  " add current file location to path

let g:loaded_python_provider=0 " who uses python2 anyway?


set signcolumn=yes "keep sing gutter open


" use ripgrep if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  let g:rg_derive_root='true'
  let g:gutentags_file_list_command = 'rg --files'
endif

" COLORS!
set termguicolors
colorscheme aurorae



set foldmethod=indent
set foldlevel=6
set incsearch "jumps to search word as you type (annoying but excellent)
set wildignore=*.o,*.obj,*.bak,*.exe "ignore those in tabfind completion

" set indentexpr



" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile


" start terminal in insert mode
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
set timeoutlen=200


" no line number in terminal
autocmd TermOpen * setlocal nonu
