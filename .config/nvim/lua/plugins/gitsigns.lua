return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            numhl = true,
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 500,
            },
            --            on_attach = function(bufnr)
            --                local gs = package.loaded.gitsigns
            --
            --                local function map(mode, l, r, opts)
            --                    opts = opts or {}
            --                    opts.buffer = bufnr
            --                    vim.keymap.set(mode, l, r, opts)
            --                end
            --
            --                -- Navigation
            --                map("n", "]c", function()
            --                    if vim.wo.diff then
            --                        return "]c"
            --                    end
            --                    vim.schedule(function()
            --                        gs.next_hunk()
            --                    end)
            --                    return "<Ignore>"
            --                end, { expr = true })
            --
            --                map("n", "[c", function()
            --                    if vim.wo.diff then
            --                        return "[c"
            --                    end
            --                    vim.schedule(function()
            --                        gs.prev_hunk()
            --                    end)
            --                    return "<Ignore>"
            --                end, { expr = true })
            --
            --                -- Actions
            --                --                map('n', '<leader>ghs', gs.stage_hunk, { desc = { 'Stage hunk' } })
            --                --                map('n', '<leader>ghr', gs.reset_hunk, { desc = { 'Reset hunk' } })
            --                --                map('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            --                --                    { desc = { 'Stage selection' } })
            --                --                map('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
            --                --                    { desc = { 'Reset selection' } })
            --                --                map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = { 'Undo Stage hunk' } })
            --                --                map('n', '<leader>ghp', gs.preview_hunk, { desc = { 'Preview hunk' } })
            --                --                map('n', '<leader>gfA', gs.stage_buffer, { desc = { 'Stage buffer' } })
            --                --                map('n', '<leader>gfR', gs.reset_buffer, { desc = { 'Reset buffer' } })
            --                --                map('n', '<leader>gfU', gs.reset_buffer_index, { desc = { 'Reset all stages in buffer' } })
            --                --                map('n', '<leader>gfD', gs.diffthis, { desc = { 'Diff buffer' } })
            --            end,
            _signs_staged_enable = true,
        })
        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#7f849c" })
    end,
    commander = {
        {
            keys = { "n", "[c" },
            cmd = function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    require("gitsigns").prev_hunk()
                end)
                return "<Ignore>"
            end,
            desc = "Git: Previous hunk",
        },
        {
            keys = { "n", "]c" },
            cmd = function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    require("gitsigns").next_hunk()
                end)
                return "<Ignore>"
            end,
            desc = "Git: Next hunk",
        },
        {
            keys = { "n", "<leader>ghs" },
            cmd = [[<cmd>lua require'gitsigns'.stage_hunk()<cr>]],
            desc = "Git: Stage hunk",
        },
        {
            keys = { "n", "<leader>ghs" },
            cmd = [[<cmd>lua require'gitsigns'.stage_hunk()<cr>]],
            desc = "Git: Stage hunk",
        },
        {
            keys = { "n", "<leader>ghr" },
            cmd = [[<cmd>lua require'gitsigns'.reset_hunk()<cr>]],
            desc = "Git: Reset hunk",
        },
        {
            keys = { "v", "<leader>ghs" },
            cmd = function()
                require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            desc = "Git: Stage selection",
        },
        {
            keys = { "v", "<leader>ghr" },
            cmd = function()
                require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            desc = "Git: Reset selection",
        },
        {
            keys = { "n", "<leader>ghu" },
            cmd = [[<cmd>lua require'gitsigns'.undo_stage_hunk()<cr>]],
            desc = "Git: Undo stage hunk",
        },
        {
            keys = { "n", "<leader>ghp" },
            cmd = [[<cmd>lua require'gitsigns'.preview_hunk()<cr>]],
            desc = "Git: Preview hunk",
        },
        {
            keys = { "n", "<leader>gfs" },
            cmd = [[<cmd>lua require'gitsigns'.stage_buffer()<cr>]],
            desc = "Git: Stage buffer",
        },
        {
            keys = { "n", "<leader>gfr" },
            cmd = [[<cmd>lua require'gitsigns'.reset_buffer()<cr>]],
            desc = "Git: Reset buffer",
        },
        {
            keys = { "n", "<leader>gfu" },
            cmd = [[<cmd>lua require'gitsigns'.reset_buffer_index()<cr>]],
            desc = "Git: Undo all stages in file",
        },
        {
            keys = { "n", "<leader>gfd" },
            cmd = [[<cmd>lua require'gitsigns'.diffthis()<cr>]],
            desc = "Git: Diff buffer",
        },
    },
}
