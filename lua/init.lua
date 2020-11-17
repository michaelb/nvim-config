local nvim_lsp=require('nvim_lsp')


local on_attach_vim = function()
  -- require'completion'.on_attach()
  require'diagnostic'.on_attach()
end


require'nvim_lsp'.rls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.bashls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.gopls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}

-- special python langserver (pyrigth) while it's not merged in nvim-lspconfigs
-- local configs = require('nvim_lsp/configs')
-- --if not configs.pyright then
-- configs.pyright = {
--   default_config = {
--     cmd = {"pyright-langserver", "--stdio"};
--     filetypes = {"python"};
--     root_dir = nvim_lsp.util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt");
--     settings = {
--       analysis = { autoSearchPaths= true; };
--       pyright = { useLibraryCodeForTypes = true; };
--     };
--     -- The following before_init function can be removed once https://github.com/neovim/neovim/pull/12638 is merged
--     before_init = function(initialize_params)
--       initialize_params['workspaceFolders'] = {{
--         name = 'workspace',
--         uri = initialize_params['rootUri']
--       }}
--     end
--     };
-- }
--





-- to disable diagnostics
   -- lua vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

-- potential LSPs, additionnal can be added with :LspInstall
-- require'nvim_lsp'.rust_analyzer.setup{}
-- require'nvim_lsp'.julials.setup{}
-- require'nvim_lsp'.kotlin_language_server.setup{}
-- require'nvim_lsp'.sumneko_lua.setup{}
-- require'nvim_lsp'.jedi_language_server.setup{on_attach=on_attach_vim}
