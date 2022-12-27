return {
  'christoomey/vim-sort-motion',
  event = 'VeryLazy',
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
