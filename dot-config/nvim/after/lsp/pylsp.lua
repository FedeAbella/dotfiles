return {
  settings = {
    pylsp = {
      plugins = {
        jedi_completion = {
          enabled = false,
          include_params = true,
        },
        rope_autoimport = {
          enabled = true,
        },
      },
    },
  },
}
