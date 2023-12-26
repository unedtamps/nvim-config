return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_c = { "filename", "filesize", "require'lsp-status'.status()" },
				lualine_y = { "progress" },
			},
		})
	end,
}
