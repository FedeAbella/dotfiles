return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    lazy = true,
    cmd = "Neotree",
    commander = {
        {
            keys = { "n", "<C-n>" },
            cmd = [[<cmd>Neotree toggle<cr>]],
            desc = "Neotree: Toggle",
        },
    },
}
