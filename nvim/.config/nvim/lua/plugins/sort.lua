return {
  'christoomey/vim-sort-motion',
  event = 'VeryLazy',
  init = function()
    -- Remove duplicates when sorting.
    vim.g.sort_motion_flags = 'u'
  end,
  config = function()
    -- Register mapping with WhichKey.
    local loaded, wk = pcall(require, 'which-key')
    if loaded then
      wk.add({
        { 'gs', group = 'sort' },
      })
    end
  end,
}
