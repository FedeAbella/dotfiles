return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local colors = require("catppuccin.palettes.mocha")
        require("toggleterm").setup({
            highlights = {
                FloatBorder = {
                    guifg = colors.mauve,
                },
            },
            direction = "float",
            float_opts = {
                title_pos = "center",
            },
        })
    end,
    commander = {
        {
            keys = { "n", "<leader>tt" },
            cmd = [[<cmd>1ToggleTerm name=Main<cr>]],
            desc = "ToggleTerm: Open Main",
        },
        {
            keys = { "n", "<leader>ts" },
            cmd = [[<cmd>9ToggleTerm name=Salesforce<cr>]],
            desc = "ToggleTerm: Open Salesforce",
        },
        {
            keys = { "n", "<leader>tj" },
            cmd = [[<cmd>8ToggleTerm name=Jest<cr>]],
            desc = "ToggleTerm: Open Jest",
        },
    },
}
