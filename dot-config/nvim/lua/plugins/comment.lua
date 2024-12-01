return {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
        require("Comment").setup({
            ignore = '^$'
        })
        local ft = require("Comment.ft")
        ft.set("apex", { "//%s", "/*%s*/" })
    end,
}
