local M = {}

---@param lhs string
---@param rhs string|function
---@param desc string
---@param opts? vim.keymap.set.Opts
function M.nmap(lhs, rhs, desc, opts)
  opts = vim.tbl_extend('force', { desc = desc }, opts or {})
  vim.keymap.set('n', lhs, rhs, opts)
end

return M
