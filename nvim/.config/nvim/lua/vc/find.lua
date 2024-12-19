local M = {}

M.dotfiles = function()
  require('fzf-lua').files({
    header = false,
    cwd = vim.fn.stdpath('config'),
  })
end

M.files = function()
  require('fzf-lua').files({
    header = false,
  })
end

return M
