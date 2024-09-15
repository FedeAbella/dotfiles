return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "apex",
                "bash",
                "sosl",
                "soql",
                "sflog",
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "html",
                "markdown",
                "xml",
                "python",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
    dependencies = {
        {
            "HiPhish/rainbow-delimiters.nvim",
            config = function()
                require("rainbow-delimiters")
                require("rainbow-delimiters.setup").setup()
            end,
        },
    },
}
