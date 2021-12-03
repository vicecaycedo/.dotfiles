for key, val in pairs({
  colorcolumn = '80', -- Line limit column.
  hidden = true, -- Hide (don't unload) buffers when abandoned.
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
