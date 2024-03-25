return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return vim.o.lines * 0.5
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.5
                end
            end,
        })
        --vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm direction=float<cr>', { desc = { 'Open Floating Terminal' } })
    end,
    commander = {
        {
            keys = { "n", "<leader>t" },
            cmd = [[<cmd>ToggleTerm direction=float<cr>]],
            desc = "ToggleTerm: Open Floating",
        },
    },
}
