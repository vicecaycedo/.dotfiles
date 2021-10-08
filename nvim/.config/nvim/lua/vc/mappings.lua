vim.g.mapleader = ' '
vim.g.camelcasemotion_key = '<leader>'

local t = require('vc.util').replace_termcodes

function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t '<C-n>' or t '<Tab>'
end

function _G.smart_s_tab()
  return vim.fn.pumvisible() == 1 and t '<C-p>' or t '<C-h>'
end

function _G.terminal_esc()
  return t '<C-\\>' .. t '<C-n>'
end

local function toggleStripTrailingWhitespace()
  -- See /plugin/strip_trailing_whitespace.vim.
  vim.b.noStripTrailingWhitespace = not vim.b.noStripTrailingWhitespace
  print('b:noStripTrailingWhitespace=' .. tostring(vim.b.noStripTrailingWhitespace))
end

local remap = vim.api.nvim_set_keymap
remap('i', '<Tab>', 'v:lua.smart_tab()', { expr = true, noremap = true, })
remap('i', '<S-Tab>', 'v:lua.smart_s_tab()', { expr = true, noremap = true, })
remap('i', '<CR>', [[compe#confirm('<CR>')]], { expr = true, noremap = true, })
remap('t', '<Esc>', 'v:lua.terminal_esc()', { expr = true, noremap = true, })

local keys = require('which-key')

keys.setup {
  plugins = {
    presets = {
      g = false,
      motions = false,
      operators = false,
      text_objects = false,
    },
  },
  show_help = false,
}

keys.register {
  ['<CR>'] = { 'o<Esc>', 'new line' },
  ['-'] = { '<Cmd>Switch<CR>', 'switch' },
  g = {
    a = { vim.lsp.buf.code_action, 'code actions' },
    d = { vim.lsp.buf.definition, 'go to definition' },
    F = { '<Cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', 'format' },
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
    B = { '<Cmd>Telescope buffers<CR>', 'open buffer' },
    J = { 'J', 'join lines' },
    s = { '<Cmd>update<CR>', 'save file' },
    r = { '<C-^>', 'return to previous file' },
    -- Window management.
    q = { '<Cmd>q<CR>', 'close window' },
    -- Buffer management.
    x = { '<Cmd>Bwipeout<CR>', 'close buffer' },
    n = { '<Cmd>bnext<CR>', 'next buffer' },
    N = { '<Cmd>bprevious<CR>', 'previous buffer' },
    -- Quickfix navigation.
    j = { '<Cmd>cnext<CR>', 'next quickfix' },
    k = { '<Cmd>cprev<CR>', 'previous quickfix' },
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
    p = { '<Cmd>Telescope live_grep<CR>', 'grep project' },
    s = { '<Cmd>SymbolsOutline<CR>', 'explore symbols' },
  },
  ['<leader>m'] = {
    name = 'version control',
    d = { '<Cmd>SignifyHunkDiff<CR>', 'hunk diff' },
    u = { '<Cmd>SignifyHunkUndo<CR>', 'hunk undo' },
  },
  ['<leader>P'] = {
    name = 'explore',
    p = { '<Cmd>Telescope file_browser<CR>', 'explore dir' },
  },
  ['<leader>p'] = {
    name = 'open file',
    d = { require('vc.find').find_dotfiles, 'open dotfile' },
    h = { require('vc.find').find_history, 'open from history' },
    l = { '<Cmd>lopen<CR>', 'open loclist' },
    p = { '<Cmd>Telescope find_files<CR>', 'open file' },
    q = { require('vc.util').toggle_quickfix, 'toggle quickfix' },
  },
  ['<leader>t'] = {
    c = { '<Cmd>Telescope commands<CR>', 'available commands' },
    e = { '<Cmd>NvimTreeToggle<CR>', 'file explorer' },
    h = { '<Cmd>Telescope command_history<CR>', 'command history' },
    r = { toggleStripTrailingWhitespace, 'toggle StripTrailingWhitespace' },
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
}

