-- LSP configuration using nvim-lspconfig, mason-lspconfig and lsp-zero
return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason-lspconfig.nvim" },
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
                "tsserver",
                "graphql",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "jedi_language_server",
                "sqlls",
                "taplo",
                "visualforce_ls",
                "lemminx",
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
            },
        })
    end,
}
