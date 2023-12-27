return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"intelephense",
					"tsserver",
					"clangd",
					"sqlls",
					"html",
					"htmx",
					"cssls",
					"templ",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.intelephense.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.clangd.setup({})
			lspconfig.sqlls.setup({})
			lspconfig.html.setup({})
			lspconfig.htmx.setup({})
			lspconfig.cssls.setup({})
			lspconfig.tailwindcss.setup({})
			lspconfig.templ.setup({})
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = true,
					signs = true,
				})
			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
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
				},
			})
		end,
	},
}
