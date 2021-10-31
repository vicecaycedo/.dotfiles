vim.g.mapleader = ' '
vim.g.camelcasemotion_key = '<leader>'

local t = require('vc.util').replace_termcodes

function _G.terminal_esc()
  return t('<C-\\>') .. t('<C-n>')
end
vim.api.nvim_set_keymap('t', '<Esc>', 'v:lua.terminal_esc()', { expr = true })

function _G.smart_enter()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'nofile' or buftype == 'quickfix' then
    return t('<CR>')
  else
    return t('o<Esc>')
  end
end
vim.api.nvim_set_keymap('n', '<CR>', 'v:lua.smart_enter()', { expr = true })

require('which-key').register({
  ['<Left>'] = { '<Cmd>bprevious<CR>', 'previous buffer' },
  ['<Right>'] = { '<Cmd>bnext<CR>', 'next buffer' },
  ['-'] = { '<Cmd>Switch<CR>', 'switch' },
  J = { '<Plug>(signify-next-hunk)', 'next diff' },
  K = { '<Plug>(signify-prev-hunk)', 'prev diff' },
  Y = { 'y$', 'yank until end of line' },
  g = {
    H = {
      '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})<CR>',
      'show line diagnostics',
    },
    R = { vim.lsp.buf.rename, 'rename' },
    a = { vim.lsp.buf.code_action, 'code actions' },
    d = { vim.lsp.buf.definition, 'go to definition' },
    h = { vim.lsp.buf.hover, 'show documentation' },
    r = { vim.lsp.buf.references, 'open references' },
  },
  ['<leader>'] = {
    name = 'leader',
    B = { require('vc.find').find_buffers, 'open buffer' },
    J = { 'J', 'join lines' },
    S = { '<Cmd>Startify<CR>', 'open startify' },
    j = { '<Cmd>cnext<CR>', 'next quickfix item' },
    k = { '<Cmd>cprev<CR>', 'previous quickfix item' },
    q = { '<Cmd>q<CR>', 'close window' },
    r = { '<C-^>', 'return to previous file' },
    s = { '<Cmd>update<CR>', 'save file' },
    x = { '<Cmd>Bwipeout<CR>', 'close buffer' },
  },
  ['<leader>c'] = {
    name = 'clear',
    s = { '<Cmd>let @/ = ""<CR>', 'clear search' },
  },
  ['<leader>d'] = {
    name = 'open diagnostics',
    d = {
      '<Cmd>Telescope lsp_document_diagnostics<CR>',
      'open document diagnostics',
    },
    D = {
      '<Cmd>Telescope lsp_workspace_diagnostics<CR>',
      'open workspace diagnostics',
    },
  },
  ['<leader>f'] = {
    name = 'grep file(s)',
    d = { require('vc.grep').grep_dotfiles, 'grep dotfiles' },
    f = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'grep file' },
    h = { '<Cmd>Telescope help_tags<CR>', 'grep help tags' },
    p = { '<Cmd>Telescope live_grep<CR>', 'grep project' },
    s = { '<Cmd>SymbolsOutline<CR>', 'explore symbols' },
    t = { '<Cmd>Telescope treesitter<CR>', 'grep treesitter' },
  },
  ['<leader>m'] = {
    name = 'version control',
    d = { '<Cmd>SignifyHunkDiff<CR>', 'hunk diff' },
    u = { '<Cmd>SignifyHunkUndo<CR>', 'hunk undo' },
  },
  ['<leader>p'] = {
    name = 'open file',
    d = { require('vc.find').find_dotfiles, 'open dotfile' },
    h = { require('vc.find').find_history, 'open from history' },
    p = { require('vc.find').find_files, 'open file' },
    q = { require('vc.util').toggle_quickfix, 'toggle quickfix' },
  },
  ['<leader>t'] = {
    c = { '<Cmd>Telescope commands<CR>', 'available commands' },
    e = { '<Cmd>NvimTreeToggle<CR>', 'file explorer' },
    f = { '<Cmd>NvimTreeFindFile<CR>', 'find file in file explorer' },
    h = { '<Cmd>Telescope command_history<CR>', 'command history' },
    r = {
      require('vc.util').toggle_strip_trailing_whitespace,
      'toggle StripTrailingWhitespace',
    },
    s = { '<Cmd>Telescope search_history<CR>', 'search history' },
  },
})
