return {
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
	},
	"stevearc/dressing.nvim",
	config = function()
		require("jupynium").setup({})
	end,
	vim.cmd([[
  hi! link JupyniumCodeCellSeparator CursorLine
  hi! link JupyniumMarkdownCellSeparator CursorLine
  hi! link JupyniumMarkdownCellContent CursorLine
  hi! link JupyniumMagicCommand Keyword
  ]]),
	vim.keymap.set(
		"n",
		"<leader>ja",
		":JupyniumStartAndAttachToServer<CR>",
		{ noremap = true, silent = true, buffer = true }
	),
	vim.keymap.set("n", "<leader>jd", ":JupyniumDownloadIpynb<CR>", { noremap = true, silent = true, buffer = true }),
	vim.keymap.set("n", "<leader>js", ":JupyniumStartSync<CR>", { noremap = true, silent = true, buffer = true }),
}
