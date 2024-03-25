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
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "html",
                "xml",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = {
                enable = true,
                filetypes = {
                    "html",
                    "javascript",
                    "typescript",
                    "svelte",
                    "vue",
                    "tsx",
                    "jsx",
                    "rescript",
                    "css",
                    "lua",
                    "xml",
                    "php",
                    "markdown",
                },
            },
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
