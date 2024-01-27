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
					"html",
					"htmx",
					"cssls",
					"templ",
					"tailwindcss",
					"jdtls",
					"svelte",
					"marksman",
					"jsonls",
					"hydra_lsp",
					"sqlls",
					"prismals",
					"stimulus_ls",
					"pylsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "templ", "blade" },
			})
			lspconfig.htmx.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.prismals.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "templ", "astro", "javascript", "typescript", "react", "blade" },
				init_options = { userLanguages = { templ = "html" }, { blade = "html" } },
			})
			lspconfig.stimulus_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "blade" },
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.hydra_lsp.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					virtual_text = true,
					signs = true,
				})
			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
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
