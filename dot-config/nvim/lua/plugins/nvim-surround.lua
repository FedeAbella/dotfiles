return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  lazy = true,
  event = "VeryLazy",
  config = function()
    local colors = require("catppuccin.palettes").get_palette()
    require("nvim-surround").setup({
      highlights = {
        duration = 1000,
      },
      keymaps = {
        insert = "<C-s>s",
        insert_line = "<C-s>S",
        normal = "<C-s>i",
        normal_cur = "<C-s>ic",
        normal_line = "<C-s>il",
        normal_cur_line = "<C-s>iC",
        visual = "<C-s>",
        visual_line = "<C-S>",
        delete = "<C-s>d",
        change = "<C-s>c",
        change_line = "<C-s>cl",
      },
    })
    vim.api.nvim_set_hl(0, "NvimSurroundHighlight", { fg = colors.mantle, bg = colors.sapphire })
  end,
}
