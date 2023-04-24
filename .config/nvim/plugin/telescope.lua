local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.yarn/*")

table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!*.lock")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			hidden = true,
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
})

local easypick = require("easypick")

-- only required for the example to work
local base_branch = "main"

easypick.setup({
	pickers = {
		-- add your custom pickers here
		-- below you can find some examples of what those can look like

		-- list files inside current folder with default previewer
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "ls",
			-- the command to execute, output has to be a list of plain text entries
			command = "ls",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},

		-- diff current branch with base_branch and show files that changed with respective diffs in preview
		{
			name = "changed_files",
			command = "git ls-files --others --exclude-standard --full-name | cat && git diff --name-only",
			previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
		},

		-- diff current branch with base_branch and show files that changed from main
		{
			name = "changed_files_main",
			command = "git ls-files --others --exclude-standard --full-name | cat && git diff --name-only main",
			previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
		},
		-- list files that have conflicts with diffs in preview
		{
			name = "conflicts",
			command = "git diff --name-only --diff-filter=U --relative",
			previewer = easypick.previewers.file_diff()
		},
	}
})
