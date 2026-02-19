return {
  'cbochs/grapple.nvim',
  event = 'VeryLazy',
  config = function()
    require('grapple').setup({
      win_opts = {
        width = 200,
      },
    })

    nmap('_', require('grapple').toggle, 'toggle grapple tag')
    nmap('-', function()
      if vim.v.count > 0 then
        require('grapple').select({ index = vim.v.count })
      else
        require('grapple').open_tags()
      end
    end, 'open grapple tags or go directly to tag')
  end,
}
