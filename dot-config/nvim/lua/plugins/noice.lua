return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                progress = {
                    enabled = false,
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
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
                -- command_palette = true,
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
            views = {
                cmdline_popup = {
                    relative = "editor",
                    position = {
                        row = 30,
                        col = "50%",
                    },
                    size = {
                        width = "auto",
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 33,
                        col = "50%",
                    },
                    size = {
                        width = 70, -- Making this as wide as the cmdline_popup
                        height = "auto",
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            },
            -- cmdline = {
            --     view = "cmdline_popup", -- cmdline_popup, cmdline
            -- },
        })
    end,
}
