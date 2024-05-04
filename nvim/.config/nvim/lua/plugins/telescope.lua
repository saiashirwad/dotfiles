---@type LazyPluginSpec
local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
}

M.dependencies = {
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
  'xiyaowong/telescope-emoji.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
}

M.keys = function()
  local telescope = require 'telescope.builtin'

  local find_files_in_dotfiles = function()
    telescope.find_files { search_dirs = { '~/dotfiles' }, hidden = true}
  end

  local grep_dotfiles = function()
    telescope.live_grep { search_dirs = { '~/dotfiles' }, hidden = true }
  end

  local find_files_in_nvim = function()
    telescope.find_files { search_dirs = { '~/.config/nvim' } }
  end

  return {
    { '<C-f>f', telescope.find_files },
    { '<C-f>c', find_files_in_dotfiles },
    { '<C-f>C', grep_dotfiles },
    { '<C-f>v', find_files_in_nvim },
    { '<C-f>w', telescope.live_grep },
    { '<C-f>l', telescope.resume },
    { '<C-f>b', telescope.buffers },
    { '<C-f>b', telescope.help_tags },
    { '<C-f>s', telescope.lsp_document_symbols },
    { '<C-f>d', telescope.diagnostics },

    { '<leader>ff', telescope.find_files },
    { '<leader>fc', find_files_in_dotfiles },
    { '<leader>fC', grep_dotfiles },
    { '<leader>fv', find_files_in_nvim },
    { '<leader>fw', telescope.live_grep },
    { '<leader>fl', telescope.resume },
    { '<leader>fb', telescope.buffers },
    { '<leader>fs', telescope.lsp_document_symbols },
    { '<leader>fd', telescope.diagnostics },
  }
end

M.opts = {
  path_display = { 'filename_first' },
}

M.config = function()
  for _, value in pairs { 'fzf', 'ui-select' } do
    pcall(require('telescope').load_extension, value)
  end
end

return M
