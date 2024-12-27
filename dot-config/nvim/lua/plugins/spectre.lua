return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  cmd = "Spectre",
  opts = {
    find_engine = {
      -- rg is map with finder_cmd
      ["rg"] = {
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--follow",
        },
      },
    },
  },
}
