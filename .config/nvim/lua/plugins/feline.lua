return {
    "feline-nvim/feline.nvim",
    after = "catppuccin",
    config = function()
        local ctp_feline = require("catppuccin.groups.integrations.feline")
        local colors = require("catppuccin.palettes").get_palette()
        ctp_feline.setup({
            assets = {
                mode_icon = "",
            },
            sett = {
                show_modified = true,
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
                    return require("sf").get_target_org()
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
                fg = colors.overlay1,
                bg = "NONE",
            },
        }
        require("feline").setup({
            components = components,
        })
    end,
    enabled = true,
}
