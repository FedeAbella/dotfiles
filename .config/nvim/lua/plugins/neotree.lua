return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    --    config = function()
    --        vim.keymap.set('n', '<C-n>', [[<cmd>Neotree toggle<cr>]], { desc = { 'Open Neotree' } })
    --    end
    commander = {
        {
            keys = { "n", "<C-n>" },
            cmd = [[<cmd>Neotree toggle<cr>]],
            desc = "Neotree: Toggle",
        },
    },
}
