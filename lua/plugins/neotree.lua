return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignore = false,
					hide_by_name = {
						"node_modules",
					},
				},
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
				-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
				-- then these will never be used.
				default = "☁",
				highlight = "NeoTreeFileIcon",
			},
		})
		vim.keymap.set("n", "<leader>nv", ":Neotree filesystem reveal left<CR>")
		vim.keymap.set("n", "<leader>ns", ":Neotree filesystem close<CR>")
	end,
}
