return {
    "NeogitOrg/neogit",
    lazy = true,
    cmd = "Neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        require("neogit").setup({
            kind = "split",
        })
    end,
    commander = {
        {
            keys = { "n", "<leader>gg" },
            cmd = [[<cmd>Neogit<cr>]],
            desc = "Neogit: Open",
        },
    },
}
