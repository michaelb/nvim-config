local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer; please close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    --use "numToStr/Comment.nvim" -- Easily comment stuff
    use "terrortylor/nvim-comment"
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "akinsho/toggleterm.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "goolord/alpha-nvim"
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    use "folke/which-key.nvim"
    use "editorconfig/editorconfig-vim"
    use "dstein64/nvim-scrollview"

    use "tpope/vim-endwise"
    use "tpope/vim-repeat"
    use "flwyd/vim-conjoin"

    use "nacro90/numb.nvim" -- peek at line when :number
    use "markonm/traces.vim" -- selection/substitution preview

    use "vim-scripts/LargeFile"
    use "Jorengarenar/vim-MvVis"

    use 'andweeb/presence.nvim' -- discord presence

    use {
        "RRethy/vim-hexokinase",
        run = "make hexokinase"
    }

    -- My own plugins
    use {
        "michaelb/sniprun",
        branch = "dev",
        run = "bash install.sh 1"
    }
    use {
        'michaelb/vim-tips',
        config = "vim.g.vim_tips_display_at_startup=0"
    }

    use "rcarriga/nvim-notify"

    -- Colorschemes
    -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
    use "lunarvim/darkplus.nvim"

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use "petertriho/cmp-git"
    use "tamago324/cmp-zsh" -- needs zsh/zpty moduel :  zmodload zsh/zpty 
    use {
        "Saecki/crates.nvim",
        tag = 'v0.2.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    use "hrsh7th/cmp-emoji"
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
use {'tzachar/fuzzy.nvim', requires = {'nvim-telescope/telescope-fzf-native.nvim'}}
    use "tzachar/cmp-fuzzy-buffer"
    use "hrsh7th/cmp-calc" 
    --use "onsails/lspkind.nvim"

    -- use { 'ms-jpq/coq_nvim', branch= 'coq'}
    --use {  "ms-jpq/coq.artifacts", branch= 'artifacts' }
    --use { "ms-jpq/coq.thirdparty", branch= "3p"}

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Language-specific
    use 'mhinz/vim-crates'
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use {
        'simrat39/rust-tools.nvim',
        requires = {
            'mattn/webapi-vim',
            'mfussenegger/nvim-dap'
        }
    }
    use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- More targets
    use 'michaeljsmith/vim-indent-object' -- 'i' text object: dii => delete inner indent
    use 'wellle/targets.vim' -- additionnal text objects such as ')', ','
    use 'sgur/vim-textobj-parameter' -- text object for function parameter
    use 'kana/vim-textobj-user' -- text object provider (dependency)
    use 'RRethy/nvim-treesitter-textsubjects'

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
