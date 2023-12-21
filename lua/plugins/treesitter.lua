return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "javascript", "php", "go"},
            highlight = {enable = true},
            indent = {enable = true},
        })
        end
}
