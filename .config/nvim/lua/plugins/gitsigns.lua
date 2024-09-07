return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            numhl = true,
            signs_staged_enable = true,
        })
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
