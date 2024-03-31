return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        require("luasnip")
        require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
    commander = {
        {
            keys = { { "i", "s" }, "<C-J>", { silent = true } },
            cmd = [[<cmd>lua require'luasnip'.jump(1)<cr>]],
            desc = "LuaSnip: Next Suggestion",
            show = false,
        },
        {
            keys = { { "i", "s" }, "<C-K>", { silent = true } },
            cmd = [[<cmd>lua require'luasnip'.jump(-1)<cr>]],
            desc = "LuaSnip: Previous Suggestion",
            show = false,
        },
        {
            keys = { { "i", "s" }, "<C-E>", { silent = true } },
            cmd = function()
                if require("luasnip").choice_active() then
                    require("luasnip").change_choice(1)
                end
            end,
            desc = "LuaSnip: Next Suggestion",
            show = false,
        },
    },
}
