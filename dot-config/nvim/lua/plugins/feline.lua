return {
  "freddiehaddad/feline.nvim",
  after = "catppuccin",
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
        bkg = colors.base,
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
        },
      },
      hl = {
        fg = colors.overlay2,
        bg = colors.mantle,
      },
    }
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
          bg = colors.base,
        },
      },
      hl = {
        fg = colors.subtext0,
        bg = colors.base,
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
