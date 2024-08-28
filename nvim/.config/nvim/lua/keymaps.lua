local set_keymaps = require('utils').set_keymaps

set_keymaps {
  { 'n', '<Esc>', '<cmd>nohlsearch<CR>' },
  { 'n', '<C-v>c', '<cmd>e $MYVIMRC<CR>' },
  { 'n', '<Tab>', '<cmd>:bn<cr>' },
  { 'n', '<S-Tab>', '<cmd>:bp<cr>' },
  { 'n', '<C-d>', '<C-d>zz' },
  { 'n', '<C-u>', '<C-u>zz' },
  { 'n', 'n', 'nzz' },
  { 'n', 'N', 'Nzz' },
  { 'n', '[d', vim.diagnostic.goto_prev },
  { 'n', ']d', vim.diagnostic.goto_next },
  {
    'n',
    '<leader>rb',
    function()
      vim.cmd [[ !bun run % ]]
    end,
  },
}
