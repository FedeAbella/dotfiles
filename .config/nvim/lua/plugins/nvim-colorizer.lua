-- Show color codes in the appropriate color. e.g.: #ffffff, #808080
return {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
}
