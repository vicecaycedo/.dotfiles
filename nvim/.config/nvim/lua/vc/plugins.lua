-- Bootstrap Packer.
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

require('packer').startup(function(use)
  use 'bkad/camelcasemotion'             -- Camelcase and underscore objects.
  use 'b3nj5m1n/kommentary'              -- Toggle comments.
  use 'neovim/nvim-lspconfig'            -- LSP.
  use 'kabouzeid/nvim-lspinstall'        -- Language server installer.
  use 'wbthomason/packer.nvim'           -- Package manager.
  use 'michaeljsmith/vim-indent-object'  -- Indent objects.
  use 'tpope/vim-repeat'                 -- Repeat plugin commands.
  use 'tpope/vim-surround'               -- Surroundings.
  use 'folke/which-key.nvim'             -- Keybindings.

  -- Flutter.
  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- Statusline.
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require('vc.config.lualine')
    end,
  }

  -- Autocompletion.
  use {
    'hrsh7th/nvim-compe',
    config = function()
      require('vc.config.compe')
    end,
    event = 'InsertEnter',
  }

  -- File explorer.
  use {
    'kyazdani42/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeFindFile',
    },
    config = function()
      require('nvim-tree').setup()
    end,
    requires = 'kyazdani42/nvim-web-devicons',
    setup = function()
      require('vc.setup.nvim-tree')
    end,
  }

  -- Treesitter.
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('vc.config.treesitter')
    end,
    event = 'BufRead',
    run = ':TSUpdate',
  }

  -- Icons.
  use {
    'kyazdani42/nvim-web-devicons',
    module = 'nvim-web-devicons',
  }

  -- VCS sign column.
  use {
    'mhinz/vim-signify',
    setup = function()
      require('vc.setup.signify')
    end,
  }

  -- Startify.
  use {
    'mhinz/vim-startify',
    setup = function()
      require('vc.setup.startify')
    end,
  }

  -- Toggle True/False.
  use {
    'AndrewRadev/switch.vim',
    cmd = 'Switch',
    setup = function()
      require('vc.setup.switch')
    end,
  }

  -- Symbols outline.
  use {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    setup = function()
      require('vc.setup.symbols-outline')
    end,
  }

  -- Telescope.
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('vc.config.telescope')
    end,
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
  }

  -- Themes.
  use {
    'morhetz/gruvbox',
    setup = function()
      vim.g.gruvbox_italic = 1
      vim.g.gruvbox_invert_selection = 0
    end,
  }
  use {
    'mofiqul/vscode.nvim',
    config = function()
      vim.cmd[[colorscheme vscode]]
    end,
    setup = function()
      vim.g.vscode_style = 'dark'
    end,
  }

end)

