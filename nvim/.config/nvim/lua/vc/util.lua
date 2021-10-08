-- Pretty-print objects.
-- Source: https://github.com/nanotee/nvim-lua-guide
function _G.pprint(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
  return ...
end

-- Returns true if value is in table.
function _G.has(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

local M = {}

M.toggle_quickfix = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end

-- Replaces terminal codes and keycodes (<CR>, <Esc>, ...) in a string with the
-- internal representation.
M.replace_termcodes = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return M

