-- Makes the cursor and cursorline change depending on mode
return {
  "rasulomaroff/reactive.nvim",
  lazy = true,
  event = { "BufNewFile", "BufReadPre" },
  opts = {
    load = {
      "catppuccin-mocha-cursor",
      "catppuccin-mocha-cursorline",
    },
  },
}
