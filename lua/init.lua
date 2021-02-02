local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'


-- lspconfig.rls.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.vimls.setup{}
lspconfig.gopls.setup{}
lspconfig.jedi_language_server.setup{}


-- Check if it's already defined for when I reload this file.
-- configs.glsl_lsp = {
--   default_config = {
--     cmd = {"/home/michael/scripts/glsl-language-server/build/glslls","--stdin"};
--     filetypes = {'glsl','frag','vert'};
--     root_dir = function(fname)
--       return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
--     end;
--     settings = {};
--   };
-- }
-- lspconfig.glsl_lsp.setup{}


require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "ocaml" },  -- list of language that will be disabled
  },
}


-- to disable diagnostics if issue still exists
   -- lua vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

-- potential LSPs, additionnal can be added with :LspInstall
-- require'nvim_lsp'.julials.setup{}
-- require'nvim_lsp'.kotlin_language_server.setup{}
-- require'nvim_lsp'.sumneko_lua.setup{}
-- require'nvim_lsp'.jedi_language_server.setup{}




