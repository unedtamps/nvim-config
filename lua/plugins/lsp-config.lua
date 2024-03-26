return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function()
			require("lsp-inlayhints").setup({})
			vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = "LspAttach_inlayhints",
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("lsp-inlayhints").on_attach(client, bufnr)
				end,
			})
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
					"r_language_server",
					"clangd",
					"html",
					"htmx",
					"cssls",
					"templ",
					"awk_ls",
					"tailwindcss",
					"jdtls",
					"svelte",
					"marksman",
					"jsonls",
					"hydra_lsp",
					"sqlls",
					"prismals",
					"pyright",
					"bashls",
					"dockerls",
					"asm_lsp",
					"docker_compose_language_service",
					"rust_analyzer",
					"kotlin_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local config = require("lspconfig.configs")
			local on_attach = function(_, bufnr)
				require("lsp-signature").on_attach(signature_setup, bufnr)
			end

			config.blade = {
				default_config = {
					cmd = { "/home/unedotamps/Koding/PHP/LSP/laravel-dev-tools/laravel-dev-tools", "lsp", "-vvv" },
					filetypes = { "blade" },
					root_dir = function(fname)
						return lspconfig.util.find_git_ancestor(fname)
					end,
					settings = {},
				},
			}
			lspconfig.kotlin_language_server.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.awk_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.blade.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.asm_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("Makefile", ".git"),
			})
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.r_language_server.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				filetypes = { "rust" },
			})
			lspconfig.docker_compose_language_service.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				lsp_inlay_hints = { enable = false },
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},

				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
			-- lspconfig.sqlls.setup({
			-- 	capabilities = capabilities,
			-- 	root_dir = function()
			-- 		return vim.fn.getcwd()
			-- 	end,
			-- })
			lspconfig.html.setup({
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
				filetypes = { "templ", "astro", "javascript", "typescript", "typescriptreact", "react", "blade" },
				init_options = { userLanguages = { templ = "html" }, { blade = "html" } },
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.hydra_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = false,
					virtual_text = true,
					signs = true,
				})
			local on_references = vim.lsp.handlers["textDocument/references"]
			vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, {
				-- Use location list instead of quickfix list
				loclist = true,
			})
			vim.diagnostic.update_in_insert = false
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

			vim.keymap.set("n", "H", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>da", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
		end,
	},
	{
		"nvim-lua/lsp-status.nvim",
	},
}
