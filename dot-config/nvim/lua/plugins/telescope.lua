return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = true,
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup({
      defaults = {
        layout_config = {
          vertical = { width = 0.80 },
          mirror = true,
          prompt_position = "top",
        },
        layout_strategy = "vertical",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--column",
          "--follow",
          "--glob",
          "!**/.git/*",
          "--hidden",
          "--ignore-file",
          ".rgignore",
          "--line-number",
          "--no-heading",
          "--smart-case",
          "--trim",
          "--with-filename",
        },
      },
      pickers = {
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--follow",
            "--glob",
            "!**/.git/*",
            "--hidden",
            "--ignore-file",
            ".rgignore",
            "--no-ignore-vcs",
          },
        },
      },
      extensions = {
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        notify = {},
      },
    })
    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
    telescope.load_extension("notify")
  end,
  commander = {
    -- Find stuff
    {
      keys = { "n", "<leader>ff" },
      cmd = [[<cmd>Telescope find_files<cr>]],
      desc = "Telescope: Find files",
    },
    { keys = { "n", "<leader>ft" }, cmd = [[<cmd>Telescope live_grep<cr>]], desc = "Telescope: Find text" },
    { keys = { "n", "<leader>fg" }, cmd = [[<cmd>Telescope git_files<cr>]], desc = "Telescope: Find git files" },
    { keys = { "n", "<leader>fh" }, cmd = [[<cmd>Telescope help_tags<cr>]], desc = "Telescope: Find in help" },
    -- Diagnostics
    {
      keys = { "n", "<leader>da" },
      cmd = [[<cmd>Telescope diagnostics bufnr=0<cr>]],
      desc = "Telescope: Open diagnostic",
    },
    {
      keys = { "n", "<leader>ls" },
      cmd = [[<cmd>Telescope lsp_document_symbols<cr>]],
      desc = "Telescope: List symbols in buffer",
    },
    { keys = { "n", "<leader>b" }, cmd = [[<cmd>Telescope buffers<cr>]], desc = "Telescope: List buffers" },
  },
}
