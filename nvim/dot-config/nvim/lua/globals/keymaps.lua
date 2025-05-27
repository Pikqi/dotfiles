local defaults = { silent = true, noremap = true, }

--local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap

function keymap(mode, lhs, rhs, opts)
	local final_opts = {};
	for k, v in pairs(defaults) do final_opts[k] = v end
	for k, v in pairs(opts) do final_opts[k] = v end

	vim.keymap.set(mode, lhs, rhs, final_opts)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- keymap("n", "<C-m>", "<Nop>", {})
-- Normal --
--
--
keymap("n", "x", '"_x', {})
keymap("n", "c", '"_c', {})
keymap("n", "C", '"_C', {})
keymap("v", "x", '"_x', {})
keymap("v", "c", '"_c', {})
-- commenting
keymap("n", ",", ":CommentToggle<CR>", {})

-- Marks

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", {})
keymap("n", "<C-j>", "<C-w>j", {})
keymap("n", "<C-k>", "<C-w>k", {})
keymap("n", "<C-l>", "<C-w>l", {})

-- Resize with arrows -- Conflicted with mac os
keymap("n", "<C-Up>", ":resize +2<CR>", {})
keymap("n", "<C-Down>", ":resize -2<CR>", {})
keymap("n", "<C-Left>", ":vertical resize +2<CR>", {})
keymap("n", "<C-Right>", ":vertical resize -2<CR>", {})

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", {})
keymap("n", "<S-h>", ":bprevious<CR>", {})

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", {})
keymap("n", "<A-k>", ":m .-2<CR>==", {})

-- Insert
-- Move text up and down
keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", {})
keymap("i", "<M-k>", "<Esc>:m .-2<CR>==", {})

-- Move text up and down MacOS
keymap("i", "∆", "<Esc>:m .+1<CR>==gi", {})
keymap("i", "˚", "<Esc>:m .-2<CR>==", {})

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", {})
keymap("v", ">", ">gv", {})

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", {})
keymap("v", "<A-k>", ":m .-2<CR>==", {})
keymap("v", "p", '"_dP', {})

-- Move text up and down MacOS
keymap("v", "˚", ":m .-2<CR>==", {})
keymap("v", "∆", ":m .+1<CR>==", {})

-- Comment in visual mode

keymap("v", ",", ":CommentToggle<CR>", {})
-- Swap delete and cut in visual mode
--keymap("v", "<leader>d", '""d', {})
--keymap("v", "d", '"_d', {})

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", {})
keymap("x", "K", ":move '<-2<CR>gv-gv", {})
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", {})
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", {})

keymap("x", ",", ":CommentToggle<CR>", {})

-- Leader
keymap("n", "<leader>w", ":w!<cr>", { desc = "Save" })
keymap("n", "<leader>W", ":noa w<cr>", { desc = "Save without formatting" })
keymap("n", "<leader>q", ":q!<cr>", { desc = "Quit" })
keymap("n", "<leader>Q", ":qa!<cr>", { desc = "Quit all" })
keymap("n", "<leader>r", ":NvimTreeFindFile<cr>", { desc = "Open file in tree" })
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "Open file tree" })
keymap("n", "<leader>k", ":lua require('pretty_hover').hover()<cr>", { desc = "Hover" })
keymap("n", "<leader>h", ":nohlsearch<cr>", { desc = "No highlight" })
keymap("n", "<leader>f", ":Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>R", ":Telescope oldfiles<cr>", { desc = "Recent files" })
keymap("n", "<leader>c", ":bdelete!<cr>:bnext<cr>", { desc = "Close buff" })
keymap("n", "<leader>c", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all other buffers" })



-- s Search
keymap("n", "<leader>sg", ":Telescope live_grep<CR>", { desc = "Live grep" })
keymap("n", "<leader>sd", ":Telescope diagnostics<CR>", { desc = "Diagnostics" })
keymap("n", "<leader>sb", ":Telescope buffers<CR>", { desc = "Buffers" })
keymap("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "Help tags" })
keymap("n", "<leader>ss", ":Telescope resume<CR>", { desc = "Resume last query" })
keymap("n", "<leader>sk", ":Telescope keymaps<CR>", { desc = "Keymaps" })
keymap("n", "<leader>sm", ":Telescope marks<CR>", { desc = "Marks" })
keymap("n", "<leader>sc", ":Easypick changed_files<CR>", { desc = "Changed files" })
keymap("n", "<leader>sC", ":Easypick changed_files_main<CR>", { desc = "Changed files from main" })
keymap("n", "<leader>sK", ":Easypick conflicts<CR>", { desc = "Conflicts" })
keymap("n", "<leader>sr", ":Telescope lsp_refrences<CR>", { desc = "Refrences" })
keymap("n", "<leader>sS", ":Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
keymap("n", "<leader>sW", ":Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
keymap("n", "<leader>s/", ":Telescope search_history<CR>", { desc = "Search history" })
keymap("n", "<leader>sw", ":Telescope grep_string<CR>", { desc = "Find selection" })
keymap("n", "<leader>sp", ":Telescope spell_suggest<CR>", { desc = "Spell suggest" })

-- t Toggles
keymap("n", "<leader>tb", ":set list!<CR>", { desc = "Show whitespace" })
keymap("n", "<leader>tg", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Line blame" })
keymap("n", "<leader>tr", ":TSToggle rainbow<CR>", { desc = "Rainbow" })
keymap("n", "<leader>th", ":TSToggle highlight<CR>", { desc = "TS highlight" })
keymap("n", "<leader>tw", ":set wrap!<CR>", { desc = "Wrap lines" })
keymap("n", "<leader>tz", ":ZenMode<CR>", { desc = "Zen mode" })
keymap("n", "<leader>ti", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "Inlay hints" })
keymap('n', "<leader>td", function()
	local new_config = not vim.diagnostic.config().virtual_text
	vim.diagnostic.config({ virtual_text = new_config })
end, { desc = 'Toggle diagnostic virtual_text' })

keymap('n', "<leader>tD", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })



-- g Git
keymap("n", "<leader>gR", ":Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Show blame" })
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", { desc = "Checkout commit" })
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff" })
keymap("n", "<leader>gj", ":Gitsigns next_hunk<CR>", { desc = "Next hunk" })
keymap("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", { desc = "Prev hunk" })
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
keymap("n", "<leader>gl", ":Gitsigns toggle_linehl<CR>", { desc = "Show lines" })
keymap("n", "<leader>gw", ":Gitsigns toggle_word_diff<CR>", { desc = "Show word diff" })
keymap("n", "<leader>gx", ":Telescope git_branches<CR>", { desc = "Branches" })
keymap("n", "<leader>gB", ":Telescope git_bcommits<CR>", { desc = "Buffer commits" })
-- d Diagnostics

keymap("n", "<leader>da", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions" })
keymap("n", "<leader>dh", ":lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostics" })
keymap("n", "<leader>dj", ":lua vim.diagnostic.goto_next()<CR>", { desc = "Go to next" })
keymap("n", "<leader>dk", ":lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous" })
keymap("n", "<leader>dk", ":lua vim.diagnostic.goto_prev()<CR>", { desc = "Go to previous" })

-- l LSP
keymap("n", "<leader>lR", ":Glance references<CR>", { desc = "Glance refrences" })
keymap("n", "<leader>ld", ":Glance definitions<CR>", { desc = "Glance definitions" })
keymap("n", "<leader>li", ":Glance implementations<CR>", { desc = "Glance implementations" })
keymap("n", "<leader>lr", ":lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
