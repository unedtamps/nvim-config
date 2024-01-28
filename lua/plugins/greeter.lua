return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	indent = false,
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			hide = {
				statusline = true,
				tabline = true,
				winbar = true,
			},
			preview = {
				file_width = true,
			},
			config = {
				header = {
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                     ]],
					[[       ████ ██████           █████      ██                     ]],
					[[      ███████████             █████                             ]],
					[[      █████████ ███████████████████ ███   ███████████   ]],
					[[     █████████  ███    █████████████ █████ ██████████████   ]],
					[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
					[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
					[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
					[[                                                                       ]],
					[[                                                                       ]],
					[[                                                                       ]],
				},
				week_header = {
					enable = false,
				},
				shortcut = {
					{ icon = "⟳ ", desc = "Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						desc = "String",
						group = "DiagnosticHint",
						action = "Telescope grep_string",
						key = "s",
					},
				},
			}, -- config
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
