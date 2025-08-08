local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node

return {
  s({
    trig = "docstring",
    desc = "ApexDoc docstring",
    docstring = { "An ApexDoc formatted docstring", "for classes and methods" },
    snippetType = "autosnippet",
  }, {
    c(1, {
      sn(nil, {
        t({ "/**", " * @description " }),
        i(1, "Class/Method description"),
        t({ "", " */" }),
        i(0),
      }),
      sn(nil, {
        t({ "/**", " * @description " }),
        i(1, "Class/Method description"),
        t({ "", " * @param " }),
        i(2, "name"),
        t(" "),
        i(3, "description"),
        t({ "", " */" }),
        i(0),
      }),
      sn(nil, {
        t({ "/**", " * @description " }),
        i(1, "Class/Method description"),
        t({ "", " * @return " }),
        i(2, "description"),
        t({ "", " */" }),
        i(0),
      }),
      sn(nil, {
        t({ "/**", " * @description " }),
        i(1, "Class/Method description"),
        t({ "", " * @param " }),
        i(2, "name"),
        t(" "),
        i(3, "descrition"),
        t({ "", " * @return " }),
        i(4, "description"),
        t({ "", " */" }),
        i(0),
      }),
    }),
  }),
  s({
    trig = "testmethod",
    desc = "Apex Test Method",
    docstring = "Template for Apex Test method",
    snippetType = "autosnippet",
  }, {
    t({ "@IsTest", "static void " }),
    i(1, "methodName"),
    t({ "() {", "    " }),
    i(0),
    t({ "", "}" }),
  }),
  s({
    trig = "testclass",
    desc = "Apex Test Class",
    docstring = "Template for Apex Test class",
    snippetType = "autosnippet",
  }, {
    t({ "@IsTest", "private class " }),
    i(1, "className"),
    t({ " {", "    " }),
    i(0),
    t({ "", "}" }),
  }),
  s({
    trig = "testsetup",
    desc = "Apex Test Setup",
    docstring = "Template for Apex Test setup method",
    snippetType = "autosnippet",
  }, {
    t({ "@TestSetup", "static void setup() {", "    " }),
    i(0),
    t({ "", "}" }),
  }),
  s({
    trig = "auramethod",
    desc = "AuraEnabled Method",
    docstring = "Template for an AuraEnabled method",
    snippetType = "autosnippet",
  }, {
    t({ "@AuraEnabled", "public static " }),
    i(1, "returnType"),
    t(" "),
    i(2, "methodName"),
    t("("),
    i(3, "params"),
    t(""),
    t({ ") {", "    try {", "        " }),
    i(0),
    t({
      "",
      "    } catch (Exception e) {",
      "        AuraHandledException auraExc = new AuraHandledException(e.getMessage());",
      "        auraExc.setMessage(e.getMessage());",
      "        throw auraExc;",
      "    }",
      "}",
    }),
  }),
  s({
    trig = "auraprop",
    desc = "AuraEnabled Property",
    docstring = "Template for an AuraEnabled property",
    snippetType = "autosnippet",
  }, {
    t({ "@AuraEnabled", "" }),
    i(1, "access"),
    t(" "),
    i(2, "type"),
    t(" "),
    i(3, "name"),
    c(4, {
      t(";"),
      t(" { get; set; }"),
    }),
  }),
}
