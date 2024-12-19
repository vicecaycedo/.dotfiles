local M = {}

M.dotfiles = function()
  require('fzf-lua').live_grep({
    cwd = vim.fn.stdpath('config'),
  })
end

return M
