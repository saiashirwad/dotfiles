return {
  'nvim-neorg/neorg',
  keys = function()
    local neorg = require 'neorg.core'
    local modules = neorg.modules

    return {
      {
        '<leader>nt',
        '<cmd>Neorg journal today<cr>',
      },
    }
  end,
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.concealer'] = {
          config = {
            folds = false,
            icon_preset = 'diamond',
          },
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/notes',
            },
            default_workspace = 'notes',
          },
        },
        ['core.completion'] = {
          config = {
            engine = 'nvim-cmp',
          },
        },
      },
    }

    -- vim.wo.foldlevel = 99
    -- vim.wo.conceallevel = 2
  end,
}
