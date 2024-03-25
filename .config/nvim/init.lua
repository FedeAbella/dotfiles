-- Personal Modules
require("sets")
require("lib.misc")
require("keymaps")

-- lazy.nvim plugins
require("lazyvim")
require("lazy").setup("plugins", {
    dev = {
        path = "~/Git",
    },
})
