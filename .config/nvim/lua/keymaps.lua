vim.g.mapleader = " "

return {
    -- Buffers
    { keys = { "n", "<A-c>" }, cmd = vim.cmd.bdelete, desc = "Buffers: Close current" },
    { keys = { "n", "<C-h>" }, cmd = vim.cmd.bnext, desc = "Buffers: Next" },
    { keys = { "n", "<C-l>" }, cmd = vim.cmd.bprevious, desc = "Buffers: Previous" },
    { keys = { "n", "<A-C>" }, cmd = [[<cmd>%bd|e#|bd#<cr>|'"]], desc = "Buffers: Close others" },
    { keys = { "n", "<leader>'" }, cmd = [[<C-^>]], desc = "Buffers: Last" },

    -- Terminal
    { keys = { "t", "<esc>" }, cmd = [[<C-\><C-n>]], desc = "Terminal: Quit", show = false },

    -- Format
    { keys = { "n", "<leader>\\" }, cmd = "50%ggVG=2<C-o>", desc = "Reindent file" },
    {
        keys = { "n", "<leader>W" },
        cmd = function()
            vim.o.list = not vim.o.list
        end,
        desc = "Show whitespace",
    },

    -- View
    {
        keys = { "n", "<c-d>" },
        cmd = "<c-d>zz",
        desc = "Move view down, but center view after",
        show = false,
    },
    {
        keys = { "n", "<c-u>" },
        cmd = "<c-u>zz",
        desc = "Move view up, but center view after",
        show = false,
    },
    {
        keys = { "n", "N" },
        cmd = "Nzz",
        desc = "Previous match, but center view after",
        show = false,
    },
    {
        keys = { "n", "n" },
        cmd = "nzz",
        desc = "Next match, but center view after",
        show = false,
    },
    {
        keys = { "n", "%" },
        cmd = "%zz",
        desc = "Go to matching parenthesis, but center view after",
        show = false,
    },
    {
        keys = { "n", "#" },
        cmd = "#zz",
        desc = "Previous ocurrence, but center view after",
        show = false,
    },
    {
        keys = { "n", "*" },
        cmd = "*zz",
        desc = "Next ocurrence, but center view after",
        show = false,
    },
    {
        keys = { "n", "{" },
        cmd = "{zz",
        desc = "Previous paragraph, but center view after",
        show = false,
    },
    {
        keys = { "n", "}" },
        cmd = "}zz",
        desc = "Next paragraph, but center view after",
        show = false,
    },
    {
        keys = { "n", "G" },
        cmd = "Gzz",
        desc = "Go to end, but center view after",
        show = false,
    },

    -- Editing
    { keys = { "n", "<leader>w" }, cmd = ":w<cr>", desc = "Write file" },
    { keys = { "v", "J" }, cmd = ":m '>+1<cr>gv=gv", desc = "Move selection up" },
    { keys = { "v", "K" }, cmd = ":m '<-2<cr>gv=gv", desc = "Move selection down" },
    { keys = { "x", "<leader>p" }, cmd = '"_dP', desc = "Paste, but don't replace register" },
    { keys = { "n", "<leader>y" }, cmd = '"+y', desc = "Yank into clipboard" },
    { keys = { "v", "<leader>y" }, cmd = '"+y', desc = "Yank into clipboard" },
    { keys = { "n", "<leader>Y" }, cmd = '"+Y', desc = "Yank lines into clipboard" },
    {
        keys = {
            "n",
            "<leader>S",
        },
        cmd = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
        desc = "Replace current word in entire buffer",
    },

    -- Diagnostics
    { keys = { "n", "<leader>dn" }, cmd = [[<cmd>lua vim.diagnostic.goto_next()<cr>]], desc = "Diagnostics: Next" },
    {
        keys = {
            "n",
            "<leader>dp",
        },
        cmd = [[<cmd>lua vim.diagnostic.goto_prev()<cr>]],
        desc = "Diagnostics: Previous",
    },
    { keys = { "n", "<leader>do" }, cmd = [[<cmd>lua vim.diagnostic.open_float()<cr>]], desc = "Diagnostics: Open" },
    {
        keys = { "n", "<leader>dt" },
        cmd = [[<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>]],
        desc = "Diagnostics: Toggle",
    },
}
