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
		-- opts = {},
		config = function(_, opts)
			require("lsp_signature").setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"svelte",
					"ast_grep",
					"bashls",
					"templ",
					"remark_ls",
					"rust_analyzer",
					"jdtls",
					"prismals",
					"pyright",
					"intelephense",
					"lua_ls",
					"jsonls",
					"gopls",
					"clangd",
					"html",
					"cssls",
					"biome",
					"asm_lsp",
					"awk_ls",
					"docker_compose_language_service",
					"dockerls",
					"htmx",
					"hydra_lsp",
					"kotlin_language_server",
					"marksman",
					"sqlls",
					"sqls",
					"stimulus_ls",
					"tailwindcss",
					"ts_ls",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local on_attach = function(client, bufnr)
				if vim.lsp.inlay_hint then
					if client.server_capabilities.inlayHintProvider then
						vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
						-- else
						-- 	print("Warning: Inlay hints not available from server")
					end
					-- else
					-- 	print("Warning: Inlay hints not available in this version of Neovim")
				end
			end
			-- local config = require("lspconfig.configs")
			-- local signature_setup = {
			-- 	bind = true,
			-- 	handler_opts = {
			-- 		border = "rounded",
			-- 	},
			-- }
			-- local on_attach = function(_, bufnr)
			-- 	require("lsp-signature").on_attach(signature_setup, bufnr)
			-- end

			-- config.blade = {
			-- 	default_config = {
			-- 		cmd = { "/home/unedotamps/Koding/PHP/LSP/laravel-dev-tools/laravel-dev-tools", "lsp", "-vvv" },
			-- 		filetypes = { "blade" },
			-- 		root_dir = function(fname)
			-- 			return lspconfig.util.find_git_ancestor(fname)
			-- 		end,
			-- 		settings = {},
			-- 	},
			-- }
			lspconfig.kotlin_language_server.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			lspconfig.awk_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			-- lspconfig.blade.setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })

			lspconfig.asm_lsp.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				root_dir = lspconfig.util.root_pattern("Makefile", ".git"),
			})
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
					},
				},
			})
			-- lspconfig.r_language_server.setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				filetypes = { "rust" },
				inlayHints = {
					enable = true,
					typeHints = true,
					parameterHints = true,
					chainingHints = true,
					maxLength = 120,
				},
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
				settings = {
					gopls = {
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
				-- hints = {
				-- 	assignVariableTypes = true,
				-- 	compositeLiteralFields = true,
				-- 	constantValues = true,
				-- 	functionTypeParameters = true,
				-- 	parameterNames = true,
				-- 	rangeVariableTypes = true,
				-- },
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					intelephense = {
						diagnostics = {
							ignoredCodes = { "1003" },
						},
					},
				},
			})
			-- lspconfig.bashls.setup({
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- })
			lspconfig.ts_ls.setup({
				-- settings = {
				-- 	typescript = {
				-- 		inlayHints = {
				-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				-- 			includeInlayFunctionParameterTypeHints = false,
				-- 			includeInlayVariableTypeHints = true,
				-- 			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				-- 			includeInlayPropertyDeclarationTypeHints = true,
				-- 			includeInlayFunctionLikeReturnTypeHints = true,
				-- 			includeInlayEnumMemberValueHints = true,
				-- 		},
				-- 	},
				-- 	javascript = {
				-- 		inlayHints = {
				-- 			includeInlayParameterNameHints = "all",
				-- 			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				-- 			includeInlayFunctionParameterTypeHints = true,
				-- 			includeInlayVariableTypeHints = true,
				-- 			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				-- 			includeInlayPropertyDeclarationTypeHints = true,
				-- 			includeInlayFunctionLikeReturnTypeHints = true,
				-- 			includeInlayEnumMemberValueHints = true,
				-- 		},
				-- 	},
				-- },

				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					clangd = {
						fileStatus = true,
						fallbackFlags = { "-std=c++17" },
						showOrigins = true,
						compileCommands = { "build" },
						semanticHighlighting = true,
						crossFileRename = true,
						-- completion = {
						--   -- clangd will automatically enable completion for C and C++.
						--   -- You can use the following section to enable completion for other languages.
						--   -- enum = { "Enum1", "Enum2" },
						--   -- macro = { "Macro1", "Macro2" },
						--   -- typedef = { "Typedef1", "Typedef2" },
						--   -- global = true,
						-- },
					},
				},
				-- cmd = {
				-- 	"clangd",
				-- 	"--offset-encoding=utf-16",
				-- },
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
				filetypes = { "templ", "astro", "javascript", "react", "blade", "typescriptreact" },
				init_options = { userLanguages = { templ = "html" }, { blade = "html" } },
			})
			lspconfig.templ.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = {
					["language/status"] = function(_, result, ctx, _)
						if result.type == "ServiceReady" then
							for _, bufnr in ipairs(vim.lsp.get_buffers_by_client_id(ctx.client_id)) do
								vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
							end
						end
					end,
				},

				settings = {
					java = {
						inlayHints = { parameterNames = { enabled = "all" } },
						signatureHelp = { enabled = true },
					},
				},
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

			-- Set the text color for virtual text diagnostics
			vim.api.nvim_command("highlight DiagnosticVirtualTextError guifg=#fa1616 guibg=NONE")
			vim.api.nvim_command("highlight DiagnosticVirtualTextWarn guifg=#f1fa8c guibg=NONE")
			vim.api.nvim_command("highlight DiagnosticVirtualTextInfo guifg=#8be9fd guibg=NONE")
			vim.api.nvim_command("highlight DiagnosticVirtualTextHint guifg=#50fa7b guibg=NONE")

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = false,
					virtual_text = true,
					signs = true,
				})
			local on_references = vim.lsp.handlers["textDocument/references"]
			vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, {
				loclist = true,
			})
			vim.diagnostic.update_in_insert = false

			-- vim.diagnostic.config({
			-- 	signs = {
			-- 		text = {
			-- 			[vim.diagnostic.severity.ERROR] = "",
			-- 			[vim.diagnostic.severity.WARN] = "",
			-- 		},
			-- 		linehl = {
			-- 			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			-- 		},
			-- 		numhl = {
			-- 			[vim.diagnostic.severity.WARN] = "WarningMsg",
			-- 			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			-- 		},
			-- 	},
			-- })

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
	{
		"ricardoramirezr/blade-nav.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		ft = { "blade", "php" },
	},
}
