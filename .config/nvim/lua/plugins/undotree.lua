return {
    "mbbill/undotree",
    lazy = false,
    commander = {
        {
            keys = { "n", "<leader>u" },
            cmd = [[<cmd>UndotreeToggle<cr>]],
            desc = "Undotree: Toggle",
        },
    },
}
