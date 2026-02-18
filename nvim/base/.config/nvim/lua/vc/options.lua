vim.o.colorcolumn = '80' -- Line limit column.
vim.o.scrolloff = 15 -- Minimum number of lines to keep above and below the cursor.
vim.o.shortmess = vim.o.shortmess .. 'I' -- Disable intro message.
vim.o.showmode = false -- Don't show MODE messages.
vim.o.signcolumn = 'yes' -- Always show sign column.
vim.o.swapfile = false -- Disable swap files.
vim.o.termguicolors = true -- True colors.
vim.o.updatetime = 100 -- Decrease updatetime for a better experience.
vim.opt.fillchars = { eob = ' ' } -- Remove end-of-file characters.

-- Search case sensitivity.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Split window direction.
vim.o.splitbelow = true
vim.o.splitright = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Display whitespace characters.
vim.o.list = true
vim.opt.listchars = { tab = '» ', lead = '·', trail = '·', nbsp = '␣' }

-- Tabs/indents.
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- Don't load built-in plugins.
vim.g.loaded_gzip = true
vim.g.loaded_matchit = true
vim.g.loaded_matchparen = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_tohtml = true
vim.g.loaded_tutor = true
vim.g.loaded_zipPlugin = true
