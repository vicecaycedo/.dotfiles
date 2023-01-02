vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('vc.mappings')
require('vc.options')
require('vc.plugins')

-- Load Google config, if available.
pcall(require, 'google')
