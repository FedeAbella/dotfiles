return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                dim_inactive = {
                    enabled = true,
                    percentage = 0.01,
                },
                integrations = {
                    gitsigns = true,
                    neotree = true,
                    ufo = true,
                    notify = true,
                },
            })
            vim.cmd.colorscheme("catppuccin-mocha")
            vim.api.nvim_set_hl(0, "Whitespace", { fg = "#6c7086" })
        end,
    },
}