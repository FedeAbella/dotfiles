local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({
    trig = "console",
    desc = "console.log",
    docstring = "console.log() method",
  }, {
    t('console.log("'),
    i(1, "describe"),
    t(': ", '),
    i(2, "var"),
    t(");"),
  }),
  s({
    trig = "jsonconsole",
    desc = "console.log JSON stringified object",
    docstring = { "console.log() method with", "JSON stringified variable" },
  }, {
    t('console.log("'),
    i(1, "describe"),
    t(': ", JSON.stringify('),
    i(2, "var"),
    t("));"),
  }),
}
