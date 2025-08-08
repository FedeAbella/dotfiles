local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {
  s(
    {
      trig = "auramethod",
      desc = "AuraEnabled Method",
      docstring = "Template for an AuraEnabled method",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        @AuraEnabled
        public static <> <>(<>) {
            try {
                <>
            } catch (Exception e) {
                AuraHandledException auraExc = new AuraHandledException(e.getMessage());
                auraExc.setMessage(e.getMessage());
                throw auraExc;
            }
        }
      ]],
      {
        i(1, "returnType"),
        i(2, "methodName"),
        i(3, "params"),
        i(0),
      }
    )
  ),
  s(
    {
      trig = "auraprop",
      desc = "AuraEnabled Property",
      docstring = "Template for an AuraEnabled property",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        <>@AuraEnabled
        <> <> <><>
      ]],
      {
        d(5, function(args)
          if string.find(args[1][1], "get") or string.find(args[1][1], "set") then
            return sn(
              nil,
              fmta(
                [[
                  /**
                  * @description <>
                   */

                ]],
                { i(1, "description") }
              )
            )
          end
          return sn(nil, {})
        end, 4),
        i(1, "access"),
        i(2, "type"),
        i(3, "name"),
        c(4, {
          t(";"),
          t(" { get; set; }"),
        }),
      }
    )
  ),
}
