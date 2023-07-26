local M = {}

M.find_dotfiles = function()
  require('telescope.builtin').find_files({
    prompt_title = 'Find in Dotfiles',
    cwd = vim.fn.stdpath('config'),
    follow = true,
  })
end

M.find_files = function()
  require('telescope.builtin').find_files({
    prompt_title = 'Find in Directory',
    hidden = true,
  })
end

M.find_history = function()
  require('telescope.builtin').oldfiles({
    prompt_title = 'Find in History',
  })
end

return M
