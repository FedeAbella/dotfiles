return {
    "mbbill/undotree",
    lazy = false,
    --    config = function()
    --        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = { 'Toggle Undotree' } })
    --    end
    commander = {
        {
            keys = { "n", "<leader>u" },
            cmd = [[<cmd>UndotreeToggle<cr>]],
            desc = "Undotree: Toggle",
        },
    },
}
