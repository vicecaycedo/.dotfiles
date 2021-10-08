local M = {}

local telescope_builtin = require('telescope.builtin')

M.find_dotfiles = function()
  telescope_builtin.find_files {
    cwd = vim.fn.stdpath('config'),
    follow = true,
    prompt_title = 'Find in Dotfiles',
  }
end

M.find_history = function()
  telescope_builtin.oldfiles {
    prompt_title = 'History',
  }
end

return M

