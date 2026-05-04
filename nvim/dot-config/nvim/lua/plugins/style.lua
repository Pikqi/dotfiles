return {
	{
		"gruvbox-community/gruvbox",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"folke/zen-mode.nvim",
	},
	{
		"ya2s/nvim-cursorline",
		opts = {
			cursorline = {
				enable = false,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = { underline = true },
			}
		}
	},
	{
		"hood/popui.nvim",
		config = function()
			vim.ui.select = require "popui.ui-overrider"
		end
	},
}