---@type LazyPluginSpec
local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
}

M.dependencies = {
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'onsails/lspkind-nvim',
  {
    'quangnguyen30192/cmp-nvim-tags',
    ft = {
      'ruby',
    },
  },
}

M.config = function()
  local cmp = require 'cmp'
  local lspkind = require 'lspkind'

  cmp.setup {
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-y>'] = cmp.mapping.confirm { select = true },
      ['<CR>'] = cmp.mapping.confirm { select = true },
      ['<C-Space>'] = cmp.mapping.complete {},
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'neorg' },
      {
        name = 'tags',
        option = {
          -- this is the default options, change them if you want.
          -- Delayed time after user input, in milliseconds.
          complete_defer = 100,
          -- Max items when searching `taglist`.
          max_items = 10,
          -- The number of characters that need to be typed to trigger
          -- auto-completion.
          keyword_length = 3,
          -- Use exact word match when searching `taglist`, for better searching
          -- performance.
          exact_match = false,
          -- Prioritize searching result for current buffer.
          current_buffer_only = false,
        },
      },
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      expandable_indicator = true,
      format = lspkind.cmp_format {
        mode = 'symbol_text',
        maxwidth = 50,
        ellipsis_char = '...',
        before = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      },
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  }
end

return M
