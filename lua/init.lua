local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'


local saga = require'lspsaga'
saga.init_lsp_saga{
  code_action_keys = { quit = '<Esc>',exec = '<CR>' }
}


-- lspconfig.rls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.vimls.setup{}
lspconfig.gopls.setup{}
lspconfig.pyls.setup{}
lspconfig.julials.setup{}


local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = "usr/bin/lua-language-server"
lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
}
-- potential LSPs, additionnal can be added with :LspInstall
-- require'nvim_lsp'.kotlin_language_server.setup{}
-- require'nvim_lsp'.sumneko_lua.setup{}
-- require'nvim_lsp'.jedi_language_server.setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "ocaml" },  -- list of language that will be disabled
  },
}
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}

require'sniprun'.setup({
  repl_enable = {'Python3_original'},
  selected_interpreters = {'Lua_nvim'},

  display = {
    "Classic",
    "VirtualTextOk",
    -- "VirtualTextErr",
    -- "TempFloatingWindow",
-- "Terminal"
  },
})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>SnipRun', {silent = true})
vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})



require('nvim_comment').setup()

require('pluginconfig/telescope')
require('pluginconfig/numb')
require('pluginconfig/rust-tools')
require('pluginconfig/galaxyline')
require('pluginconfig/nvim-tree')
-- require('pluginconfig/which-key')
