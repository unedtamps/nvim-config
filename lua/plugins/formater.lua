return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				go = { "gofumt", "goimports", "golines" },
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				php = { "php_cs_fixer" },
				blade = { "blade-formatter" },
			},

			format_on_save = {
				lsp_fallback = true,
				asyc = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<c-I>", function()
			conform.format({
				lsp_fallback = true,
				asyc = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file on range (invisual mode)" })
	end,
}
