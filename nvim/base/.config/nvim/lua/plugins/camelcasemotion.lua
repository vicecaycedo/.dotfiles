return {
  'bkad/camelcasemotion',
  event = 'VeryLazy',
  init = function()
    vim.g.camelcasemotion_key = '<Leader>'
  end,
  config = function()
    -- Remove default mapping for <Leader>b.
    vim.cmd.unmap('<Leader>b')

    -- Ignore mappings in WhichKey.
    local loaded, wk = pcall(require, 'which-key')
    if loaded then
      wk.add({
        { '<Leader>e', hidden = true },
        { '<Leader>ge', hidden = true },
        { '<Leader>w', hidden = true },
      })
    end
  end,
}
