return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            highlights = {
                duration = 1000
            }
            -- Configuration here, or leave empty to use defaults
        })
        vim.api.nvim_set_hl(0, 'NvimSurroundHighlight', { fg = '#000000', bg = '#b4befe' })
    end
}
