return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = false,
        config = function()
            local mocha = require("catppuccin.palettes.mocha")
            require("catppuccin").setup({
                dim_inactive = {
                    enabled = true,
                    percentage = 0.01,
                },
                integrations = {
                    neotree = true,
                    notify = true,
                    mason = true,
                },
                transparent_background = true,
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
                    }
                end,
            })
            vim.cmd.colorscheme("catppuccin-mocha")
            vim.api.nvim_set_hl(0, "Whitespace", { fg = mocha.overlay1 })
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = mocha.mauve })
            vim.api.nvim_set_hl(0, "OilDir", { fg = mocha.mauve })
            vim.api.nvim_set_hl(0, "OilLink", { fg = mocha.peach })
            vim.api.nvim_set_hl(0, "OilLinkTarget", { fg = mocha.rosewater })
        end,
    },
}
