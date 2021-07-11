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
lspconfig.html.setup{}


require'lspconfig'.sumneko_lua.setup {
  cmd = {"/home/michael/scripts/lua-language-server/bin/Linux/lua-language-server", "-E", "/home/michael/scripts/lua-language-server" .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
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
-- require'nvim-treesitter.configs'.setup {
--   indent = {
--     enable = true
--   }
-- }

require'sniprun'.setup({
  -- repl_enable = {'Python3_original'},
  selected_interpreters = {'Lua_nvim', 'Python3_fifo'},

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


require'nvim-treesitter.configs'.setup {
    textsubjects = {
        enable = true,
        keymaps = {
            [','] = 'textsubjects-smart',
        }
    },
}

require('feline').setup()

require('nvim_comment').setup()

require('pluginconfig/telescope')
require('pluginconfig/numb')
require('pluginconfig/rust-tools')
require('pluginconfig/nvim-tree')
-- require('pluginconfig/which-key')
