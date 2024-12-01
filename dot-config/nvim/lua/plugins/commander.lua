return {
    "FeiyouG/commander.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        local commander = require("commander")
        commander.setup({
            components = {
                "DESC",
                "KEYS",
                "CAT",
            },
            sort_by = {
                "DESC",
                "KEYS",
                "CAT",
                "CMD",
            },
            integration = {
                lazy = {
                    enable = true,
                    set_plugin_name_as_cat = true,
                },
            },
        })
        commander.add({
            {
                desc = "Commander: Open",
                cmd = commander.show,
                keys = { "n", "<leader>k" },
            },
        })
        commander.add(require("keymaps"))
    end,
}
