-- Makes the cursor and cursorline change depending on mode
return {
    "rasulomaroff/reactive.nvim",
    config = function()
        require("reactive").setup({
            load = {
                "catppuccin-mocha-cursor",
                "catppuccin-mocha-cursorline",
            },
        })
    end,
}
