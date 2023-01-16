local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({

	view = {
		width = 40,
		-- height = 30,
		hide_root_folder = false,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>" }, cb = tree_cb "edit" },
				{ key = "g", cb = tree_cb "split" },
				{ key = "v", cb = tree_cb "vsplit" },
				{ key = "o", cb = tree_cb "cd" },
				{ key = "u", cb = tree_cb "dir_up" },
				{ key = "H", cb = tree_cb "toggle_help" },
			},
		},
		number = true,
		relativenumber = true,
	},
})
