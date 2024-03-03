vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('vc.mappings')
require('vc.options')
require('vc.plugins')

-- Load The Space Key config, if available.
pcall(require, 'tsk')

-- Load Google config, if available.
pcall(require, 'google')
