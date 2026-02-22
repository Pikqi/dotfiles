return {
	{
		"frankroeder/parrot.nvim",
		dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
		-- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
		config = function()
			require("parrot").setup {

				prompts = {
					["Spell"] = "I want you to proofread the provided text and fix the errors.",               -- e.g., :'<,'>PrtRewrite Spell
					["Comment"] = "Provide a comment that explains what the snippet is doing.",                -- e.g., :'<,'>PrtPrepend Comment
					["Complete"] = "Continue the implementation of the provided snippet in the file {{filename}}.", -- e.g., :'<,'>PrtAppend Complete
				},

				hooks = {
					CompleteFullContext = function(prt, params)
						local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
						local model_obj = prt.get_model("command")
						prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
					end,

					CodeConsultant = function(prt, params)
						local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
						prt.ChatNew(params, chat_prompt)
					end,


				},

				-- Providers must be explicitly set up to make them available.
				providers = {
					openai = {
						name = "openai",
						api_key = os.getenv "DIY_API_KEY",
						endpoint = os.getenv "DIY_API_URL",
						params = {
							chat = { temperature = 1.1, top_p = 1 },
							command = { temperature = 1.1, top_p = 1 },
						},
						models = {
							os.getenv "DIY_API_MODEL1",
						}
					},
				},



				-- default system prompts used for the chat sessions and the command routines
				system_prompt = {
					-- chat = ...,
					-- command = ...
				},

				-- the prefix used for all commands
				cmd_prefix = "Prt",

				-- optional parameters for curl
				curl_params = {},

				-- The directory to store persisted state information like the
				-- current provider and the selected models
				state_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/parrot/persisted",

				-- The directory to store the chats (searched with PrtChatFinder)
				chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/parrot/chats",

				-- Chat user prompt prefix
				chat_user_prefix = "🗨:",

				-- llm prompt prefix
				llm_prefix = "🦜:",

				-- Explicitly confirm deletion of a chat file
				chat_confirm_delete = true,

				-- Local chat buffer shortcuts
				chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
				chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
				chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
				chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },

				-- Option to move the cursor to the end of the file after finished respond
				chat_free_cursor = false,

				-- Default target for  PrtChatToggle, PrtChatNew, PrtContext and the chats opened from the ChatFinder
				-- values: popup / split / vsplit / tabnew
				toggle_target = "vsplit",

				-- The interactive user input appearing when can be "native" for
				-- vim.ui.input or "buffer" to query the input within a native nvim buffer
				-- (see video demonstrations below)
				user_input_ui = "native",

				-- Popup window layout
				-- border: "single", "double", "rounded", "solid", "shadow", "none"
				style_popup_border = "single",

				-- margins are number of characters or lines
				style_popup_margin_bottom = 8,
				style_popup_margin_left = 1,
				style_popup_margin_right = 2,
				style_popup_margin_top = 2,
				style_popup_max_width = 160,

				-- Prompt used for interactive LLM calls like PrtRewrite where {{llm}} is
				-- a placeholder for the llm name
				command_prompt_prefix_template = "🤖 {{llm}} ~ ",

				-- auto select command response (easier chaining of commands)
				-- if false it also frees up the buffer cursor for further editing elsewhere
				command_auto_select_response = true,

				-- Time in hours until the model cache is refreshed
				-- Set to 0 to deactive model caching
				model_cache_expiry_hours = 48,

				-- fzf_lua options for PrtModel and PrtChatFinder when plugin is installed
				fzf_lua_opts = {
					["--ansi"] = true,
					["--sort"] = "",
					["--info"] = "inline",
					["--layout"] = "reverse",
					["--preview-window"] = "nohidden:right:75%",
				},

				-- Enables the query spinner animation
				enable_spinner = true,
				-- Type of spinner animation to display while loading
				-- Available options: "dots", "line", "star", "bouncing_bar", "bouncing_ball"
				spinner_type = "star",
				-- Show hints for context added through completion with @file, @buffer or @directory
				show_context_hints = true,

				-- Show diff preview before applying changes from rewrite/append/prepend
				enable_preview_mode = true,
				preview_auto_apply = false, -- If true, applies changes automatically after preview timeout
				preview_timeout = 10000, -- Time in ms before auto-apply (if enabled)
				preview_border = "rounded",
				preview_max_width = 120,
				preview_max_height = 30,
			}
		end,
	}

}
