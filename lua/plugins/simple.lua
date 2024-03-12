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
	-- {
	-- 	"edluffy/hologram.nvim",
	-- 	config = function()
	-- 		require("hologram").setup({
	-- 			auto_display = true, -- WIP automatic markdown image display, may be prone to breaking
	-- 		})
	-- 	end,
	-- },
}
