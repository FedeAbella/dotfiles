return {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        require("neogit").setup({
            kind = "split_above",
        })
    end,
    commander = {
        {
            keys = { "n", "<leader>gg" },
            cmd = [[<cmd>lua require'neogit'.open()<cr>]],
            desc = "Neogit: Open",
        },
    },
}
