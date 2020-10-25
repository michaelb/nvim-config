local on_attach_vim = function()
  -- require'completion'.on_attach()
  require'diagnostic'.on_attach()
end
require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.rls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.bashls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.gopls.setup{on_attach=on_attach_vim}


-- to disable diagnostics
   -- lua vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

-- potential LSPs, additionnal can be added with :LspInstall
-- require'nvim_lsp'.rust_analyzer.setup{}
-- require'nvim_lsp'.julials.setup{}
-- require'nvim_lsp'.kotlin_language_server.setup{}
-- require'nvim_lsp'.sumneko_lua.setup{}
--
-- require "nvim-treesitter.configs".setup {
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false -- Whether the query persists across vim sessions
--   }
-- }
-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true,
--     },
--   }
