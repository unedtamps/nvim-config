return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "left", -- | top | left | right
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 25,
				keymap = {
					accept = "<tab>",
					accept_word = false,
					accept_line = false,
					next = "<down>",
					prev = "<up>",
					dismiss = "<left>",
				},
			},
			filetypes = {
				yaml = true,
				dockerfile = true,
				markdown = true,
				help = false,
				gitcommit = true,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				--["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
