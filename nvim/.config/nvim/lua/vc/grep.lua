local M = {}

local telescope_builtin = require('telescope.builtin')

M.grep_dotfiles = function()
  telescope_builtin.live_grep {
    cwd = vim.fn.stdpath('config'),
    prompt_title = 'Search Dotfiles',
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

