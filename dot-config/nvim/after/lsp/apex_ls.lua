return {
  cmd = {
    vim.env.JAVA_HOME and (vim.env.JAVA_HOME .. "/bin/java") or "java",
    "-cp",
    vim.fn.expand("~/.local/share/nvim/mason/share/apex-language-server/apex-jorje-lsp.jar"),
    "-Ddebug.internal.errors=true",
    "-Ddebug.semantic.errors=false",
    "-Ddebug.completion.statistics=false",
    "-Dlwc.typegeneration.disabled=true",
    "apex.jorje.lsp.ApexLanguageServerLauncher",
  },
  root_markers = { "sfdx-project.json" },
  filetypes = { "apex" },
}
