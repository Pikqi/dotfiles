return {
	{
		"saghen/blink.cmp",

		version = '1.*',
		keymap = { preset = 'default' },

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {

			completion = { documentation = { auto_show = true } },
			sources = {
				default = { 'lsp', 'path', 'snippets' },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },

			keymap = {
				preset = 'none',

				['<C-space>'] = { 'show', 'hide' },
				['<ESC>'] = { 'cancel', 'fallback' },

				['<Tab>'] = {
					'select_next',
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					'snippet_forward',
					'fallback'
				},

				['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-j>'] = { 'select_next', 'fallback' },
				['<CR>'] = { 'select_and_accept', 'fallback' },
				['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

			},

		},
		opts_extend = { "sources.default" },
	},
}
