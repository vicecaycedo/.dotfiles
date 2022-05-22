local ls = require('luasnip')

vim.keymap.set({ 'i', 'n', 's' }, '<C-k>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)
vim.keymap.set({ 'i', 'n', 's' }, '<C-j>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  delete_check_events = 'TextChanged',
})

require('luasnip.loaders.from_lua').lazy_load({
  paths = vim.fn.stdpath('config') .. '/snippets',
})
