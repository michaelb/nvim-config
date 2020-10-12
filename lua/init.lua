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

