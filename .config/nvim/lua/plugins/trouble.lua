return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    --    config = function()
    --        vim.keymap.set('n', '<leader>dt', [[<cmd>TroubleToggle<cr>]], { desc = { 'Toggle Trouble' } })
    --    end
    commander = { { keys = { "n", "<leader>dt" }, cmd = [[<cmd>TroubleToggle<cr>]], desc = "Trouble: Toggle" } },
}
