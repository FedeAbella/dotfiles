return {
    "numToStr/Comment.nvim",
    opts = {
        -- add any options here
    },
    lazy = false,
    config = function()
        require("Comment").setup()
        local ft = require("Comment.ft")
        ft.set("apex", { "//%s", "/*%s*/" })
    end,
}
