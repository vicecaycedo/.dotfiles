vim.g.mapleader = ' '
vim.g.camelcasemotion_key = '<leader>'

-- Replaces terminal codes and keycodes (<CR>, <Esc>, ...) in a string with the
-- internal representation.
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_enter()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  if buftype == '' then
    return t'o<Esc>'
  elseif buftype == 'help' then
    return t'<C-]>'
  else
    return t'<CR>'
  end
end

function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

function _G.smart_s_tab()
  return vim.fn.pumvisible() == 1 and t'<C-p>' or t'<C-h>'
end

function _G.terminal_esc()
  return t'<C-\\>'..t'<C-n>'
end

local remap = vim.api.nvim_set_keymap
remap('n', '<CR>', 'v:lua.smart_enter()', { expr = true, noremap = true, })
remap('i', '<Tab>', 'v:lua.smart_tab()', { expr = true, noremap = true, })
remap('i', '<S-Tab>', 'v:lua.smart_s_tab()', { expr = true, noremap = true, })
remap('t', '<Esc>', 'v:lua.terminal_esc()', { expr = true, noremap = true, })

local keys = require('which-key')

keys.setup {
  plugins = {
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
    },
  },
  show_help = false,
}

keys.register {
  g = {
    a = { '<Cmd>lua vim.lsp.buf.code_action()<CR>', 'code actions' },
    d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
    h = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'show documentation' },
    r = { '<Cmd>lua vim.lsp.buf.references()<CR>', 'open references' },
    R = { '<Cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
  },
  Y = { 'y$', 'yank until end of line' },
  ['<leader>'] = {
    name = 'leader',
    B = { '<Cmd>Telescope buffers<CR>', 'open buffer' },
    s = { '<Cmd>update<CR>', 'save file' },
    r = { '<C-^>', 'return to previous file' },
    -- Window management.
    q = { '<Cmd>q<CR>', 'close window' },
    v = { '<Cmd>vsplit<CR>', 'vertical split' },
    ['-'] = { '<Cmd>split<CR>', 'horizontal split' },
    h = { '<Cmd>wincmd h<CR>', 'focus left' },
    l = { '<Cmd>wincmd l<CR>', 'focus right' },
    k = { '<Cmd>wincmd k<CR>', 'focus up' },
    j = { '<Cmd>wincmd j<CR>', 'focus down' },
    -- Buffer management.
    x = { '<Cmd>bd<CR>', 'close buffer' },
    X = { '<Cmd>bd!<CR>', 'force close buffer' },
    n = { '<Cmd>bnext<CR>', 'next buffer' },
    N = { '<Cmd>bprevious<CR>', 'previous buffer' },
    -- Quickfix navigation.
    [','] = { '<Cmd>cprev<CR>' , 'previous quickfix' },
    [';'] = { '<Cmd>cnext<CR>' , 'next quickfix' },
  },
  ['<leader>c'] = {
    name = 'clear',
    s = { '<Cmd>let @/ = ""<CR>', 'clear search' },
  },
  ['<leader>d'] = {
    name = 'open diagnostics',
    d = {
      '<Cmd>Telescope lsp_document_diagnostics<CR>',
      'open document diagnostics'
    },
    D = {
      '<Cmd>Telescope lsp_workspace_diagnostics<CR>',
      'open workspace diagnostics'
    },
  },
  ['<leader>f'] = {
    name = 'grep file(s)',
    d = {
      [[<Cmd>lua require('vc.util').grep_dotfiles()<CR>]],
      'grep dotfiles'
    },
    f = { '<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'grep file' },
    p = { '<Cmd>Telescope live_grep<CR>' , 'grep project' },
    s = { '<Cmd>SymbolsOutline<CR>', 'explore symbols' },
  },
  ['<leader>m'] = {
    name = 'version control',
    d = { '<Cmd>SignifyHunkDiff<CR>', 'hunk diff' },
    j = { '<Plug>(signify-next-hunk)' , 'next diff' },
    k = { '<Plug>(signify-prev-hunk)' , 'prev diff' },
    u = { '<Cmd>SignifyHunkUndo<CR>', 'hunk undo' },
  },
  ['<leader>P'] = {
    name = 'explore',
    p = { '<Cmd>Telescope file_browser<CR>', 'explore dir' },
  },
  ['<leader>p'] = {
    name = 'open file',
    d = {
      [[<Cmd>lua require('vc.util').find_dotfiles()<CR>]],
      'open dotfile'
    },
    h = {
      [[<Cmd>lua require('vc.util').find_history()<CR>]],
      'open from history'
    },
    l = { '<Cmd>lopen<CR>', 'open loclist' },
    p = { '<Cmd>Telescope find_files<CR>', 'open file' },
    q = {
      [[<Cmd>lua require('vc.util').toggle_quickfix()<CR>]],
      'toggle quickfix'
    },
  },
  ['<leader>t'] = {
    c = { '<Cmd>Telescope commands<CR>', 'available commands' },
    e = { '<Cmd>NvimTreeToggle<CR>', 'file explorer' },
    f = { '<Cmd>NvimTreeFindFile<CR>', 'find file in file explorer' },
    h = { '<Cmd>Telescope command_history<CR>', 'command history' },
    s = { '<Cmd>Telescope search_history<CR>', 'search history' },
  },
  -- Ignore vim-surround mappings.
  ['cs'] = 'which_key_ignore',
  ['cS'] = 'which_key_ignore',
  ['ds'] = 'which_key_ignore',
  ['dS'] = 'which_key_ignore',
  ['ys'] = 'which_key_ignore',
  ['yS'] = 'which_key_ignore',
}

