return {
	{
		"michaelb/sniprun",
		branch = "master",

		build = "sh install.sh",

		config = function()
			require("sniprun").setup({})
			vim.keymap.set("n", "<leader>sp", "<cmd>SnipRun<CR>")
			vim.keymap.set("v", "<leader>sp", "<cmd>SnipRun<CR>")
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				filetypes = {
					javascript = "nodemon $filename",
					typescript = {
						"tsc $filename &&",
						"node $filenameWithoutExt.js",
					},
					r = "Rscript $filename",
					python = "python $filename",
					c = {
						"gcc -o $filenameWithoutExt $filename &&",
						"./$filenameWithoutExt",
					},
					cpp = {
						"g++ -o $filenameWithoutExt $filename &&",
						"./$filenameWithoutExt",
					},
					go = {
						"go build $filename &&",
						"./$filenameWithoutExt",
					},
					rust = "cargo run",
				},
				startinsert = true,
				mode = "float",
				float = {
					close_key = "<ESC>",
					border = "double",
					width = 0.5,
					height = 0.6,
					border_hl = "FloatBorder",
					float_hl = "Normal",
				},
				term = {
					position = "bot",
					size = 10,
					direction = "horizontal",
				},
				before_run_filetype = function()
					vim.cmd(":w")
				end,
			})
			vim.keymap.set("n", "<C-n>", "<cmd>RunCode<CR>")
		end,
	},
}
