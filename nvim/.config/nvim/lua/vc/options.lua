for key, val in pairs(
  {
    guicursor = '', -- Cursor styling.
    hidden = true, -- Hide (don't unload) buffers when abandoned.
    shortmess = vim.o.shortmess .. 'I', -- Disable intro message.
    showmode = false, -- Don't show MODE messages.
    termguicolors = true, -- True colors.
    timeoutlen = 400, -- Shorter timeout for WhichKey.
    updatetime = 100, -- Decrease updatetime for a better experience.

    colorcolumn = '80', -- Line limit column.

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
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    smartindent = true,

    -- Autocomplete.
    completeopt = 'menuone,preview,noselect',
    shortmess = vim.o.shortmess .. 'c',
  }
) do
  vim.o[key] = val
end

