return {

{
    'numToStr/Comment.nvim',
    opts = {
    }
},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function ()
		end
	}

}
