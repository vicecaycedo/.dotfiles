require('vc/compe')
require('vc/lualine')
require('vc/mappings')
require('vc/plugins')
require('vc/settings')
require('vc/symbols-outline')
require('vc/telescope')
require('vc/treesitter')
require('vc/util')
require('vc/yank')

local function config_exists(name)
  local configPath = vim.fn.stdpath('config')
  return vim.fn.filereadable(configPath .. '/lua/' .. name .. '/init.lua') == 1
end

if config_exists('google') then
  require('google')
end

