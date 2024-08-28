---@type LazyPluginSpec

local M = {
  'yetone/avante.nvim',
  lazy = false,
  event = 'VeryLazy',
  build = 'make',
  opts = {
    provider = 'gemini',
    ---@type AvanteSupportedProvider
    gemini = {
      endpoint = 'https://generativelanguage.googleapis.com/v1beta/models',
      model = 'gemini-1.5-pro',
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 4096,
      ['local'] = false,
    },
    mappings = {
      ask = '<leader>aa',
      edit = '<leader>ae',
      refresh = '<leader>ar',
      --- @class AvanteConflictMappings
      diff = {
        ours = 'co',
        theirs = 'ct',
        none = 'c0',
        both = 'cb',
        next = ']x',
        prev = '[x',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      toggle = {
        debug = '<leader>ad',
        hint = '<leader>ah',
      },
    },
    hints = { enabled = true },
    windows = {
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        align = 'center', -- left, center, right for title
        rounded = true,
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = 'DiffText',
        incoming = 'DiffAdd',
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      debug = false,
      autojump = true,
      ---@type string | fun(): any
      list_opener = 'copen',
    },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}

return M
