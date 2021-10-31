local M = {}

M.find_buffers = function()
  require('telescope.builtin').buffers({
    initial_mode = 'normal',
    prompt_title = 'Find in Buffers',
  })
end

M.find_dotfiles = function()
  require('telescope.builtin').find_files({
    cwd = vim.fn.stdpath('config'),
    follow = true,
    prompt_title = 'Find in Dotfiles',
  })
end

M.find_files = function()
  require('telescope.builtin').find_files({
    hidden = true,
    prompt_title = 'Find',
  })
end

M.find_history = function()
  require('telescope.builtin').oldfiles({
    initial_mode = 'normal',
    prompt_title = 'History',
  })
end

return M
