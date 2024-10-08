return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function(_, opts)
			vim.filetype.add({
				pattern = {
					[".*%.blade%.php"] = "blade",
				},
			})
			local config = require("nvim-treesitter.configs")
			local parser = require("nvim-treesitter.parsers").get_parser_configs()
			parser.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}
			config.setup({
				auto_install = true,
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
					"blade",
					"php_only",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
