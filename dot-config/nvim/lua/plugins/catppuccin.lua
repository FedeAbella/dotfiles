return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      dim_inactive = {
        enabled = true,
      },
      integrations = {
        notify = true,
        mason = true,
      },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.overlay1 },
          TelescopeBorder = { fg = colors.mauve },
          TelescopeMatching = { fg = colors.teal },
          TelescopeSelection = { fg = colors.maroon },
          TelescopeSelectionCaret = { fg = colors.maroon },
          NeoTreeDirectoryName = { fg = colors.mauve },
          NeoTreeDirectoryIcon = { fg = colors.mauve },
          NeoTreeRootName = { fg = colors.mauve },
          NeoTreeGitUntracked = { fg = colors.sapphire },
          NotifyINFOBorder = { fg = colors.mauve },
          NotifyINFOIcon = { fg = colors.mauve },
          NotifyINFOTitle = { fg = colors.mauve, style = { "italic" } },
          Whitespace = { fg = colors.overlay1 },
          FloatBorder = { fg = colors.mauve },
          GitSignsCurrentLineBlame = { fg = colors.overlay1 },
          DiagnosticVirtualTextError = { bg = colors.none },
          DiagnosticVirtualTextWarn = { bg = colors.none },
          DiagnosticVirtualTextInfo = { bg = colors.none },
          DiagnosticVirtualTextHint = { bg = colors.none },
          DiffChange = { bg = colors.green, fg = colors.surface1 },
          DiffDelete = { bg = colors.red, fg = colors.surface1 },
          VirtColumn = { bg = "", fg = colors.peach },
          WinSeparator = { fg = colors.rosewater },
        }
      end,
    },
  },
}
