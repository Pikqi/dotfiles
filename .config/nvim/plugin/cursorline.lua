local status_ok, cl = pcall(require, "nvim-cursorline")
if not status_ok then
	return
end

cl.setup({
	cursorline = {
		enable = false,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}

})
