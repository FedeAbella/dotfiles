-- Makes the cursor and cursorline change depending on mode
return {
  "rasulomaroff/reactive.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    load = {
      "catppuccin-mocha-cursor",
      "catppuccin-mocha-cursorline",
    },
  },
}
