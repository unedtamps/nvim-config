return {
    {
      "williamboman/mason.nvim",
       config = function()
          require("mason").setup()
        end
    },
    {
      "williamboman/mason-lspconfig.nvim",
        config = function()
        require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls","gopls", "intelephense", "tsserver", "clangd", "sqlls", "html", "htmx", "cssls"}
        })
      end
    },
    {
    "neovim/nvim-lspconfig",
      config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.intelephense.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.clangd.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.html.setup({})
      lspconfig.htmx.setup({})
      lspconfig.cssls.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition,{})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      end
    }
}
