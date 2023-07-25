return {
  -- Default colorscheme.
  {
    'mofiqul/vscode.nvim',
    priority = 1000, -- Load before other start plugins.
    config = function()
      vim.cmd.colorscheme('vscode')
    end,
  },
}
