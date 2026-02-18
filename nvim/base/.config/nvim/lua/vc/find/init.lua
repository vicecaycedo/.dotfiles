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

M.project_files = function()
  local provider = require('vc.find.providers').pick()
  if provider then
    return provider.run()
  end

  return M.files()
end

M.history = function()
  require('telescope.builtin').oldfiles({
    prompt_title = 'find in history',
  })
end

return M
