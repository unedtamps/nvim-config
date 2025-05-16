vim.keymap.set("n", "U", "<c-r>")
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "B", "^")
--vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "p", '"_dp')

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+yg_', { noremap = true })
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true })

-- Paste from clipboard
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true })
vim.keymap.set("v", "<leader>P", '"+P', { noremap = true })

-- notes : <C-w>z toogle preview result
-- <c-w>r change draw postiio
-- <c-w>k and <c-w>j atas bawah
--
