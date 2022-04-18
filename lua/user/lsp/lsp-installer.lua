local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("user.lsp.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end
    if server.name == "rust_analyzer" then
		-- Initialize the LSP via rust-tools instead
		require("rust-tools").setup({
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.            --
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			server =  server:get_default_options(),
		})
		server:attach_buffers()
		-- Only if standalone support is needed
		require("rust-tools").start_standalone_if_required()
    end



	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

