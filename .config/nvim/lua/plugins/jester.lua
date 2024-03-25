-- Debug Adapter Protocol for Jest tests
return {
    'David-Kunz/jester',
    config = function()
        require('jester').setup {
            cmd = "npx sfdx-lwc-jest -- -t '$result' $file",
            prepend = { 'describe' },
            terminal_cmd = ":ToggleTerm direction=float"
        }
    end
}
