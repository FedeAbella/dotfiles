return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  lazy = true,
  event = "VeryLazy",
  opts = {
    highlights = {
      duration = 1000,
    },
    keymaps = {
      insert = "<M-s>s",
      insert_line = "<M-s>S",
      normal = "<M-s>i",
      normal_cur = "<M-s>ic",
      normal_line = "<M-s>il",
      normal_cur_line = "<M-s>iC",
      visual = "<M-s>",
      visual_line = "<M-S>",
      delete = "<M-s>d",
      change = "<M-s>c",
      change_line = "<M-s>cl",
    },
  },
}
