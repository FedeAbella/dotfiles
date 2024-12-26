return {
  "numToStr/Comment.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("Comment").setup({
      ignore = "^$",
    })
    local ft = require("Comment.ft")
    ft.set("apex", { "//%s", "/*%s*/" })
  end,
}
