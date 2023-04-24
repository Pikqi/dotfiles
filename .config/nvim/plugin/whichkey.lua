local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

-- default options from ghub
local setup = {
	plugins = {
		marks = true,    -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true,   -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true,   -- default bindings on <c-w>
			nav = true,       -- misc bindings to work with windows
			z = true,         -- bindings for folds, spelling and others prefixed with z
			g = true,         -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+",    -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = '<c-d>', -- binding to scroll down inside the popup
		scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded",     -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0
	},
	layout = {
		height = { min = 4, max = 25 },                                            -- min and max height of the columns
		width = { min = 20, max = 50 },                                            -- min and max width of the columns
		spacing = 3,                                                               -- spacing between columns
		align = "left",                                                            -- align columns left, center or right
	},
	ignore_missing = false,                                                      -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                            -- show help message on the command line when the popup is visible
	triggers = "auto",                                                           -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKeywhich
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

-- options
local opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "<leader>",
	buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
	["<tab>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
	e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	r = { "<cmd>NvimTreeFindFile<cr>", "Open folder" },
	w = { "<cmd>w!<CR>", "Save" },
	W = { "<cmd>noa w<CR>", "Save without formatting" },
	q = { "<cmd>q!<CR>", "Quit" },
	Q = { "<cmd>qa!<CR>", "Quit all" },
	c = { "<cmd>bdelete!<CR><cmd>bnext<CR>", "Quit" },
	C = { "<cmd>%bd|e#|bd#<CR>", "Quit" },
	f = { "<cmd>Telescope find_files<cr>", "Find Files" },
	o = { "<cmd>CommentToggle<cr>", "Comment" },
	-- m = { "<cmd>marks<cr>", "Marks" },
	s = {
		name = "Search",
		["b"] = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Buffers",
		},
		--c = { "<cmd>lua require'telescope.builtin'.commands{}<cr>", "Find Commands"},
		C = { "<cmd> Telescop commands<cr>", "Find Commands" },
		k = { "<cmd> Telescop keymaps<cr>", "Find keymaps" },
		g = { "<cmd> Telescop live_grep<cr>", "live grep" },
		r = { "<cmd> Telescop lsp_references<cr>", "Find all refrences" },
		d = { "<cmd> Telescop diagnostics<cr>", "Find diagnostics" },
		m = { "<cmd> Telescop marks<cr>", "Find marks" },
		c = { "<cmd> Easypick changed_files<cr>", "Show all changed files" },
		C = { "<cmd> Easypick changed_files_main<cr>", "Show all changed files of this branch" },
	},
	h = { "<cmd>nohlsearch<CR>", "No Highlight" },
	t = {
		name = "Toggle",
		z = { "<cmd>ZenMode<CR>", "Zen mode" },
		h = { "<cmd>TSToggle highlight<CR>", "TS highlight" },
		i = { "<cmd>IndentBlanklineToggle!<CR>", "TS indent" },
		r = { "<cmd>TSToggle rainbow<CR>", "TS rainbow" },
	},
	-- t = {
	--   name = "Toggle Term",
	--   f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	--   h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Horizontal" },
	--   v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	-- },
	g = {
		name = "Git",
		k = { "<cmd>:Gitsigns prev_hunk<cr>", "Previous hunk" },
		j = { "<cmd>:Gitsigns next_hunk<cr>", "Next hunk" },
		b = { "<cmd>:Gitsigns blame_line<cr>", "Show blame" },
		p = { "<cmd>:Gitsigns preview_hunk<cr>", "Preview hunk" },
		s = { "<cmd>:Gitsigns stage_buffer<cr>", "Stage file" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		x = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		D = { "<cmd>:Gitsigns diffthis<cr>", "Diff" },
		R = { "<cmd>:Gitsigns reset_hunk<cr>", "reset_hunk" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
	},
	l = {
		name = "LSP",
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "Refrences" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
	},
	k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show info" },
	-- k = { "<cmd> lua  require('hover').hover() <cr> ", "Show info" },

	d = {
		name = "Diagnostics",
		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next" },
		h = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open float" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code actions" },
	},
}

wk.setup(setup)
wk.register(mappings, opts)
