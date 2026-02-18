return {
  {
    'mofiqul/vscode.nvim',
    priority = 1000, -- Load before other start plugins.
    config = function()
      require('vscode').setup({
        transparent = true,
      })
      vim.cmd.colorscheme('vscode')
      vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'none' })
    end,
  },
}
