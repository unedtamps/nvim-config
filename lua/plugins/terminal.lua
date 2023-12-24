return {
      'akinsho/toggleterm.nvim',
      version = "*",
      config = function ()
          vim.keymap.set('n', '<C-t>' , ':ToggleTerm size=40 dir=./ direction=horizontal name=desktop')
      end
}

