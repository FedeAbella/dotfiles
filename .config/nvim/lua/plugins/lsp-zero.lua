-- LSP configuration basics to avoid configuring everything
return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    init = function()
        -- Disable automatic setup, we are doing it manually
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
    end,
    -- This replaces the default false config
    config = function()
        require("lsp-zero").set_sign_icons({
            error = "✘",
            warn = "▲",
            hint = "⚑",
            info = "»",
        })
    end,
}
