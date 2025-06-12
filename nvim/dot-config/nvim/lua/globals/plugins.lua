-- Bootstrapping
-- Automaticly installs packer when config is clonned
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
			fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- Automaticly run PackerSync when plugins.lua is updated
vim.cmd([[
  augroup plugins
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	-- manages it self
	use("wbthomason/packer.nvim")

	-- coloscheme
	use({ "folke/tokyonight.nvim" })
	use({ "gruvbox-community/gruvbox" })
	-- use { 'gruvbox-community/gruvbox', commit = '2b5b1f7' }
	-- use 'morhetz/gruvbox'
	-- use "ellisonleao/gruvbox.nvim"
	-- use "sainnhe/gruvbox-material"
	use("AlexvZyl/nordic.nvim")

	-- Which key plugin for a popup with keybindings
	use("folke/which-key.nvim")

	--nvim-tree.lua file explorer plugin
	use("nvim-tree/nvim-tree.lua")

	-- Showing git signs next to line number
	use("lewis6991/gitsigns.nvim")

	-- Telescope a fuzzy searcher
	use({
		"nvim-telescope/telescope.nvim",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Telescope plugins
	use({ "axkirillov/easypick.nvim", requires = "nvim-telescope/telescope.nvim" })
	use("debugloop/telescope-undo.nvim")
	use({
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})

	-- Showing a nice looking bufferline
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "nvim-tree/nvim-web-devicons" })

	-- Simple status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	-- -- Pop up terminal
	-- use { "akinsho/toggleterm.nvim", tag = 'v2.*' }
	--
	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("b0o/schemastore.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("HiPhish/nvim-ts-rainbow2")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("terrortylor/nvim-comment")

	use("jose-elias-alvarez/null-ls.nvim")
	-- use "nvimtools/none-ls.nvim" -- modern fork of nulls

	use("yamatsum/nvim-cursorline")
	use("hood/popui.nvim")

	use("lukas-reineke/indent-blankline.nvim")
	--  CMP

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-path")
	-- use "rafamadriz/friendly-snippets"
	use("norcalli/nvim-colorizer.lua")
	-- use "lewis6991/hover.nvim"
	use({
		"Fildo7525/pretty_hover",
		config = function()
			require("pretty_hover").setup()
		end,
	})
	-- use { 'dsznajder/vscode-es7-javascript-react-snippets',
	-- 	run = 'yarn install --frozen-lockfile && yarn compile'
	-- }
	use({ "saadparwaiz1/cmp_luasnip" })

	use("sakhnik/nvim-gdb")
	use("dnlhc/glance.nvim")

	-- use 'nvim-pack/nvim-spectre'

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use({
		"epwalsh/obsidian.nvim",
		tag = "*", -- recommended, use latest release instead of latest commit
		requires = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			require("obsidian").setup({
				workspaces = {
					{
						name = "OPVault",
						path = "~/docs/OPVault",
					},

					-- see below for full list of options 👇
				},
			})
		end,
	})

	-- use {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- }

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
