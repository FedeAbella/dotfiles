return {
  "folke/noice.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  opts = {
    cmdline = {
      view = "cmdline",
    },
    lsp = {
      progress = {
        enabled = false,
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      hover = {
        enabled = true,
        opts = {
          border = {
            style = "rounded",
          },
        },
      },
      signature = {
        enabled = true,
        opts = {
          border = {
            style = "rounded",
          },
          position = {
            row = 3,
          },
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = false,
      long_message_to_split = true,
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
        opts = {
          timeout = 6000,
        },
      },
    },
  },
}
