
"auto vim-plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/plugged')



"Code completion

" More completion sources when necessary
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
" needs nextword + nextword-data dependencies
" Plug 'high-moctane/asyncomplete-nextword.vim'


" to re-enable when PC more powerful, and when things less buggy
" Plug 'nvim-lua/completion-nvim'
" Plug 'aca/completion-tabnine', {'do': './install.sh'}
Plug 'zxqfl/tabnine-vim' "  autocompletion <3

"write  & run
Plug 'michaelb/sniprun', {'do': 'bash install.sh 1', 'branch':'dev'}

" linter
Plug 'nvim-lua/diagnostic-nvim'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig' "collection of common configs
Plug 'tjdevries/lsp_extensions.nvim'

Plug 'ncm2/float-preview.nvim'

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
Plug 'rhysd/clever-f.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'

Plug 'tomtom/tcomment_vim' "comment with motion +  gc
Plug 'Yggdroot/indentLine' "display indentation level with thins lines
Plug 'thaerk/vim-workspace' "better workspaces

Plug 'vim-scripts/LargeFile'
Plug 'michaelb/vim-tips', {'branch':'dev'}

Plug 'lervag/vimtex'

Plug 'TaDaa/vimade' "fades unfocused buffer

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'reedes/vim-wheel'

Plug 'Xuyuanp/scrollbar.nvim'
" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
" "too bad the plugin is great


" debugguer, needs config
" Plug 'mfussenegger/nvim-dap'
" Plug 'theHamsta/nvim-dap-virtual-text'
"
Plug 'tikhomirov/vim-glsl'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground', {'branch' : 'fix-catch-query-error'}

call plug#end()
