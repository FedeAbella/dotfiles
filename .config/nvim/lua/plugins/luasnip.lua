return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local ls = require("luasnip")
        require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
        require("luasnip.loaders.from_vscode").lazy_load()
        --        vim.keymap.set({ "i", "s" }, "<C-J>", function()
        --            ls.jump(1)
        --        end, { silent = true })
        --        vim.keymap.set({ "i", "s" }, "<C-K>", function()
        --            ls.jump(-1)
        --        end, { silent = true })
        --
        --        vim.keymap.set({ "i", "s" }, "<C-E>", function()
        --            if ls.choice_active() then
        --                ls.change_choice(1)
        --            end
        --        end, { silent = true })
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
