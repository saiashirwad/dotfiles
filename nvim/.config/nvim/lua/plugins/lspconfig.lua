local utils = require 'utils'
local set_keymaps = utils.set_keymaps

---@type LazyPluginSpec
local M = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'aspeddro/rescript-tools.nvim',
    { 'williamboman/mason.nvim', config = true },
    { 'folke/neodev.nvim', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'nvim-telescope/telescope.nvim',
  },
}

local organize_imports = function()
  local params = {
    command = 'typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local remove_unused = function()
  local params = {
    command = 'typescript.removeUnused',
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local register_command = function(command)
  return {
    function()
      vim.lsp.buf.execute_command {
        command = command,
      }
    end,
  }
end

local servers = {
  -- tsserver = {
  --   commands = {
  --     OrganizeImports = {
  --       organize_imports,
  --       description = 'Organize Imports',
  --     },
  --   },
  -- },
  vtsls = {
    commands = {
      OrganizeImports = {
        organize_imports,
      },
      RemoveUnused = {
        remove_unused,
      },
      TypescriptVersion = register_command 'typescript.',
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
  rescriptls = {},
}

local server_names = {
  'html',
  'cssls',
  'swift_mesonls',
  'marksman',
  'volar',
  'clangd',
  'elmls',
  'prismals',
  'svelte',
  'jsonls',
  -- 'pyright',
  'rust_analyzer',
  'astro',
  'purescriptls',
  'clojure_lsp',
  'ocamllsp',
  'zls',
  'hls',
}

for _, name in ipairs(server_names) do
  servers[name] = servers[name] or {}
end

M.config = function()
  require('neodev').setup()

  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(ev)
      local telescope = require 'telescope.builtin'
      local opts = { buffer = ev.buf }
      set_keymaps {
        { 'n', 'K', vim.lsp.buf.hover, opts },
        { 'n', 'gr', telescope.lsp_references, opts },
        { 'n', 'gd', telescope.lsp_definitions, opts },
        { 'n', 'gI', telescope.lsp_implementations, opts },
        { 'n', 'rn', vim.lsp.buf.rename, opts },
        { 'n', '<leader>ca', vim.lsp.buf.code_action, opts },
        { 'n', 'gD', vim.lsp.buf.declaration, opts },
      }
    end,
  })

  local ensure_installed = vim.tbl_keys(servers)
  vim.list_extend(ensure_installed, { 'stylua' })

  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }
end

vim.diagnostic.config {
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = true,
}

return M
