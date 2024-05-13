---@type LazyPluginSpec

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

local M = {
  'stevearc/conform.nvim',
  lazy = false,
}

M.opts = {
  notify_on_error = false,
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'biome' },
    typescript = { 'biome' },
    typescriptreact = { 'biome' },
    prisma = { 'prisma' },
    python = { 'black' },
    haskell = { 'fourmolu' },
    ocaml = { 'ocamlformat' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    elm = { 'elm-format' },
    purescript = { 'purty' },
    clojure = { 'cljstyle' },
    clojuredart = { 'cljstyle' },
    cljd = { 'cljstyle' },
    fennel = { 'fnlfmt' },
  },
  formatters = {
    prisma = {
      command = 'pnpm prisma format',
    },
  },
}

return M
