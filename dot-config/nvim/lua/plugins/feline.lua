return {
  "freddiehaddad/feline.nvim",
  enabled = false,
  lazy = true,
  event = "VimEnter",
  priority = 800,
  opts = function()
    local ctp_feline = require("catppuccin.groups.integrations.feline")
    local colors = require("catppuccin.palettes").get_palette()
    ctp_feline.setup({
      assets = {
        mode_icon = "",
        git = {
          branch = "󰘬",
          added = "",
          changed = "",
          removed = "",
        },
        lsp = {
          server = "",
        },
      },
      sett = {
        show_modified = true,
        bkg = "NONE",
        extras = colors.subtext0,
      },
      view = {
        lsp = {
          name = true,
        },
      },
    })

    local components = ctp_feline.get()
    components.inactive[1][1] = {
      provider = {
        name = "file_info",
        opts = {
          file_modified_icon = "%m",
          colored_icon = false,
        },
      },
      hl = {
        fg = colors.text,
        bg = colors.surface2,
      },
    }
    components.active[1][12].hl.fg = colors.red
    components.active[1][13] = {
      provider = function()
        local function get_org()
          return require("sf").get_target_org()
        end
        if pcall(get_org) then
          local org = require("sf").get_target_org()
          local coverage = require("sf").covered_percent()
          if coverage ~= "" then
            return org .. " (" .. coverage .. ")"
          else
            return org
          end
        else
          return ""
        end
      end,
      icon = {
        str = " 󰢎 ",
        hl = {
          fg = "#009ddc",
          bg = "NONE",
        },
      },
      hl = {
        fg = colors.subtext0,
        bg = "NONE",
      },
      truncate_hide = true,
    }
    components.active[1][10].truncate_hide = true
    components.active[1][11].truncate_hide = true
    components.active[3][1].truncate_hide = true
    components.active[3][2].truncate_hide = true
    components.active[3][4].truncate_hide = true

    return {
      components = components,
    }
  end,
}
