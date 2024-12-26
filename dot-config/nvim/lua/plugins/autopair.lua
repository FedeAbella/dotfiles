return {
  {
    "windwp/nvim-autopairs",
    config = true,
    lazy = true,
    event = "InsertEnter",
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
    lazy = true,
    event = "VeryLazy",
  },
}
