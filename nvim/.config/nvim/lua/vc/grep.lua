local M = {}

M.grep_buffer = function()
  require('telescope.builtin').current_buffer_fuzzy_find({
    prompt_title = 'grep Buffer',
  })
end

M.grep_dir = function()
  require('telescope.builtin').live_grep({
    prompt_title = 'grep Directory',
  })
end

M.grep_dotfiles = function()
  require('telescope.builtin').live_grep({
    prompt_title = 'grep Dotfiles',
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

M.grep_help = function()
  require('telescope.builtin').help_tags({
    prompt_title = 'grep Help Tags',
  })
end

return M
