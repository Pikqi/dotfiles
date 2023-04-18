require("nvim_comment").setup({
	hook = function()
		require("ts_context_commentstring.internal").update_commentstring()
	end,
})

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	auto_install = true,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = false,
		query = {
			"rainbow-parens",
			tsx = "rainbow-tags",
			javascript = "rainbow-tags-react"
		},
		-- strategy = require('ts-rainbow').strategy.global,

		hlgroups = {
			-- 'TSRainbowRed',
			'TSRainbowYellow',
			'TSRainbowBlue',
			'TSRainbowOrange',
			'TSRainbowGreen',
			'TSRainbowViolet',
			'TSRainbowCyan'
		},

	}
}
