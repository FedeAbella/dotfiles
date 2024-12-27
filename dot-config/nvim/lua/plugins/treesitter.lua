return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
          require("rainbow-delimiters")
          require("rainbow-delimiters.setup").setup()
        end,
      },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = false,
        ensure_installed = {
          "apex",
          "bash",
          "sosl",
          "soql",
          "sflog",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "javascript",
          "html",
          "markdown",
          "xml",
          "python",
          "regex",
          "markdown_inline",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
