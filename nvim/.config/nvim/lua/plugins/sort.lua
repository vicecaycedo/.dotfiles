return {
  'christoomey/vim-sort-motion',
  event = 'VeryLazy',
  init = function()
    -- Remove duplicates when sorting.
    vim.g.sort_motion_flags = 'u'
  end,
  config = function()
    -- Register mapping with which-key.
    local loaded, wk = pcall(require, 'which-key')
    if loaded then
      wk.register({
        ['gs'] = 'sort',
      })
    end
  end,
}
