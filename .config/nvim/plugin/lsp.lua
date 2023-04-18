local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end


local on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({timeout_ms=3000})]]
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.astro.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.html.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
lspconfig.tailwindcss.setup {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = { "[twMerge,twJoin]\\([^]([^)]*).\\)", "[Cc]lass[Nn]ames \\=([^;]*);" }
			}
		}
	},
	capabilities = capabilities,
	on_attach = on_attach,
}

lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
lspconfig.cssls.setup {
	capabilities = capabilities,
}

lspconfig.emmet_ls.setup {
	capabilities = capabilities,
	filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
}

lspconfig.cssmodules_ls.setup {
	on_attach = on_attach,
	init_options = {
		camelCase = false,
	}
}

lspconfig.tsserver.setup {
	on_attach = on_attach,
	--filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities
}

-- lspconfig.eslint.setup {
-- 	on_attach = on_attach
-- }


lspconfig.pyright.setup {
	on_attach = on_attach
}

lspconfig.lua_ls.setup {
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
		}
	}
}
lspconfig.clangd.setup {
	on_attach = on_attach
}

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

null_ls.setup {
	sources = {
		-- null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.code_actions.eslint_d

		-- null_ls.builtins.formatting.stylelint,
		-- null_ls.builtins.diagnostics.stylelint,
		--
		-- null_ls.builtins.code_actions.eslint,
		-- null_ls.builtins.formatting.eslint,
		-- null_ls.builtins.diagnostics.eslint,


	},

	on_attach
}
