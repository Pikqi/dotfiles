require("globals.options")
require("globals.configs")
require "globals.keymaps"
-- require('plugins')
require("config.lazy")

-- Define a function to search using Telescope with Ripgrep in the folder of the selected item in nvim-tree
function TelescopeRipgrepInSelectedFolder()
	local nvimtreeapi = require("nvim-tree.api")
	local selected_node = nvimtreeapi.tree.get_node_under_cursor()
	if not selected_node then
		print("No item selected.")
		return
	end

	-- Extract the path of the selected item
	local selected_path
	if vim.fn.isdirectory(selected_node.absolute_path) == 1 then
		-- If the selected node is a directory, use its absolute_path
		selected_path = selected_node.absolute_path
	else
		-- If the selected node is a file, use the parent directory
		selected_path = selected_node.parent.absolute_path
	end
	-- Use Telescope to perform live grep with Ripgrep
	require('telescope.builtin').live_grep({
		prompt_title = "Live Grep in " .. selected_path,
		cwd = selected_path,
	})
end

-- Map the function to a keybinding (you can choose your own key combination)
vim.api.nvim_set_keymap('n', '<leader>u', [[:lua TelescopeRipgrepInSelectedFolder()<CR>]],
	{ noremap = true, silent = true })
vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme tokyonight-storm]]
