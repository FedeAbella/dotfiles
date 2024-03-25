-- Makes the cursor and cursorline change depending on mode
return {
    'rasulomaroff/reactive.nvim',
    config = function()
        require('reactive').setup {
            load = {
                'catppuccin-frappe-cursor',
                'catppuccin-frappe-cursorline'
            },
        }
    end
}
