local ls = require("luasip")
local s = ls.snippet
local t = ls.text_mode
local i = ls.insert_mode
local f = ls.function_node

local function capitalize(args)
  local var = args[1][1] or ""
  return "set" .. (var:sub(1, 1):upper() .. var:sub(2))
end

return {
  s("clg", {
    t("console.log("),
    i(1, '"message"'),
    t(");"),
  }),

  -- div → <div></div>
  -- s("div", {
  --   t("<div>"),
  --   i(1),
  --   t("</div>"),
  -- }),

  -- afn → const funcName = () => { ... };
  s("afn", {
    t("const "),
    i(1, "funcName"),
    t(" = () => {"),
    t({ "", "  " }),
    i(0),
    t({ "", "};" }),
  }),

  -- afnp → const funcName = (params) => { ... };
  s("afnp", {
    t("const "),
    i(1, "funcName"),
    t(" = ("),
    i(2, "params"),
    t(") => {"),
    t({ "", "  " }),
    i(0),
    t({ "", "};" }),
  }),

  -- us → const [state, setState] = useState(initialValue);
  s("us", {
    t("const ["),
    i(1, "state"),
    t(", "),
    f(capitalize, { 1 }),
    t("] = useState("),
    i(2, "initialValue"),
    t(");"),
  }),

  -- uef → useEffect(() => { ... }, []);
  s("uef", {
    t("useEffect(() => {"),
    t({ "", "  " }),
    i(1),
    t({ "", "}, [" }),
    i(2),
    t("]);"),
  }),

  -- imp → import React from 'react';
  s("imp", {
    t("import React from 'react';"),
  }),

  -- rfc → React functional component template
  s("rfc", {
    t("import React from 'react';"),
    t({ "", "", "" }),
    t("const "),
    i(1, "ComponentName"),
    t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <div>" }),
    i(2),
    t({ "</div>", "  );" }),
    t({ "", "};", "", "export default " }),
    i(1),
    t(";"),
  }),

  -- exr → Express route handler
  s("exr", {
    t("app."),
    i(1, "get"),
    t("('"),
    i(2, "/route"),
    t("', (req, res) => {"),
    t({ "", "  " }),
    i(3, "res.send('Hello World');"),
    t({ "", "});" }),
  }),

  -- exp → const express = require('express');
  s("exp", {
    t("const express = require('express');"),
  }),

  -- emw → Express middleware template
  s("emw", {
    t("app.use((req, res, next) => {"),
    t({ "", "  " }),
    i(1, "// middleware logic"),
    t({ "", "  next();" }),
    t({ "", "});" }),
  }),
}
