return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zj", require("ufo").openAllFolds)
		vim.keymap.set("n", "zk", require("ufo").closeAllFolds)
		vim.keymap.set("n", "zh", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				-- choose one of coc.nvim and nvim lsp
				vim.fn.CocActionAsync("definitionHover") -- coc.nvim
				vim.lsp.buf.hover()
			end
		end)
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp" }
			end,
		})
	end,
}
