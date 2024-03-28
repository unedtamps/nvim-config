return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"tpope/vim-commentary",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>"),
		vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>"),
		vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>"),
		vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>"),
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
				},
			})
			vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
			vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
			vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
			vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
			vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
			vim.keymap.set("n", "N", "<cmd>bn<CR>")
			vim.keymap.set("n", "S", "<cmd>bp<CR>")
		end,
	},
}
