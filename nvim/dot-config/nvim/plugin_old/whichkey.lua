local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {

	---@type wk.Win.opts
	win = {
		-- width = 1,
		-- height = { min = 4, max = 25 },
		-- col = 0,
		-- row = math.huge,
		border = "rounded",
		padding = { 2, 2, 2, 2 }, -- extra window padding [top/bottom, right/left]
		title = true,
		title_pos = "center",
		zindex = 1000,
		-- Additional vim.wo and vim.bo options
		bo = {},
		wo = {
			winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		},
	},
}
local mappings = {
	{
		"<leader>d",
		group = "Diagnostics",
		nowait = false,
		remap = false,
	},
	{
		"<leader>g",
		group = "Git",
		nowait = false,
		remap = false,
	},
	{
		"<leader>gs",
		"<cmd>:Gitsigns stage_buffer<cr>",
		desc = "Stage file",
		nowait = false,
		remap = false,
	},
	{
		"<leader>l",
		group = "LSP",
		nowait = false,
		remap = false,
	},
	{
		"<leader>lD",
		"<cmd>lua vim.lsp.buf.declaration()<cr>",
		desc = "Declaration",
		nowait = false,
		remap = false,
	},
	{
		"<leader>s",
		group = "Search",
		nowait = false,
		remap = false,
	},
	{
		"<leader>t",
		group = "Toggle",
		nowait = false,
		remap = false,
	},
	-- {
	-- 	"<leader>ti",
	-- 	"<cmd>IndentBlanklineToggle!<CR>",
	-- 	desc = "TS indent",
	-- 	nowait = false,
	-- 	remap = false,
	-- },
}

wk.setup(setup)
-- wk.setup()
-- wk.register(mappings, opts)
wk.add(mappings)
