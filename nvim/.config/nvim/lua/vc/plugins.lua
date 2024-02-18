-- Bootstrap lazy.nvim.
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy.nvim.
require('lazy').setup('plugins', {
  change_detection = {
    notify = false, -- Silence notifications for configuration changes.
  },
  ui = {
    size = { height = 0.85, width = 0.85 },
  },
})
