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
