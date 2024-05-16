require('texoport').init {
  require 'plugins.cmp',
  require 'plugins.comment',
  require 'plugins.copilot',
  require 'plugins.formatter',
  require 'plugins.lint',
  require 'plugins.trouble',
  require 'plugins.lspconfig',
  require 'plugins.neo_tree',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  {
    'folke/neodev.nvim',
    opts = {},
    init = function()
      local neodev = require 'neodev'
      neodev.setup()
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    init = function()
      local jump = require('flash').jump
      vim.keymap.set('n', 's', jump)
      vim.keymap.set('x', 's', jump)
      vim.keymap.set('o', 's', jump)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<CR>')
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 0,
        max_width = 30,
        max_height = 30,
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = function()
      local oil = require 'oil'
      return {
        { '<C-f><C-o>', oil.open },
        { '<leader>fo', oil.open_float },
      }
    end,
  },
  { 'duane9/nvim-rg' },
  {
    'oxfist/night-owl.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    opts = {
      -- These are the default settings
      bold = true,
      italics = false,
      underline = true,
      undercurl = true,
      transparent_background = false,
    },
    init = function()
      vim.cmd.colorscheme 'night-owl'
    end,
  },
  {
    'nvim-pack/nvim-spectre',
    lazy = false,
    event = 'BufRead',
    opts = {},
    keys = {
      { '<leader>sr', '<cmd>Spectre<CR>' },
    },
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  { 'mg979/vim-visual-multi', lazy = false },
  {
    'alexghergh/nvim-tmux-navigation',
    opts = {},
    keys = function()
      local nvim_tmux_nav = require 'nvim-tmux-navigation'
      return {
        { '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = 'Navigate Left' } },
        { '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown, { desc = 'Navigate Down' } },
        { '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp, { desc = 'Navigate Up' } },
        { '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight, { desc = 'Navigate Right' } },
        { '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive, { desc = 'Navigate Last Active' } },
        { '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext, { desc = 'Navigate Next' } },
      }
    end,
  },
  { 'echasnovski/mini.colors', version = '*', opts = {} },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {},
  },
}
