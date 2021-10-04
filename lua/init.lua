local lspconfig = require('lspconfig')
local configs = require'lspconfig/configs'


local saga = require'lspsaga'
saga.init_lsp_saga{
  code_action_keys = { quit = '<Esc>',exec = '<CR>' }
}



-- potential LSPs, additionnal can be added with :LspInstall
-- require'nvim_lsp'.kotlin_language_server.setup{}
-- require'nvim_lsp'.jedi_language_server.setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "ocaml" },  -- list of language that will be disabled
  },
}

require'sniprun'.setup({
  -- repl_enable = {'Python3_original'},
  selected_interpreters = {'Lua_nvim', 'Python3_fifo'},
  repl_enable = {'Python3_original'},

  display = {
    "Classic",
    "VirtualTextOk",
    -- "VirtualTextErr",
    -- "TempFloatingWindow",
    -- "Terminal"
    -- "NvimNotify",
  },
  show_no_output = {"NvimNotify", "VirtualTextOk"},
})
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>SnipRun', {silent = true})
vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})


require'nvim-treesitter.configs'.setup {
    textsubjects = {
        enable = true,
        keymaps = {
            [','] = 'textsubjects-smart',
        }
    },
}

local statusline = require('statusline')
statusline.tabline = false

require('nvim_comment').setup()

require('pluginconfig/telescope')
require('pluginconfig/lightbulb')
require('pluginconfig/numb')
require('pluginconfig/nvim-tree')

-- lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.bashls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.clangd.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.vimls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.gopls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.pyls.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.julials.setup(coq.lsp_ensure_capabilities({}))
-- lspconfig.html.setup(coq.lsp_ensure_capabilities({}))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyls', 'julials', 'html', 'bashls', 'vimls', 'gopls', 'dartls'}
for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    -- You will probably want to add a custom on_attach here to locally map keybinds to buffers with an active client
    -- on_attach = on_attach,
    capabilities = capabilities,
  }
end
