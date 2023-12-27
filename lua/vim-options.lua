vim.cmd("set number relativenumber")
vim.cmd("set wrap")
vim.cmd("set linebreak")
vim.cmd("set textwidth=80")
vim.cmd("set colorcolumn=80")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set foldmethod=syntax")

--vim.cmd("inoremap ( ()<Esc>i")
--vim.cmd("inoremap { {}<Esc>i")
--vim.cmd("inoremap {<CR> {<CR>}<Esc>O")
--vim.cmd("inoremap [ []<Esc>i", "")
vim.cmd("inoremap < <><Esc>i")
--vim.cmd("inoremap ' ''<Esc>i")
--vim.cmd('inoremap " ""<Esc>i')
--vim.keymap.set("n", "<leader>tr", ":vsplit<CR>")
--vim.keymap.set("n", "<leader>trn", ":vnew<CR>")
vim.keymap.set("n", "<leader>ml", "<c-w>h<CR>")
vim.keymap.set("n", "<leader>mr", "<c-w>l<CR>")

--vim.keymap.set("n", "<leader>cl", ":close<CR>")
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_leader_key = ","
-- init.lua
vim.cmd([[
  augroup templFileType
    autocmd!
    autocmd BufRead,BufNewFile *.templ set filetype=templ
  augroup END
]])

-- Add the following lines to enable Emmet
vim.api.nvim_exec(
	[[
  autocmd FileType html,xml,xsl,jsx,tsx,js,json,php,vue EmmetInstall
]],
	false
)
vim.o.title = true

vim.g.mapleader = " "
