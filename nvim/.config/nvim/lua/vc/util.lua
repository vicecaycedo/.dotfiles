local M = {}

-- TODO: Replace with |vim.tbl_contains|.
-- Returns true if |value| is in |table|.
M.table_contains = function(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

-- Toggles the quickfix menu open/closed.
M.toggle_quickfix = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  vim.cmd('copen')
end

-- Toggles the option to strip trailing whitespace on save.
M.toggle_strip_trailing_whitespace = function()
  -- See plugin/strip_trailing_whitespace.vim.
  vim.b.noStripTrailingWhitespace = not vim.b.noStripTrailingWhitespace
  print(
    'b:noStripTrailingWhitespace=' .. tostring(vim.b.noStripTrailingWhitespace)
  )
end

return M
