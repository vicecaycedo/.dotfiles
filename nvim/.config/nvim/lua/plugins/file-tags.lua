return {
  'cbochs/grapple.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('grapple').setup({
      popup_options = {
        width = 100,
      },
    })

    nmap('_', require('grapple').toggle, 'toggle grapple tag')
    nmap('-', function()
      if vim.v.count > 0 then
        require('grapple').select({ key = vim.v.count })
      else
        require('grapple').popup_tags()
      end
    end, 'open grapple tags or go directly to tag')
  end,
}
