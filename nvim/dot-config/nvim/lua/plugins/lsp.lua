return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local on_attach = function(client, bufnr)
			end

			vim.lsp.config("*", {
				on_attach = on_attach,
			}

			)
			vim.lsp.config("zls", {
				settings = {
					enable_autofix = true,
					enable_build_on_save = true,
					build_on_save_step = { "check", "test" },
				},
				root_markers = { "build.zig", "build.zig.zon" },

			})

			vim.lsp.enable("zls", true)
		end

	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {}
	},
	{
		"dnlhc/glance.nvim" },
}