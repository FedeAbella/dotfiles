return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
            },
            format_on_save = function(bufnr)
                -- Disable autoformat on certain filetypes
                local ignore_filetypes = { "xml" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                return { timeout_ms = 1500, lsp_fallback = true }
            end,
        })
    end,
    commander = {
        {
            keys = { "n", "<leader>}" },
            cmd = [[<cmd>lua require('conform').format({bufnr = 0, lsp_fallback = true})<cr>]],
            desc = "Format file",
        },
    },
}
