return {
    s({
        trig = "docstring",
        desc = "ApexDoc docstring",
        docstring = "An ApexDoc formatted docstring for classes and methods",
    }, {
        c(1, {
            sn(nil, {
                t("/**"),
                t({ "", " * @description " }),
                i(1, "Class/Method description"),
                t({ "", " */" }),
                i(0),
            }),
            sn(nil, {
                t("/**"),
                t({ "", " * @description " }),
                i(1, "Class/Method description"),
                t({ "", " * @param " }),
                i(2, "Parameter name"),
                t(" "),
                i(3, "Parameter description"),
                t({ "", " */" }),
                i(0),
            }),
            sn(nil, {
                t("/**"),
                t({ "", " * @description " }),
                i(1, "Class/Method description"),
                t({ "", " * @return " }),
                i(2, "Return value"),
                t({ "", " */" }),
                i(0),
            }),
            sn(nil, {
                t("/**"),
                t({ "", " * @description " }),
                i(1, "Class/Method description"),
                t({ "", " * @param " }),
                i(2, "Parameter name"),
                t(" "),
                i(3, "Parameter description"),
                t({ "", " * @return " }),
                i(4, "Return value"),
                t({ "", " */" }),
                i(0),
            }),
        }),
    }),
    s({
        trig = "testmethod",
        desc = "Apex Test Method",
        docstring = "Template for Apex Test method",
    }, {
        t("@IsTest"),
        t({ "", "static void " }),
        i(1, "Method name"),
        t("() {"),
        t({ "", "    " }),
        i(0),
        t({ "", "}" }),
    }),
    s({
        trig = "testclass",
        desc = "Apex Test Class",
        docstring = "Template for Apex Test class",
    }, {
        t("@IsTest"),
        t({ "", "private class " }),
        i(1, "Class name"),
        t(" {"),
        t({ "", "    " }),
        i(0),
        t({ "", "}" }),
    }),
    s({
        trig = "testsetup",
        desc = "Apex Test Setup",
        docstring = "Template for Apex Test setup method",
    }, {
        t("@TestSetup"),
        t({ "", "static void setup() {" }),
        t({ "", "    " }),
        i(0),
        t({ "", "}" }),
    }),
}