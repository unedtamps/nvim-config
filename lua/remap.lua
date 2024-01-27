vim.keymap.set("n", "B", "^")
vim.keymap.set("n", "<leader>ff", "F")
vim.keymap.set("n", "U", "<c-r>")
--vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "p", '"_dp')

-- notes : <C-w>z toogle preview result
-- <c-w>r change draw postiio
-- <c-w>k and <c-w>j atas bawah
--
