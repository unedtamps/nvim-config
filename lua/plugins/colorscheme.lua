--return {
--	"folke/tokyonight.nvim",
--	lazy = false,
--	priority = 1000,
--	opts = {},
--	config = function()
--		require("tokyonight").setup({
--			style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--			light_style = "day", -- The theme is used when the background is set to light
--			transparent = true, -- Enable this to disable setting the background color
--			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
--			styles = {
--				-- Style to be applied to different syntax groups
--				-- Value is any valid attr-list value for `:help nvim_set_hl`
--				comments = { italic = true },
--				keywords = { italic = true },
--				functions = { bold = true },
--				variables = {},
--				-- Background styles. Can be "dark", "transparent" or "normal"
--				sidebars = "transparent", -- style for sidebars, see below
--				floats = "transparent", -- style for floating windows
--			},
--			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
--			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
--			hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
--			dim_inactive = false, -- dims inactive windows
--			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

--			--- You can override specific color groups to use other groups or a hex color
--			--- function will be called with a ColorScheme table
--			---@param colors ColorScheme
--			on_colors = function(colors) end,

--			--- You can override specific highlights to use other groups or a hex color
--			--- function will be called with a Highlights and ColorScheme table
--			---@param highlights Highlights
--			---@param colors ColorScheme
--			on_highlights = function(highlights, colors) end,
--		})
--		vim.cmd.colorscheme("tokyonight-moon")
--	end,
--}

return {
	"EdenEast/nightfox.nvim",
	config = function()
		-- Default options
		require("nightfox").setup({
			options = {
				-- Compiled file's destination location
				compile_path = vim.fn.stdpath("cache") .. "/carbonfox",
				compile_file_suffix = "_compiled", -- Compiled file suffix
				transparent = true, -- Disable setting background
				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false, -- Non focused panes set to alternative background
				module_default = true, -- Default enable value for modules
				colorblind = {
					enable = false, -- Enable colorblind support
					simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
					severity = {
						protan = 0, -- Severity [0,1] for protan (red)
						deutan = 0, -- Severity [0,1] for deutan (green)
						tritan = 0, -- Severity [0,1] for tritan (blue)
					},
				},
				styles = { -- Style to be applied to different syntax groups
					comments = "italic", -- Value is any valid attr-list value `:help attr-list`
					conditionals = "NONE",
					constants = "NONE",
					functions = "italic,bold",
					keywords = "NONE",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "bold",
					variables = "NONE",
				},
				inverse = { -- Inverse highlight for different types
					match_paren = false,
					visual = false,
					search = false,
				},
				modules = { -- List of various plugins and additional options
					-- ...
				},
			},
			palettes = {},
			specs = {},
			groups = {},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme carbonfox")
	end,
}

-- return {
-- 	"ayu-theme/ayu-vim",
-- 	config = function()
-- 		vim.g.ayucolor = "dark" -- options: 'light', 'mirage', 'dark'
-- 		vim.cmd("colorscheme ayu")
-- 	end,
-- }
