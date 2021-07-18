local M = {}

local telescope_builtin = require('telescope.builtin')

M.find_dotfiles = function()
  telescope_builtin.find_files {
    follow = true,
    prompt_title = 'Find in Dotfiles',
    search_dirs = {
      vim.fn.stdpath('config')
    },
  }
end

M.find_history = function()
  telescope_builtin.oldfiles {
    prompt_title = "History",
  }
end

M.grep_dotfiles = function()
  telescope_builtin.live_grep {
    follow = true,
    prompt_title = 'Search Dotfiles',
    search_dirs = {
      vim.fn.stdpath('config')
    },
  }
end

return M

