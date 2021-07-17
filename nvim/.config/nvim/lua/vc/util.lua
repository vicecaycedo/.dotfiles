local M = {}

local telescope_builtin = require('telescope.builtin')

M.find_dotfiles = function()
  -- TODO: Implement find_dotfiles now that the dotfiles are symlinked across
  -- several directories.
  print('find_dotfiles unimplemented')
  --[[ telescope_builtin.find_files {
    cwd = '~/.config/nvim/',
    prompt_title = 'Find in Dotfiles',
  } ]]
end

M.find_history = function()
  telescope_builtin.oldfiles {
    prompt_title = "History",
  }
end

M.grep_dotfiles = function()
  -- TODO: Implement grep_dotfiles now that the dotfiles are symlinked across
  -- several directories.
  print('grep_dotfiles unimplemented')
  --[[ telescope_builtin.live_grep {
    cwd = '~/.config/nvim/',
    prompt_title = 'Search Dotfiles',
  } ]]
end

return M

