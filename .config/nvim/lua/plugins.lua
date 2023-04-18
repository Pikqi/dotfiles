-- Bootstrapping
-- Automaticly installs packer when config is clonned
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
		install_path })
	vim.cmd [[packadd packer.nvim]]
end

-- Automaticly run PackerSync when plugins.lua is updated
vim.cmd([[
  augroup plugins
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
	-- manages it self
	use 'wbthomason/packer.nvim'

	-- coloscheme
	use 'gruvbox-community/gruvbox'

	-- Which key plugin for a popup with keybindings
	use "folke/which-key.nvim"

	--nvim-tree.lua file explorer plugin
	use "kyazdani42/nvim-tree.lua"

	-- Showing git signs next to line number
	use "lewis6991/gitsigns.nvim"

	-- Telescope a fuzzy searcher
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- Showing a nice looking bufferline
	use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'nvim-tree/nvim-web-devicons' }

	-- Changing d and x to delete rather than cut
	-- use "gbprod/cutlass.nvim"

	-- Simple status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Pop up terminal
	use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

	-- LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use "HiPhish/nvim-ts-rainbow2"
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use "terrortylor/nvim-comment"

	use "jose-elias-alvarez/null-ls.nvim"

	use "yamatsum/nvim-cursorline"

	use "windwp/nvim-autopairs"

	use 'hood/popui.nvim'

	use "lukas-reineke/indent-blankline.nvim"
	--  CMP

	use 'hrsh7th/nvim-cmp'
	use "hrsh7th/cmp-nvim-lsp"
	use({ "L3MON4D3/LuaSnip" })
	use "hrsh7th/cmp-path"
	use "rafamadriz/friendly-snippets"
	use 'norcalli/nvim-colorizer.lua'
	use "lewis6991/hover.nvim"
	use { 'dsznajder/vscode-es7-javascript-react-snippets',
		run = 'yarn install --frozen-lockfile && yarn compile'
	}
	use { 'saadparwaiz1/cmp_luasnip' }

	-- Lua
	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	use { 'axkirillov/easypick.nvim', requires = 'nvim-telescope/telescope.nvim' }

	-- use 'rcarriga/nvim-notify'
	--

	-- -- use 'github/copilot.vim'
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	}
	-- use {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end
	-- }

	if packer_bootstrap then
		require('packer').sync()
	end
end)
