-- Initialize Packer.
local packer = require('packer')
packer.init()

-- Load plugins.
local use = packer.use

-- Bufferline.
use({
  'akinsho/bufferline.nvim',
  requires = { { 'kyazdani42/nvim-web-devicons', opt = true } },
  config = function()
    require('vc.config.bufferline')
  end,
})

-- Camelcase and underscore objects.
use('bkad/camelcasemotion')

-- Gruvbox theme.
use('morhetz/gruvbox')

-- Toggle comments.
use({
  'b3nj5m1n/kommentary',
  keys = 'gc',
  config = function()
    require('vc.config.kommentary')
  end,
})

-- Statusline.
use({
  'nvim-lualine/lualine.nvim',
  requires = { { 'kyazdani42/nvim-web-devicons', opt = true } },
  config = function()
    require('vc.config.lualine')
  end,
})

-- General purpose language server.
use({
  'jose-elias-alvarez/null-ls.nvim',
  requires = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('vc.lsp.config')
  end,
})

-- Better quickfix.
use({
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  config = function()
    require('vc.config.bqf')
  end,
})

-- Autocompletion and Snippets.
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  },
  setup = function()
    require('vc.setup.nvim-cmp')
  end,
  config = function()
    require('vc.config.nvim-cmp')
  end,
})

-- LSP client configurations.
use({
  'neovim/nvim-lspconfig',
  config = function()
    require('vc.lsp.config')
  end,
})

-- Language server installer.
use({
  'williamboman/nvim-lsp-installer',
  requires = 'neovim/nvim-lspconfig',
  config = function()
    require('vc.lsp.config')
  end,
})

-- File explorer.
use({
  'kyazdani42/nvim-tree.lua',
  requires = { { 'kyazdani42/nvim-web-devicons', opt = true } },
  setup = function()
    require('vc.setup.nvim-tree')
  end,
  config = function()
    require('vc.config.nvim-tree')
  end,
})

-- Treesitter.
use({
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  event = 'BufRead',
  config = function()
    require('vc.config.treesitter')
  end,
})

-- Icons.
use({
  'kyazdani42/nvim-web-devicons',
  module = 'nvim-web-devicons',
})

-- Package manager.
use('wbthomason/packer.nvim')

-- Symbols outline.
use({
  'simrat39/symbols-outline.nvim',
  cmd = 'SymbolsOutline',
  setup = function()
    require('vc.setup.symbols-outline')
  end,
})

-- Telescope.
use({
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  cmd = 'Telescope',
  module = 'telescope',
  config = function()
    require('vc.config.telescope')
  end,
})

-- Word variants.
use({
  'tpope/vim-abolish',
  cmd = { 'S', 'Subvert' },
  keys = 'cr',
})

-- Indent objects.
use('michaeljsmith/vim-indent-object')

-- Repeat plugin commands.
use('tpope/vim-repeat')

-- VCS sign column.
use({
  'mhinz/vim-signify',
  setup = function()
    require('vc.setup.signify')
  end,
})

-- Startify.
use({
  'mhinz/vim-startify',
  setup = function()
    require('vc.setup.startify')
  end,
})

-- Surroundings.
use('tpope/vim-surround')

-- VSCode theme.
use('mofiqul/vscode.nvim')

-- Keybindings.
use({
  'folke/which-key.nvim',
  config = function()
    require('vc.config.which-key')
  end,
})
