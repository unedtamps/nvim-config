return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"php",
				"go",
				"c",
				"cpp",
				"css",
				"gomod",
				"gosum",
				"html",
				"toml",
				"templ",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
