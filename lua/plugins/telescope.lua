return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
			vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>ps", builtin.grep_string, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = { file_ignore_patterns = { "node_modules" } },
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("file_browser")

			vim.keymap.set("n", "<leader>pd", telescope.extensions.file_browser.file_browser, {})
		end,
	},
}
