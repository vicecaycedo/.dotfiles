vim.pack.add({ 'https://github.com/cbochs/grapple.nvim' })

local grapple = require('grapple')
grapple.setup({
  win_opts = {
    width = 200,
  },
})

local nmap = require('vc.keymap').nmap
nmap('_', grapple.toggle, 'toggle grapple tag')
nmap('-', function()
  if vim.v.count > 0 then
    grapple.select({ index = vim.v.count })
  else
    grapple.open_tags()
  end
end, 'open grapple tags or go directly to tag')
