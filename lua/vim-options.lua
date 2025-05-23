vim.g.mapleader = " "

vim.cmd("set number relativenumber")
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.termguicolors = true

vim.opt.guicursor = {
	"n-v-c-sm:block",
	"i-ci-ve:block",
	"r-cr-o:hor20",
}
vim.cmd("set textwidth=80")
vim.cmd("set colorcolumn=80")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set foldmethod=syntax")
vim.cmd("set numberwidth=1")
-- vim.cmd("set guioptions+=T")
vim.api.nvim_set_option("signcolumn", "yes:1")

-- Clear the background for virtual text diagnostics

-- Optionally, you can also change the foreground color if you want
-- vim.api.nvim_command('highlight DiagnosticVirtualTextError guifg=#ff0000 guibg=NONE')

vim.g.user_emmet_mode = "n"
vim.g.user_emmet_leader_key = ","

vim.cmd([[
  augroup templFileType
    autocmd!
    autocmd BufRead,BufNewFile *.templ set filetype=templ
  augroup END
]])

vim.cmd([[
augroup BladeFiltypeRelated
  au BufNewFile,BufRead *.blade.php set ft=blade
augroup END
]])

-- vim.cmd([[
--   highlight DiagnosticSignError guifg=#FF0000
--   sign define DiagnosticSignError text=✗ texthl=DiagnosticSignError numhl=DiagnosticSignError
-- ]])

vim.api.nvim_exec(
	[[
  autocmd FileType html,xml,xsl,jsx,tsx,js,json,php,vue EmmetInstall
]],
	false
)

vim.api.nvim_exec(
	[[
autocmd FileType apache setlocal commentstring=#\ %s
  ]],
	false
)

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

vim.api.nvim_create_augroup("DisableCopilotOnNewBuffer", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = "DisableCopilotOnNewBuffer",
	command = "Copilot disable",
})

vim.o.title = true

vim.api.nvim_exec(
	[[
  augroup UpdateTitle
    autocmd!
    autocmd BufEnter * let &titlestring = expand("%:~:.")
  augroup END
]],
	false
)

vim.o.wildoptions = vim.o.wildoptions:gsub(",pum", "")
vim.g.netrw_banner = 0
