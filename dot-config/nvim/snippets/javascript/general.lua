return {
  s({
    trig = "console",
    desc = "console.log",
    docstring = "console.log() method",
  }, {
    t("console.log("),
    i(1, "var"),
    t(");"),
  }),
  s({
    trig = "jsonconsole",
    desc = "console.log JSON stringified object",
    docstring = "console.log() method with JSON stringified variable",
  }, {
    t("console.log(JSON.stringify("),
    i(1, "obj"),
    t("));"),
  }),
}
