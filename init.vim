"auto vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')



"Code completion
Plug 'zxqfl/tabnine-vim'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

"sniprun :-O
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground', {'branch' : 'fix-catch-query-error'}

" linter
" Plug 'dense-analysis/ale'
Plug 'nvim-lua/diagnostic-nvim'





"misc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'markonm/traces.vim'
Plug 'wellle/targets.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'flwyd/vim-conjoin'
Plug 'rhysd/git-messenger.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdTree'
Plug 'Yggdroot/indentLine'
Plug 'thaerk/vim-workspace'
Plug 'vim-scripts/LargeFile'
Plug 'michaelb/vim-tips'
Plug 'lervag/vimtex'
Plug 'TaDaa/vimade'
Plug 'Xuyuanp/scrollbar.nvim'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


"vim-autoformat settings for corect java
let g:formatdef_customjava="'astyle --mode=java --pad-oper -xe'"
let g:formatters_java=['customjava']

"autocompletion stuff
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


"fullscreen mode
map <F2> :NERDTree<CR>



"nvim settings cause why not

syntax enable
set encoding=utf-8
set clipboard=unnamed
set clipboard+=unnamedplus
set number
set mouse=a
set nobackup
set ignorecase
set smartcase
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround
set nomodeline "useless anyway

" COLORS!
set termguicolors
colorscheme custom


" part of vim-polyglot
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_syntax_conceal = 0

set autoindent
set smartindent
set cindent

set foldmethod=indent
set foldlevel=6
:set incsearch "jumps to search word as you type (annoying but excellent)
:set wildignore=*.o,*.obj,*.bak,*.exe "ignore those in tabfind completion
command Preview  :! google-chrome-stable %  &> /dev/null <CR>

"quick jump between split
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>


augroup my_config_scrollbar_nvim
    autocmd!
    autocmd BufEnter    * silent! lua require('scrollbar').show()
    autocmd BufLeave    * silent! lua require('scrollbar').clear()

    autocmd CursorMoved * silent! lua require('scrollbar').show()
    autocmd VimResized  * silent! lua require('scrollbar').show()

    autocmd FocusGained * silent! lua require('scrollbar').show()
    autocmd FocusLost   * silent! lua require('scrollbar').clear()
augroup end


"sniprun line/bloc shortcut
nnoremap ff :SnipRun<CR>
vnoremap f :SnipRun<CR>

" LSP configs
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition() <CR>
nnoremap <silent> ? <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ! <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

lua << EOF
require'nvim_lsp'.pyls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.rls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.bashls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.clangd.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.vimls.setup{on_attach=require'diagnostic'.on_attach}
require'nvim_lsp'.gopls.setup{on_attach=require'diagnostic'.on_attach}
EOF
" to disable diagnostics
  " lua vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end


"potential LSPs, additionnal can be added with :LspInstall
"require'nvim_lsp'.rust_analyzer.setup{}
" require'nvim_lsp'.julials.setup{}
" require'nvim_lsp'.kotlin_language_server.setup{}
" require'nvim_lsp'.sumneko_lua.setup{}


lua << EOF
require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
EOF
"





" diagnostic config
let g:diagnostic_enable_virtual_text=0
let g:diagnostic_level = 'Warning'
let g:diagnostic_virtual_text_prefix = '<<'
let g:diagnostic_trimmed_virtual_text = 0
let g:diagnostic_insert_delay = 1
call sign_define("LspDiagnosticsErrorSign", {"text" : "✘", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚡", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsWarning"})

" to activate when its become cool
" nmap <silent> m :NextDiagnosticCycle<CR>
" nmap <silent>   :PrevDiagnosticCycle<CR>





"
"hide selection after hitting return in command mode
nnoremap <silent> <CR> :noh<CR>: <CR>


"disable fkin recording
map q <Nop>

" fzf maps
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <C-L> :Tags<CR>


" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


" displayed lines navigation, not real line one
nnoremap j gj
nnoremap k gk


"Nerdtree stuff
map <C-d> :NERDTreeToggle<CR>

" large file size in mb
let g:LargeFile=2


"save / restore session
command! S ToggleWorkspace
let g:workspace_session_disable_on_args=1





"autoformat code with F3 or at file save
"but only with known formatters
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat




