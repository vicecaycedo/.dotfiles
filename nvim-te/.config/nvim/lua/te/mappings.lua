local keys = require('which-key')

local function smart_outline()
  local ft = vim.api.nvim_buf_get_option(0, 'filetype')
  if ft == 'dart' then
    vim.cmd('FlutterOutlineToggle')
  else
    vim.cmd('SymbolsOutline')
  end
end

local t = require('vc.util').replace_termcodes
function _G.smart_esc()
  local ft = vim.api.nvim_buf_get_option(0, 'filetype')
  if ft == 'flutterToolsOutline' then
    return t '<Cmd>FlutterOutlineToggle<CR>'
  else
    return t '<Esc>'
  end
end

local remap = vim.api.nvim_set_keymap
remap('n', '<Esc>', 'v:lua.smart_esc()', { expr = true, noremap = true, })

keys.register {
  ['<leader>'] = {
    F = { [[<Cmd>Telescope flutter commands<CR>]], 'flutter' },
  },
  -- Override default SymbolsOutline mapping.
  ['<leader>f'] = {
    s = { smart_outline, 'explore symbols' },
  },
}

