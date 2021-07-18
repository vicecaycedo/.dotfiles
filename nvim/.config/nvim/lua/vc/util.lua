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
    prompt_title = 'Search Dotfiles',
    search_dirs = {
      vim.fn.stdpath('config')
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--follow',
    },
  }
end

return M

