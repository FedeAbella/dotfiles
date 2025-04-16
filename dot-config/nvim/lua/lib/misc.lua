function DumpTable(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. DumpTable(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

function Log(args)
  if args.range ~= 2 then
    vim.notify("Need to select a variable to log", vim.log.levels.WARN)
    return
  end

  if args.line1 ~= args.line2 then
    vim.notify("Range can only contain one line", vim.log.levels.WARN)
    return
  end

  local _, _, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, _, end_col, _ = unpack(vim.fn.getpos("'>"))

  local selection = string.sub(vim.fn.getline(args.line1), start_col, end_col)
  local ft = vim.bo.filetype
  local templates = require("lib/log_templates")
  if templates[ft] == nil then
    vim.notify("Filetype not suppported", vim.log.levels.WARN)
    return
  end

  vim.cmd(string.gsub(templates[ft], "%%s", selection))
end
