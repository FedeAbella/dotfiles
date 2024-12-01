return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            render = "compact",
            timeout = 4000,
            stages = "fade",
            top_down = false,
        })
    end,
}
