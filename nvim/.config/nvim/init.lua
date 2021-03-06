require('vc.mappings')
require('vc.plugins')
require('vc.options')

local function config_exists(name)
  local config_path = vim.fn.stdpath('config')
  return vim.fn.filereadable(config_path .. '/lua/' .. name .. '/init.lua') == 1
end

if config_exists('google') then
  require('google')
end

if config_exists('te') then
  require('te')
end

