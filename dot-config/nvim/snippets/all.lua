local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({
    trig = "ternary",
    desc = "A ternary operator",
    docstring = "Ternary Operator: {1:cond} ? {2:then} : {3:else}",
  }, {
    i(1, "cond"),
    t(" ? "),
    i(2, "then"),
    t(" : "),
    i(3, "else"),
  }),
}
