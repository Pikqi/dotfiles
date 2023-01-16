local status_ok, hover = pcall(require, "hover")
if not status_ok then
	return
end

hover.setup {
	init = function()
		-- Require providers
		require('hover.providers.lsp')
		-- require('hover.providers.gh')
		-- require('hover.providers.man')
		-- require('hover.providers.dictionary')
	end,
	-- border = hover
	title = false
}

-- Setup keymaps
-- vim.keymap.set('n',  'K', require('hover').hover       , { desc='hover.nvim'         })
-- vim.keymap.set('n', 'gK', require('hover').hover_select, { desc='hover.nvim (select)' })
