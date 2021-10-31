vim.g.mapleader = ' '
vim.g.camelcasemotion_key = '<leader>'

local t = require('vc.util').replace_termcodes

function _G.terminal_esc()
  return t('<C-\\>') .. t('<C-n>')
end
vim.api.nvim_set_keymap('t', '<Esc>', 'v:lua.terminal_esc()', { expr = true })

function _G.smart_enter()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == 'nofile' then
    return t('<CR>')
  else
    return t('o<Esc>')
  end
end
vim.api.nvim_set_keymap('n', '<CR>', 'v:lua.smart_enter()', { expr = true })

local keys = require('which-key')
keys.setup({
  plugins = {
    presets = {
      g = false,
      motions = false,
      operators = false,
      text_objects = false,
    },
  },
  show_help = false,
})
keys.register({
  ['<Left>'] = { '<Cmd>bprevious<CR>', 'previous buffer' },
  ['<Right>'] = { '<Cmd>bnext<CR>', 'next buffer' },
  ['-'] = { '<Cmd>Switch<CR>', 'switch' },
  g = {
    a = { vim.lsp.buf.code_action, 'code actions' },
    d = { vim.lsp.buf.definition, 'go to definition' },
    h = { vim.lsp.buf.hover, 'show documentation' },
    H = {
      '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})<CR>',
      'show line diagnostics',
    },
    r = { vim.lsp.buf.references, 'open references' },
    R = { vim.lsp.buf.rename, 'rename' },
  },
  J = { '<Plug>(signify-next-hunk)', 'next diff' },
  K = { '<Plug>(signify-prev-hunk)', 'prev diff' },
  Y = { 'y$', 'yank until end of line' },
  ['<leader>'] = {
    name = 'leader',
    J = { 'J', 'join lines' },
    S = { '<Cmd>Startify<CR>', 'open startify' },
    s = { '<Cmd>update<CR>', 'save file' },
    r = { '<C-^>', 'return to previous file' },
    -- Window management.
    q = { '<Cmd>q<CR>', 'close window' },
    -- Buffer management.
    B = { require('vc.find').find_buffers, 'open buffer' },
    x = { '<Cmd>Bwipeout<CR>', 'close buffer' },
    -- Quickfix navigation.
    j = { '<Cmd>cnext<CR>', 'next quickfix item' },
    k = { '<Cmd>cprev<CR>', 'previous quickfix item' },
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
    h = { '<Cmd>Telescope command_history<CR>', 'command history' },
    r = {
      require('vc.util').toggle_strip_trailing_whitespace,
      'toggle StripTrailingWhitespace',
    },
    s = { '<Cmd>Telescope search_history<CR>', 'search history' },
  },
  -- Labels for Abolish plugin.
  ['cr'] = {
    name = 'coerce',
    ['<Space>'] = { 'to space case' },
    ['.'] = { 'to.dot.case' },
    ['-'] = { 'to-dash-case' },
    c = { 'toCamelCase' },
    m = { 'ToMixedCase' },
    s = { 'to_snake_case' },
    u = { 'TO_UPPER_SNAKE_CASE' },
  },
  -- Ignore kommentary mappings.
  ['gc'] = 'which_key_ignore',
  -- Ignore vim-surround mappings.
  ['cs'] = 'which_key_ignore',
  ['cS'] = 'which_key_ignore',
  ['ds'] = 'which_key_ignore',
  ['dS'] = 'which_key_ignore',
  ['ys'] = 'which_key_ignore',
  ['yS'] = 'which_key_ignore',
  -- Ignore camelcasemotion mappings.
  ['<leader>b'] = 'which_key_ignore',
  ['<leader>e'] = 'which_key_ignore',
  ['<leader>ge'] = 'which_key_ignore',
  ['<leader>w'] = 'which_key_ignore',
})
