local highlight_on_yank = function()
  vim.highlight.on_yank()
end

local highlight_yank_group_id = vim.api.nvim_create_augroup(
  'highlight_yank',
  {}
)
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_yank_group_id,
  callback = highlight_on_yank,
})
