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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'akinsho/bufferline.nvim', tag = "v3.*",	requires = 'nvim-tree/nvim-web-devicons'}
  use 'yamatsum/nvim-cursorline'
  use 'mhinz/vim-startify'
  use 'lewis6991/gitsigns.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'SirVer/ultisnips'}  
  use {'honza/vim-snippets'}
  use {"windwp/nvim-autopairs"}
  use 'gelguy/wilder.nvim'
  use 'preservim/nerdcommenter'
  use 'karb94/neoscroll.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
