return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile", "BufWritePre" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd", "prettier " },
					typescript = { "pretitred", "prettier" },
					typescriptreact = { "prettier", "pretitred" },
					json = { "prettier" },
					html = { "prettier" },
					go = { "gofumt", "goimports", "golines" },
					lua = { "stylua" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					php = { "phpcbf" },
					blade = { "blade-formatter" },
					python = { "isort", "black" },
					yaml = { "yamlfmt" },
					java = { "google-java-format" },
					sql = { "sql-formatter" },
					sh = { "shfmt" },
					asm = { "asmfmt" },
					kotlin = { "ktlint" },
				},

				format_on_save = {
					lsp_fallback = true,
					asyc = false,
					timeout_ms = 10000,
				},
				notify_on_error = true,
			})

			vim.keymap.set({ "n", "v" }, "<c-I>", function()
				conform.format({
					lsp_fallback = true,
					asyc = false,
					timeout_ms = 10000,
				})
			end, { desc = "Format file on range (invisual mode)" })
		end,
	},
	{
		"rust-lang/rust.vim",
	},
}
