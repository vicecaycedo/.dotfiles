return {
  'bkad/camelcasemotion',
  event = 'VeryLazy',
  init = function()
    vim.g.camelcasemotion_key = '<Leader>'
  end,
  config = function()
    -- Ignore mappings in WhichKey.
    local loaded, wk = pcall(require, 'which-key')
    if loaded then
      local ignore = 'which_key_ignore'
      wk.register({
        ['<Leader>b'] = ignore,
        ['<Leader>e'] = ignore,
        ['<Leader>ge'] = ignore,
        ['<Leader>w'] = ignore,
      })
    end
  end,
}
