-- Initialize Packer.
local packer = require('packer')
packer.init()
packer.reset()

-- Load plugins.
local use = packer.use
use('bkad/camelcasemotion') -- Camelcase and underscore objects.
use('neovim/nvim-lspconfig') -- LSP client configurations.
use('wbthomason/packer.nvim') -- Package manager.
use('tpope/vim-abolish') -- Support word variants.
use('moll/vim-bbye') -- Keep layout when closing buffers.
use('michaeljsmith/vim-indent-object') -- Indent objects.
use('tpope/vim-repeat') -- Repeat plugin commands.
use('tpope/vim-surround') -- Surroundings.
use('folke/which-key.nvim') -- Keybindings.

-- Toggle comments.
use({
  'b3nj5m1n/kommentary',
  config = function()
    require('vc.config.kommentary')
  end,
})

-- Statusline.
use({
  'hoob3rt/lualine.nvim',
  config = function()
    require('vc.config.lualine')
  end,
})

-- Autocompletion and Snippets.
use({
  'hrsh7th/nvim-cmp',
  requires = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  },
  setup = function()
    require('vc.setup.vsnip')
  end,
  config = function()
    require('vc.config.nvim-cmp')
  end,
})

-- Language server installer.
use({
  'williamboman/nvim-lsp-installer',
  requires = 'neovim/nvim-lspconfig',
})

-- General purpose language server.
use({
  'jose-elias-alvarez/null-ls.nvim',
  requires = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
  },
})

-- File explorer.
use({
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  cmd = 'NvimTreeToggle',
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

-- Theme.
use({
  'mofiqul/vscode.nvim',
  setup = function()
    vim.g.vscode_style = 'dark'
  end,
  config = function()
    vim.cmd('colorscheme vscode')
  end,
})

-- Toggle True/False.
use({
  'andrewradev/switch.vim',
  cmd = 'Switch',
  setup = function()
    require('vc.setup.switch')
  end,
})

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
    'nvim-lua/popup.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  },
  config = function()
    require('vc.config.telescope')
  end,
})

-- TODO: Move to TE config.
-- Flutter.
use({ 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' })
