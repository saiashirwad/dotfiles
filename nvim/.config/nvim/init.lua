require('texoport').init {
  require 'plugins.cmp',
  require 'plugins.lint',
  require 'plugins.comment',
  require 'plugins.neorg',
  require 'plugins.formatter',
  require 'plugins.lspconfig',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lualine',

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
        icons = false,
      },
      float = {
        padding = 0,
        max_width = 30,
        max_height = 30,
      },
    },
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

  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    version = '*',
    opts = {},
  },

  {
    'dmmulroy/tsc.nvim',
    opts = {
      use_diagnostics = true,
    },
  },

  {
    'supermaven-inc/supermaven-nvim',
    opts = {
      keymaps = {
        accept_suggestion = '<Tab>',
        clear_suggestion = '<C-]>',
        accept_word = '<C-j>',
      },
      ignore_filetypes = { cpp = true },
      color = {
        suggestion_color = '#a1a1aa',
        cterm = 244,
      },
    },
  },

  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  {
    'LintaoAmons/cd-project.nvim',
    tag = 'v0.6.1',
    keys = {
      { '<leader>cd', '<cmd>CdProject<CR>' },
    },
    config = function()
      require('cd-project').setup {
        projects_config_filepath = vim.fs.normalize(vim.fn.stdpath 'config' .. '/cd-project.nvim.json'),
        project_dir_pattern = { '.git', '.gitignore', 'Cargo.toml', 'package.json', 'go.mod' },
        choice_format = 'both', -- optional, you can switch to "name" or "path"
        projects_picker = 'vim-ui', -- optional, you can switch to `telescope`
        auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
        hooks = {
          {
            callback = function(dir)
              vim.notify('switched to dir: ' .. dir)
            end,
          },
          {
            callback = function(_)
              vim.cmd 'Telescope find_files'
            end,
          },
          {
            callback = function(dir)
              vim.notify('switched to dir: ' .. dir)
            end, -- required, action when trigger the hook
            name = 'cd hint', -- optional
            order = 1, -- optional, the exection order if there're multiple hooks to be trigger at one point
            pattern = 'cd-project.nvim', -- optional, trigger hook if contains pattern
            trigger_point = 'DISABLE', -- optional, enum of trigger_points, default to `AFTER_CD`
            match_rule = function(dir) -- optional, a function return bool. if have this fields, then pattern will be ignored
              return true
            end,
          },
        },
      }
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {

      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true, -- Auto close on trailing </
      },
      per_filetype = {
        ['html'] = {
          enable_close = false,
        },
      },
    },
  },

  {
    'tjdevries/ocaml.nvim',
    build = function()
      require('ocaml').update()
    end,
    opts = {},
  },

  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },

  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
  },

  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    dependencies = {
      {
        'junegunn/fzf',
      },
    },
    opts = {
      auto_enable = true,
      preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
      },
      func_map = {
        vsplit = '',
        ptogglemode = 'z,',
        stoggleup = '',
      },
      filter = {
        fzf = {
          action_for = { ['ctrl-s'] = 'split' },
          extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
        },
      },
    },
  },

  {
    'sindrets/diffview.nvim',
    opts = {},
    config = function()
      vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen<CR>')
      vim.keymap.set('n', '<leader>dO', '<cmd>DiffviewClose<CR>')
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd 'colorscheme tokyonight-night'
    end,
  },

  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = {
      modes = {
        lsp = {
          win = { position = 'right' },
        },
      },
    },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>cs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>cS', '<cmd>Trouble lsp toggle<cr>', desc = 'LSP references/definitions/... (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
      {
        '<leader>k',
        function()
          if require('trouble').is_open() then
            require('trouble').prev { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous Trouble/Quickfix Item',
      },
      {
        '<leader>j',
        function()
          if require('trouble').is_open() then
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next Trouble/Quickfix Item',
      },
    },
  },

  { 'nkrkv/nvim-treesitter-rescript' },

  { 'rescript-lang/vim-rescript', ft = 'rescript' },

  { 'aspeddro/rescript-tools.nvim' },
}

if os.getenv 'TERM' == 'xterm-kitty' then
  vim.g.kitty_navigator_no_mappings = 1
  vim.g.tmux_navigator_no_mappings = 1

  vim.api.nvim_set_keymap('n', 'C-h', ':KittyNavigateLeft <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'C-j', ':KittyNavigateDown <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'C-k', ':KittyNavigateUp <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', 'C-l', ':KittyNavigateRight <CR>', { noremap = true, silent = true })
end
