local osc52_yank = function()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
    vim.cmd('OSCYankReg +')
  end
end

local osc52_yank_group_id = vim.api.nvim_create_augroup('osc52_yank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = osc52_yank_group_id,
  callback = osc52_yank,
})
