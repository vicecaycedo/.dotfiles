local M = {}

M.dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = 'find in dotfiles',
    cwd = vim.fn.stdpath('config'),
    follow = true,
  })
end

M.files = function()
  require('telescope.builtin').find_files({
    prompt_title = 'find in directory',
    hidden = true,
  })
end

M.history = function()
  require('telescope.builtin').oldfiles({
    prompt_title = 'find in history',
  })
end

return M
