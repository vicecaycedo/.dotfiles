vim.pack.add({
  'https://github.com/folke/snacks.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/wojciech-kulik/xcodebuild.nvim',
})

require('xcodebuild').setup({
  restore_on_start = false,
  integrations = {
    -- Don't update Xcode project files when using oil.nvim. All project
    -- updates should be through `tuist generate`.
    oil_nvim = {
      enabled = false,
    },
  },
})

local nmap = require('vc.keymap').nmap
nmap('<Leader>rd', '<Cmd>XcodebuildSelectDevice<CR>', 'select device')
nmap('<Leader>rr', '<Cmd>XcodebuildBuildRun<CR>', 'build and run')
nmap(
  '<Leader>rp',
  '<Cmd>XcodebuildPreviewGenerateAndShow<CR>',
  'generate & show preview'
)
nmap('<Leader>rP', '<Cmd>XcodebuildPreviewHide<CR>', 'hide preview')
