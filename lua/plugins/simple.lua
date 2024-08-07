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
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			local leap = require("leap")
			leap.add_default_mappings()
			leap.opts.case_sensitive = true
			leap.opts.max_highlighted_traversal_targets = 10
			leap.init_highlight(true)
		end,
		vim.keymap.set("n", "s", "<Plug>(leap)"),
		-- -- vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)"),
		-- -- vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)"),
		-- -- vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)"),
		-- vim.keymap.set("n", "S", "<Plug>(leap-from-window)"),
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	version = "*",
	-- 	dependencies = "nvim-tree/nvim-web-devicons",
	-- 	config = function()
	-- 		vim.opt.termguicolors = true
	-- 		require("bufferline").setup({
	-- 			options = {
	-- 				numbers = "ordinal",
	-- 				diagnostics = "nvim_lsp",
	-- 			},
	-- 		})
	-- 		vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
	-- 		vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
	-- 		vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
	-- 		vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
	-- 		vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
	-- 		vim.keymap.set("n", "N", "<cmd>bn<CR>")
	-- 		vim.keymap.set("n", "S", "<cmd>bp<CR>")
	-- 	end,
	-- },
}
