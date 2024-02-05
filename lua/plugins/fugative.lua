return {
	"tpope/vim-fugitive",
	vim.keymap.set("n", "<leader>gg", "<cmd>vertical rightbelow G<CR>"),
	vim.keymap.set("n", "<leader>gb", "<cmd>vertical rightbelow G blame<CR>"),
	vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>"),
	vim.keymap.set("n", "<leader>gl", "<cmd>vertical rightbelow G log<CR>"),
}
