return {
	{
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
			},
		},
		{

			"hrsh7th/nvim-cmp",
			version = false, -- last release is way too old
			event = "InsertEnter",
			dependencies = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"davidsierradz/cmp-conventionalcommits",
				"hrsh7th/cmp-cmdline",
			},
			opts = function()
				vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
				require("luasnip.loaders.from_vscode").lazy_load()
				local cmp = require("cmp")
				local defaults = require("cmp.config.default")()
				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})
				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
						{
							name = "cmdline",
							option = {
								ignore_cmds = { "Man", "!" },
							},
						},
					}),
				})
				return {
					completion = {
						completeopt = "menu,menuone,noinsert",
					},
					snippet = {
						expand = function(args)
							require("luasnip").lsp_expand(args.body)
							require("luasnip").filetype_extend(
								"ruby",
								"rails",
								"typescript",
								"javascript",
								"typescriptreact",
								"templ"
							)
						end,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
					},

					mapping = cmp.mapping.preset.insert({
						["J"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
						["K"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<S-CR>"] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						}),
						["<C-CR>"] = function(fallback)
							cmp.abort()
							fallback()
						end,
					}),
					formatting = {
						format = function(entry, vim_item)
							vim_item.menu = ({
								nvim_lsp = "🪛",
								copilot = "🤖",
								luasnip = "🔑",
								path = "[Path]",
								buffer = "[Buffer]",
							})[entry.source.name]
							return vim_item
						end,
					},
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
						{ name = "path" },
						{ name = "conventionalcommits" },
					}, {
						{ name = "buffer" },
					}),

					experimental = {
						ghost_text = {
							hl_group = "CmpGhostText",
						},
					},

					sorting = defaults.sorting,
				}
			end,
			config = function(_, opts)
				for _, source in ipairs(opts.sources) do
					source.group_index = source.group_index or 1
				end
				local cmp = require("cmp")
				cmp.setup(opts)
			end,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				presets = {
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
				routes = {
					filter = { event = "notify", find = "No information available" },
					opts = { skip = true },
				},
				messages = {
					-- NOTE: If you enable messages, then the cmdline is enabled automatically.
					-- This is a current Neovim limitation.
					enabled = false, -- enables the Noice messages UI
					view = "mini", -- default view for messages
					view_error = "notify", -- view for errors
					view_warn = "notify", -- view for warnings
					view_history = "notify", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},
			})
		end,
	},
}
