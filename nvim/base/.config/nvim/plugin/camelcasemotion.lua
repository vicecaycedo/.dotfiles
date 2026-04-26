vim.g.camelcasemotion_key = '<Leader>'

vim.pack.add({ 'https://github.com/bkad/camelcasemotion' })

-- Remove default mapping for <Leader>b.
vim.keymap.del({ 'n', 'x', 'o' }, '<Leader>b')
