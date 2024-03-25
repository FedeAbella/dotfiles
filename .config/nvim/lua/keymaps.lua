vim.g.mapleader = " "

return {
    -- Buffers
    { keys = { "n", "<A-c>" }, cmd = vim.cmd.bdelete, desc = "Buffers: Close current" },
    { keys = { "n", "<C-k>" }, cmd = vim.cmd.bnext, desc = "Buffers: Next" },
    { keys = { "n", "<C-j>" }, cmd = vim.cmd.bprevious, desc = "Buffers: Previous" },
    { keys = { "n", "<A-C>" }, cmd = [[<cmd>%bd|e#|bd#<cr>|'"]], desc = "Buffers: Close others" },

    -- File Explorer
    --    { keys = { "n", "<leader>eb" }, cmd = [[<cmd>Rexplore<cr>]], desc = "Explorer: Return to file" },
    --    { keys = { "n", "<leader>er" }, cmd = [[<cmd>e .<cr>]], desc = "Open root" },
    --    { keys = { "n", "<leader>eh" }, cmd = [[<cmd>Explore<cr>]], desc = "Open this file's directory" },

    -- Terminal
    { keys = { "t", "<esc>" }, cmd = [[<C-\><C-n>]], desc = "Terminal: Quit", show = false },

    -- Format
    { keys = { "n", "<leader>\\" }, cmd = "50%ggVG=2<C-o>", desc = "Reindent file" },
    {
        keys = { "n", "<leader>w" },
        cmd = function()
            vim.o.list = not vim.o.list
        end,
        desc = "Show whitespace",
    },

    -- View
    { keys = { "n", "<c-d>" }, cmd = "<c-d>zz", desc = "Move view down, but center view after", show = false },
    { keys = { "n", "<c-u>" }, cmd = "<c-u>zz", desc = "Move view up, but center view after", show = false },
    { keys = { "n", "N" }, cmd = "Nzz", desc = "Previous match, but center view after", show = false },
    { keys = { "n", "n" }, cmd = "nzz", desc = "Next match, but center view after", show = false },

    -- Editing
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
}

---- Buffers
--vim.keymap.set("n", "<A-c>", vim.cmd.bdelete, { desc = { "Close Buffer" } })
--vim.keymap.set("n", "<C-k>", vim.cmd.bnext, { desc = { "Next Buffer" } })
--vim.keymap.set("n", "<C-j>", vim.cmd.bprevious, { desc = { "Previous Buffer" } })
--vim.keymap.set("n", "<A-C>", [[<cmd>%bd|e#|bd#<cr>|'"]], { desc = { "Close all other buffers" } })
--
---- File Explorer
--vim.keymap.set("n", "<leader>eb", vim.cmd.Rex, { desc = { "Return from Explorer to file" } })
--vim.keymap.set("n", "<leader>er", [[<cmd>e .<cr>]], { desc = { "Open root" } })
--vim.keymap.set("n", "<leader>eh", vim.cmd.Ex, { desc = { "Open this file's directory" } })
--
---- Terminal
--vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = { "Quit Terminal Mode" } })
--
---- Format
--vim.keymap.set("n", "<leader>\\", "50%ggVG=2<C-o>", { desc = { "Indent file" } })
--vim.keymap.set("n", "<leader>w", function()
--    vim.o.list = not vim.o.list
--end, { desc = { "Show whitespace" } })
--
---- View
--vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = { "Move view down, but center view after" } })
--vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = { "Move view up, but center view after" } })
--vim.keymap.set("n", "N", "Nzz", { desc = { "Previous match, but center view after" } })
--vim.keymap.set("n", "n", "nzz", { desc = { "Next match, but center view after" } })
--
---- Editing
--vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = { "Move selected lines down, indenting" } })
--vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = { "Move selected lines up, indenting" } })
--vim.keymap.set("x", "<leader>p", '"_dP', { desc = { "Paste, but don't replace the 0 register" } })
--vim.keymap.set("n", "<leader>y", '"+y', { desc = { 'Yank into " register (clipboard)' } })
--vim.keymap.set("v", "<leader>y", '"+y', { desc = { 'Yank into " register (clipboard)' } })
--vim.keymap.set("n", "<leader>Y", '"+Y', { desc = { 'Yank lines into " register (clipboard)' } })
--vim.keymap.set(
--    "n",
--    "<leader>s",
--    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
--    { desc = { "Replace current word in entire buffer" } }
--)
--
---- Diagnostics
--vim.keymap.set("n", "<leader>dn", [[<cmd>lua vim.diagnostic.goto_next()<cr>]], { desc = { "Go to next diagnostic" } })
--vim.keymap.set(
--    "n",
--    "<leader>dp",
--    [[<cmd>lua vim.diagnostic.goto_prev()<cr>]],
--    { desc = { "Go to previous diagnostic" } }
--)
--vim.keymap.set("n", "<leader>do", [[<cmd>lua vim.diagnostic.open_float()<cr>]], { desc = { "Open diagnostic" } })
