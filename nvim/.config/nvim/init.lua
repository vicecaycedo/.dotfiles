require('impatient')

require('vc.mappings')
require('vc.options')
require('vc.plugins')

if vim.fn.isdirectory(vim.fn.stdpath('config') .. '/lua/google') then
  require('google')
end
