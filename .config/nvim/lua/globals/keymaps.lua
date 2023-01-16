local opts = { noremap = true, silent = true }

--local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- commenting
keymap("n", ",", ":CommentToggle<CR>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Chose buffer
keymap("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
keymap("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
keymap("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
keymap("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
keymap("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<cr>", opts)
keymap("n", "<A-0>", "<cmd>BufferLineGoToBuffer -1<cr>", opts)
-- Insert
-- Move text up and down
keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<M-k>", "<Esc>:m .-2<CR>==", opts)

-- Move text up and down MacOS
keymap("i", "∆", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "˚", "<Esc>:m .-2<CR>==", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down MacOS
keymap("v", "∆", ":m .+1<CR>==", opts)
keymap("v", "˚", ":m .-2<CR>==", opts)

-- Comment in visual mode

keymap("v", ",", ":CommentToggle<CR>", opts)
-- Swap delete and cut in visual mode
--keymap("v", "<leader>d", '""d', opts)
--keymap("v", "d", '"_d', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("x", ",", ":CommentToggle<CR>", opts)
