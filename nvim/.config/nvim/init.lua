require('vc/compe')
require('vc/lualine')
require('vc/mappings')
require('vc/plugins')
require('vc/settings')
require('vc/symbols-outline')
require('vc/telescope')
require('vc/treesitter')
require('vc/util')

local function config_exists(name)
  local config_path = vim.fn.stdpath('config')
  return vim.fn.filereadable(config_path .. '/lua/' .. name .. '/init.lua') == 1
end

if config_exists('google') then
  require('google')
end

