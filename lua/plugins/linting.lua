return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				golang = { "golangci-lint" },
				php = { "phpcs" },
				c = { "cpplint" },
				cpp = { "cpplint" },
				python = { "pylint", "ruff" },
				java = { "checkstyle" },
				-- rust = { "snyk" },
				sh = { "shellcheck" },
				make = { "checkmake" },
				kotlin = { "ktlint" },
			}
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
			vim.keymap.set("n", "<leader>li", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool = require("mason-tool-installer")
			mason_tool.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"isort",
					"black",
					"eslint_d",
					"phpcs",
					"golangci-lint",
					"cpplint",
					"checkmake",
					"ktlint",
					"shellcheck",
					"checkstyle",
					"eslint_d",
					"pylint",
					"golangci-lint",
				},
			})
		end,
	},
}
