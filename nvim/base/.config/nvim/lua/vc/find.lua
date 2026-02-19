local M = {}

M.dotfiles = function()
  Snacks.picker.files({
    title = 'Find in Dotfiles',
    cwd = vim.fn.stdpath('config'),
    hidden = true,
    follow = true,
  })
end

M.files = function()
  Snacks.picker.files({
    title = 'Find in Directory',
    hidden = true,
    follow = true,
  })
end

M.workspace = function()
  local provider = require('vc.workspace_files_provider').pick()
  if provider then
    return provider.run()
  end

  return M.files()
end

M.history = function()
  Snacks.picker.recent({
    title = 'Find in Recent',
  })
end

return M
