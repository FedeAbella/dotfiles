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
                --                telescope = {
                --                    enable = true,
                --                },
                lazy = {
                    enable = true,
                    set_plugin_name_as_cat = true,
                },
            },
        })
        -- Add a new command
        commander.add({
            {
                desc = "Commander: Open",
                cmd = commander.show,
                keys = { "n", "<leader>k" },
            },
        })
        -- Show commander and select the command by pressing "<leader>fc"

        -- Telescope Key Mappings
        local builtin = require("telescope.builtin")

        commander.add({
            -- Find stuff
            { keys = { "n", "<leader>ff" }, cmd = builtin.find_files, desc = "Telescope: Find files" },
            { keys = { "n", "<leader>ft" }, cmd = builtin.live_grep, desc = "Telescope: Find text" },
            { keys = { "n", "<leader>fg" }, cmd = builtin.git_files, desc = "Telescope: Find git files" },
            { keys = { "n", "<leader>fh" }, cmd = builtin.help_tags, desc = "Telescope: Find in help" },
            -- Diagnostics
            {
                keys = { "n", "<leader>da" },
                cmd = [[<cmd>Telescope diagnostics bufnr=0<cr>]],
                desc = "Telescope: Open diagnostic",
            },
            {
                keys = { "n", "<leader>ls" },
                cmd = builtin.lsp_document_symbols,
                desc = "Telescope: List symbols in buffer",
            },
            { keys = { "n", "<leader>b" }, cmd = builtin.buffers, desc = "Telescope: List buffers" },
        })

        commander.add(require("keymaps"))
        --        -- Git
        --        vim.keymap.set('n', '<leader>gl', builtin.git_commits, { desc = { 'List git commits' } })
        --        vim.keymap.set('n', '<leader>gfl', builtin.git_bcommits, { desc = { 'List git commits of current file' } })
        --        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = { 'See git status' } })
        --        vim.keymap.set('n', '<leader>gt', builtin.git_stash, { desc = { 'List items in git stash' } })
    end,
}
