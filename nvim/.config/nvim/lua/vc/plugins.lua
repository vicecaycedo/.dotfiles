-- Bootstrap Packer.
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

require('packer').startup(function(use)
  use 'bkad/camelcasemotion'             -- CamelCase objects.
  use 'b3nj5m1n/kommentary'              -- Toggle comments.
  use 'hoob3rt/lualine.nvim'             -- Statusline.
  use 'hrsh7th/nvim-compe'               -- Autocompletion.
  use 'neovim/nvim-lspconfig'            -- LSP.
  use 'kyazdani42/nvim-tree.lua'         -- File explorer.
  use 'kyazdani42/nvim-web-devicons'     -- Icons.
  use 'wbthomason/packer.nvim'           -- Packer package manager.
  use 'michaeljsmith/vim-indent-object'  -- Indent objects.
  use 'tpope/vim-repeat'                 -- Repeat plugin commands.
  use 'mhinz/vim-signify'                -- VCS sign column.
  use 'tpope/vim-surround'               -- Surroundings.
  use 'simrat39/symbols-outline.nvim'    -- Symbols outline.
  use 'folke/which-key.nvim'             -- Keybindings.

  -- Themes.
  use 'morhetz/gruvbox'
  use 'mofiqul/vscode.nvim'

  -- Telescope.
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter.
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)

