vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('Neodev', function()
  -- dont run neodev.setup
  vim.lsp.start {
    name = 'lua_ls',
    cmd = { 'lua-language-server' },
    before_init = require('neodev.lsp').before_init,
    root_dir = vim.fn.getcwd(),
    settings = { Lua = {} },
  }
end, { nargs = 0 })
