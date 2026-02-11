local M = {}

M.buffer = function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    prompt_title = 'grep buffer',
  })
end

M.dir = function()
  require('telescope.builtin').live_grep({
    prompt_title = 'grep directory',
  })
end

M.dotfiles = function()
  require('telescope.builtin').live_grep({
    prompt_title = 'grep dotfiles',
    cwd = vim.fn.stdpath('config'),
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

M.help = function()
  require('telescope.builtin').help_tags({
    prompt_title = 'grep help tags',
  })
end

return M
