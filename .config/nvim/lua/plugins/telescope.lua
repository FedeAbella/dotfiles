return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                --sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim",
                    "-L",
                    "-.",
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
    end,
    commander = {
        -- Find stuff
        {
            keys = { "n", "<leader>ff" },
            cmd = [[<cmd> Telescope find_files follow=true hidden=true no_ignore=true<cr>]],
            desc = "Telescope: Find files",
        },
        { keys = { "n", "<leader>ft" }, cmd = [[<cmd>Telescope live_grep<cr>]], desc = "Telescope: Find text" },
        { keys = { "n", "<leader>fg" }, cmd = [[<cmd>Telescope git_files<cr>]], desc = "Telescope: Find git files" },
        { keys = { "n", "<leader>fh" }, cmd = [[<cmd>Telescope help_tags]], desc = "Telescope: Find in help" },
        -- Diagnostics
        {
            keys = { "n", "<leader>da" },
            cmd = [[<cmd>Telescope diagnostics bufnr=0<cr>]],
            desc = "Telescope: Open diagnostic",
        },
        {
            keys = { "n", "<leader>ls" },
            cmd = [[<cmd>Telescope lsp_document_symbols<cr>]],
            desc = "Telescope: List symbols in buffer",
        },
        { keys = { "n", "<leader>b" }, cmd = [[<cmd>Telescope buffers<cr>]], desc = "Telescope: List buffers" },
    },
}
