return {
  'bkad/camelcasemotion',
  event = 'VeryLazy',
  init = function()
    vim.g.camelcasemotion_key = '<leader>'
  end,
  config = function()
    -- Ignore mappings in WhichKey.
    local loaded, wk = pcall(require, 'which-key')
    if loaded then
      local ignore = 'which_key_ignore'
      wk.register({
        ['<leader>b'] = ignore,
        ['<leader>e'] = ignore,
        ['<leader>ge'] = ignore,
        ['<leader>w'] = ignore,
      })
    end
  end,
}
