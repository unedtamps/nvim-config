return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		})
		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = {
				spacing = 5,
				severity = { min = vim.diagnostic.severity.WARN },
			},
			update_in_insert = true,
		})
	end,
}
