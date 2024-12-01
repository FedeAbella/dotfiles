-- Customize the vim.ui interface to use floats
return {
    "stevearc/dressing.nvim",
    opts = {},
    config = function()
        require("dressing").setup({
            input = {
                relative = "win",
            },
        })
    end,
}
