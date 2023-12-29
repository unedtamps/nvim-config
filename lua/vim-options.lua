vim.g.mapleader = " "

vim.cmd("set number relativenumber")
vim.opt.guicursor = ""
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.cmd("set textwidth=80")
vim.cmd("set colorcolumn=80")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set foldmethod=syntax")

vim.api.nvim_set_option("signcolumn", "yes:2")

vim.g.user_emmet_mode = "n"
vim.g.user_emmet_leader_key = ","

vim.cmd([[
  augroup templFileType
    autocmd!
    autocmd BufRead,BufNewFile *.templ set filetype=templ
  augroup END
]])

vim.api.nvim_exec(
	[[
  autocmd FileType html,xml,xsl,jsx,tsx,js,json,php,vue EmmetInstall
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

vim.o.title = true
vim.g.netrw_banner = 0
