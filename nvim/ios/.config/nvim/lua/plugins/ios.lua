return {
  {
    'wojciech-kulik/xcodebuild.nvim',
    dependencies = {
      'folke/snacks.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
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

      nmap('<Leader>rb', '<Cmd>XcodebuildBuild<CR>', 'build')
      nmap('<Leader>rc', '<Cmd>XcodebuildCancel<CR>', 'cancel')
      nmap('<Leader>rd', '<Cmd>XcodebuildSelectDevice<CR>', 'select device')
      nmap('<Leader>rr', '<Cmd>XcodebuildBuildRun<CR>', 'build and run')
      nmap('<Leader>rR', '<Cmd>XcodebuildTestRepeat<CR>', 'repeat tests')
      nmap('<Leader>rt', '<Cmd>XcodebuildTestExplorerToggle<CR>', 'show tests')
      nmap(
        '<Leader>rp',
        '<Cmd>XcodebuildPreviewGenerateAndShow<CR>',
        'generate & show preview'
      )
      nmap('<Leader>rP', '<Cmd>XcodebuildPreviewHide<CR>', 'hide preview')
    end,
  },
}
