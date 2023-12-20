local exec = vim.api.nvim_exec -- execute Vimscript
local cmd = vim.cmd            -- execute Vim commands

exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500, on_visual=true}
  augroup end
]],
	false
)

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
