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
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
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
