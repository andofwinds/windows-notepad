local plug = vim.fn['plug#']

vim.call('plug#begin')
  plug('junegunn/fzf', {['do'] = function()
    vim.fn['fzf#install']()
  end})
  plug('neoclide/coc.nvim', {['branch'] = 'release'})

  plug('jiangmiao/auto-pairs')
  plug('junegunn/fzf.vim')
  plug('junegunn/seoul256.vim')
  plug('nvim-tree/nvim-tree.lua')
  plug('nvim-tree/nvim-web-devicons')
  plug('nvim-lualine/lualine.nvim')
  plug('hedyhli/outline.nvim')
  plug('rcarriga/nvim-notify')
  plug('goolord/alpha-nvim')
  plug('gelguy/wilder.nvim')
vim.call('plug#end')

-- Plugins setup
require('plugins.notify')
require('plugins.coc-nvim')
require('plugins.nvim-tree')
require('plugins.lualine')
require('plugins.outline')
require('plugins.alpha')
require('plugins.wilder')
