-- LSP configuration using nvim-lspconfig, mason-lspconfig and lsp-zero
return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            opts = function(_, opts)
                opts.sources = opts.sources or {}
                table.insert(opts.sources, {
                    name = "lazydev",
                    group_index = 0, -- set group index to 0 to skip loading LuaLS completions
                })
            end,
        },
        { "williamboman/mason-lspconfig.nvim" },
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig()

        --- if you want to know more about lsp-zero and mason.nvim
        --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        require("mason-lspconfig").setup({
            ensure_installed = {
                "apex_ls",
                "bashls",
                "cssls",
                "eslint",
                "ts_ls",
                "graphql",
                "jsonls",
                "lua_ls",
                "marksman",
                "jedi_language_server",
                "sqlls",
                "taplo",
                "visualforce_ls",
                "yamlls",
                "lwc_ls",
            },
            handlers = {
                lsp_zero.default_setup,
                apex_ls = function()
                    require("lspconfig").apex_ls.setup({
                        -- This requires having set up the filetype, and associated file extensions
                        -- This is done in sets.lua
                        filetypes = { "apex" },
                    })
                end,
                cssls = function()
                    require("lspconfig").cssls.setup({
                        on_init = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentFormattingRangeProvider = false
                        end,
                    })
                end,
                ts_ls = function()
                    require("lspconfig").ts_ls.setup({
                        on_init = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentFormattingRangeProvider = false
                        end,
                    })
                end,
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        on_init = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentFormattingRangeProvider = false
                        end,
                    })
                end,
            },
        })

        vim.diagnostic.config({
            update_in_insert = true,
        })
    end,
}
