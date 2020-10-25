"auto vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')



"Code completion
Plug 'zxqfl/tabnine-vim' " the best autocompleter <3

" More completion sources when necessary
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
" needs nextword + nextword-data dependencies
" Plug 'high-moctane/asyncomplete-nextword.vim'


" to re-enable when PC more powerful, and when things less buggy
" Plug 'nvim-lua/completion-nvim'
" Plug 'aca/completion-tabnine', {'do': './install.sh'}

"sniprun :-O
Plug 'michaelb/sniprun', {'do': 'bash install.sh', 'branch': 'dev'}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground', {'branch' : 'fix-catch-query-error'}

" linter
Plug 'nvim-lua/diagnostic-nvim'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig' "collection of common configs
Plug 'tjdevries/lsp_extensions.nvim'




"files + tags navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'zackhsi/fzf-tags'
Plug 'ludovicchabant/vim-gutentags'


Plug 'markonm/traces.vim' "selection/substitution preview
Plug 'wellle/targets.vim' "additionnal text objects such as ')', ','
Plug 'sheerun/vim-polyglot' "config for all languages (color, etc...)
Plug 'tpope/vim-endwise' "autoadd 'end' symbols (bash, ruby, lua....
Plug 'tpope/vim-repeat' "allow . to repeat plugin actions
Plug 'flwyd/vim-conjoin' "join string when joining lines spanned by a multiline string
Plug 'rhysd/git-messenger.vim'       "see preview of git commit introducing line

Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'

Plug 'tomtom/tcomment_vim' "comment with the motion gc
Plug 'Yggdroot/indentLine' "display indentation level with thins lines
Plug 'thaerk/vim-workspace' "better workspaces

Plug 'vim-scripts/LargeFile'
Plug 'michaelb/vim-tips', {'branch':'dev'}

Plug 'lervag/vimtex'

Plug 'TaDaa/vimade' "fades unfocused buffer


Plug 'reedes/vim-wheel'

Plug 'Xuyuanp/scrollbar.nvim'
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
" "too bad the plugin is great


" debugguer, needs config
" Plug 'mfussenegger/nvim-dap'
" Plug 'theHamsta/nvim-dap-virtual-text'
"
Plug 'tikhomirov/vim-glsl'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


" unfocused split slightly faded
let g:vimade = {}
let g:vimade.fadelevel = 0.7


let g:vim_tips_tips_frequency=0.9



"vim-autoformat settings for corect java
let g:formatdef_customjava="'astyle --mode=java --pad-oper -xe'"
let g:formatters_java=['customjava']

"autocompletion stuff
" auto close preview window when done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"preview windows on bottom
set splitbelow

" register tabnine as completion source
" call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
"   \ 'name': 'tabnine',
"   \ 'allowlist': ['*'],
"   \ 'completor': function('asyncomplete#sources#tabnine#completor'),
"   \ 'config': {
"   \   'line_limit': 1000,
"   \   'max_num_result': 20,
"   \  },
"   \ }))
"
"
" call asyncomplete#register_source(asyncomplete#sources#nextword#get_source_options({
"             \   'name': 'nextword',
"             \   'allowlist': ['*'],
"             \   'args': ['-n', '10000'],
"             \   'completor': function('asyncomplete#sources#nextword#completor')
"             \   }))
"


"git blame/ see commit
nnoremap gb  :GitMessenger<CR>


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
set expandtab
set shiftwidth=2
set shiftround
set nomodeline "useless anyway
" set completeopt-=preview "disable preview in tabnine



" COLORS!
set termguicolors
colorscheme custom


" part of vim-polyglot
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_syntax_conceal = 0

set autoindent
filetype plugin indent on
" set cindent

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
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition() <CR>
nnoremap <silent> ? <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> ! <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

lua require'init'




" diagnostic config
let g:diagnostic_enable_virtual_text=1
let g:diagnostic_level = 'Warning'
let g:diagnostic_virtual_text_prefix = '<<'
let g:diagnostic_trimmed_virtual_text = 20
let g:diagnostic_insert_delay = 1
let g:diagnostic_enable_underline = 0
call sign_define("LspDiagnosticsErrorSign", {"text" : "✘", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "⚡", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsWarning"})

" to activate when its become cool
" nmap <silent> m :NextDiagnosticCycle<CR>
" nmap <silent>   :PrevDiagnosticCycle<CR>

" display type hints
" autocmd InsertLeave,BufEnter * lua require'lsp_extensions'.inlay_hints{prefix ='', highlight = "Comment"}


"
"hide selection after hitting return in command mode
nnoremap <silent> <CR> :noh<CR>: <CR>


"disable fkin recording
map q <Nop>

" fzf maps
nnoremap <silent> <C-P> :GFiles<CR>
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




