for key, val in pairs({
  colorcolumn = '80', -- Line limit column.
  signcolumn = 'yes', -- Always show sign column.
  showmode = false, -- Don't show MODE messages.
  termguicolors = true, -- True colors.
  timeoutlen = 400, -- Shorter timeout for WhichKey.
  updatetime = 100, -- Decrease updatetime for a better experience.

  -- Search case sensitivity.
  ignorecase = true,
  smartcase = true,

  -- Split window direction.
  splitbelow = true,
  splitright = true,

  -- Line numbers
  number = true,
  relativenumber = true,

  -- Tabs/indents.
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  softtabstop = 2,
  tabstop = 2,

  -- Autocomplete.
  completeopt = 'menuone,noselect',
  shortmess = vim.o.shortmess .. 'c',
}) do
  vim.o[key] = val
end

-- Don't load builtin plugins.
vim.g.loaded_matchit = true
vim.g.loaded_netrwPlugin = true

-- Theme.
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = false
vim.g.gruvbox_sign_column = 'bg0'
vim.cmd('colorscheme gruvbox')
-- vim.g.vscode_style = 'dark'
-- vim.cmd('colorscheme vscode')
