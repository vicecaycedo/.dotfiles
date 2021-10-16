local function smart_outline()
  local ft = vim.api.nvim_buf_get_option(0, 'filetype')
  if ft == 'dart' then
    vim.cmd('FlutterOutlineToggle')
  else
    vim.cmd('SymbolsOutline')
  end
end

local keys = require('which-key')
keys.register({
  ['<leader>'] = {
    F = { '<Cmd>Telescope flutter commands<CR>', 'flutter' },
  },
  -- Override default SymbolsOutline mapping.
  ['<leader>f'] = {
    s = { smart_outline, 'explore symbols' },
  },
})
