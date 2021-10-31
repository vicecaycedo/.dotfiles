local M = {}

M.grep_dotfiles = function()
  require('telescope.builtin').live_grep({
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
  })
end

return M
