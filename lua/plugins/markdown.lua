return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	config = function()
		vim.fn["mkdp#util#install"]()
		vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
	end,
}
