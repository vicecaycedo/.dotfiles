require('vc.mappings')
require('vc.options')
require('vc.plugins')

if require('vc.util').config_exists('google') then
  require('google')
end
