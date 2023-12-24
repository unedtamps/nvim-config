return {
  {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function ()
      require("toggleterm").setup()
        vim.keymap.set('n', '<c-t>' , ':ToggleTerm size=10 dir=./ direction=horizontal<CR>')
        vim.keymap.set('t', '<c-t>' , 'exit<CR>')
    end
  },
}
