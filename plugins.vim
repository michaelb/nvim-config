"needs vim-plug
call plug#begin('~/.local/share/nvim/plugged')



"Code completion
" Plug 'michaelb/tabnine-vim' "  autocompletion <3 + my fix for filetype blacklist

" This is the main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}




"write & run <3
" Plug 'michaelb/sniprun', {'do': 'bash install.sh 1', 'branch':'dev'}
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'rcarriga/nvim-notify'


" linter
Plug 'neovim/nvim-lspconfig', {'commit' : '59bc16aa2c9cfc6f8c2a67ae01635eeea1d43943'} "collection of common configs
Plug 'simrat39/rust-tools.nvim' " rust analyzer things

Plug 'glepnir/lspsaga.nvim'
Plug 'RishabhRD/nvim-lsputils'
Plug 'alexaandru/nvim-lspupdate'
Plug 'kosayoda/nvim-lightbulb'

Plug 'ncm2/float-preview.nvim'


"files + tags navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'ludovicchabant/vim-gutentags'



Plug 'kyazdani42/nvim-tree.lua'


Plug 'nacro90/numb.nvim' "peek at line when :{number}


Plug 'RRethy/vim-hexokinase' , { 'do': 'make hexokinase' }

Plug 'markonm/traces.vim' "selection/substitution preview

Plug 'michaeljsmith/vim-indent-object' " 'i' text object: dii => delete inner indent
Plug 'wellle/targets.vim' "additionnal text objects such as ')', ','
Plug 'sgur/vim-textobj-parameter' "text object for function parameter
Plug 'kana/vim-textobj-user' "text object provider (dependency)

Plug 'tpope/vim-endwise' "autoadd 'end' symbols (bash, ruby, lua....
Plug 'tpope/vim-repeat' "allow . to repeat plugin actions
Plug 'flwyd/vim-conjoin' "join string when joining lines spanned by a multiline string
Plug 'rhysd/git-messenger.vim'       "see preview of git commit introducing line
"Plug 'rhysd/clever-f.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'

Plug 'lewis6991/gitsigns.nvim'
Plug 'beauwilliams/statusline.lua'

Plug 'terrortylor/nvim-comment'
Plug 'Yggdroot/indentLine' "display indentation level with thins lines
Plug 'Jorengarenar/vim-MvVis'

Plug 'vim-scripts/LargeFile'
Plug 'michaelb/vim-tips'

Plug 'michaelb/do-nothing.vim'


Plug 'lervag/vimtex'

Plug 'tweekmonster/startuptime.vim'

" Plug 'TaDaa/vimade' "fades unfocused buffer, but conflicts with treesitter
Plug 'RRethy/vim-illuminate'
Plug 'henriquehbr/nvim-startup.lua'

Plug 'farmergreg/vim-lastplace'
Plug 'matze/vim-move'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'michaelb/vim-printer'

Plug 'dstein64/nvim-scrollview', {'branch': 'main'}

" Plug 'rhysd/conflict-marker.vim' " git conflicts faster resolution

Plug 'tpope/vim-surround'

Plug 'RRethy/nvim-treesitter-textsubjects'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}
Plug 'nvim-treesitter/playground'
"
Plug 'michaelb/nvcode-color-schemes.vim'
Plug 'ishan9299/nvim-solarized-lua'

" Plug 'folke/which-key.nvim'
Plug 'andweeb/presence.nvim'

Plug 'kyazdani42/nvim-web-devicons'

" must be last plugin called
Plug 'ryanoasis/vim-devicons'


call plug#end()
