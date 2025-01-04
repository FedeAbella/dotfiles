return {
  "FeiyouG/commander.nvim",
  lazy = true,
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    components = {
      "DESC",
      "KEYS",
      "CAT",
    },
    sort_by = {
      "DESC",
      "KEYS",
      "CAT",
      "CMD",
    },
    integration = {
      lazy = {
        enable = true,
        set_plugin_name_as_cat = true,
      },
      telescope = {
        enable = true,
      },
    },
  },
}
