return {
  -- Default colorscheme.
  {
    'mofiqul/vscode.nvim',
    priority = 1000, -- Load before other start plugins.
    config = function()
      vim.g.vscode_style = 'dark'
      vim.cmd.colorscheme('vscode')
    end,
  },
  -- Other colorschemes.
  -- These are automatically loaded with the |colorscheme| Ex command.
  {
    'morhetz/gruvbox',
    lazy = true,
    config = function()
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_invert_selection = false
      vim.g.gruvbox_sign_column = 'bg0'
    end,
  },
}
