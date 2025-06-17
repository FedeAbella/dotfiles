return {
  init_options = {
    diagnostics = {
      enable = false,
    },
  },
  on_init = function(client)
    client.server_capabilities.renameProvider = false
  end,
}
