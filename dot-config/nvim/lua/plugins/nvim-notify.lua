return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            max_width = 50,
            render = "compact",
            stages = "fade",
            timeout = 4000,
        })
    end,
}
