local M = {}

-- Sends command to tmux pane and navigates to it.
M.send_command_and_navigate = function(command)
  -- This could be parameterized, but there is currently no need for it.
  local session = '0'
  local window = session .. ':2'
  local pane = window .. '.2'

  -- Send command to tmux pane.
  vim.fn.system('tmux send-keys -t ' .. pane .. ' "' .. command .. '" ENTER')
  -- Navigate to tmux pane.
  vim.fn.system('tmux select-window -t ' .. window)
  vim.fn.system('tmux select-pane -t ' .. pane)
end

return M
