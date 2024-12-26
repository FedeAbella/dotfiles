return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    columns = {
      "icon",
      "size",
      "mtime",
    },
    delete_to_trash = true,
    constrain_cursor = "name",
    watch_for_changes = true,
  },
  commander = {
    {
      keys = { "n", "<leader>-" },
      cmd = [[<cmd>Oil --float .<cr>]],
      desc = "Oil: Open root",
    },
    {
      keys = { "n", "<leader>_" },
      cmd = [[<cmd>Oil --float<cr>]],
      desc = "Oil: Open here",
    },
  },
}
