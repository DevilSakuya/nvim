local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- auto run PackerSync when file save
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }

  -- tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }

  -- treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  -- nvim-ts-rainbow
  use 'p00f/nvim-ts-rainbow'

  -- theme
  use 'folke/tokyonight.nvim'

  -- lsp & dap
  -- java
  use 'mfussenegger/nvim-dap'
  -- use { 'rcarriga/nvim-dap-ui', requires = {'mfussenegger/nvim-dap'} }
  use 'mfussenegger/nvim-jdtls'
  -- mason
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'jay-babu/mason-nvim-dap.nvim',
  }
  use 'ray-x/lsp_signature.nvim'
  -- use {
  --   "jinzhongjia/LspUI.nvim",
  --   branch = 'main'
  -- }

  -- use {
    -- 'neoclide/coc.nvim', 
    -- branch = 'master', 
    -- run = 'npm ci'
  -- }

  -- 自动补全
  use 'L3MON4D3/LuaSnip' -- snippets引擎，不装这个自动补全会出问题
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/cmp-path' -- 文件路径

  -- quick comment
  use 'numToStr/Comment.nvim'
  -- quote pairs
  use 'windwp/nvim-autopairs'

  use 'akinsho/bufferline.nvim' -- buffer分割线
  use 'lewis6991/gitsigns.nvim' -- 左则git提示

  -- 检索
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- 没有办法正确设置
  -- use 'mfussenegger/nvim-fzy'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
