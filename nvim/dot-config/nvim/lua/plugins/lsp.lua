return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		-- config = function()
		-- 	vim.lsp.enable("zls", true)
		-- end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local on_attach = function(client, bufnr)
				-- if client.name == "ts_ls" then
				-- 	client.server_capabilities.document_formatting = false
				-- end
				vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms=3000})]])
			end

			vim.lsp.config("*", {
				on_attach = on_attach,
			}

			)
			vim.lsp.enable("zls", true)
		end

	}

}
