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
    telescope.find_files { search_dirs = { '~/dotfiles' }, hidden = true }
  end

  local grep_dotfiles = function()
    telescope.live_grep { search_dirs = { '~/dotfiles' }, hidden = true }
  end

  local find_files_in_nvim = function()
    telescope.find_files { search_dirs = { '~/.config/nvim' } }
  end

  return {
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

M.config = function()
  for _, value in pairs { 'fzf', 'ui-select' } do
    pcall(require('telescope').load_extension, value)
  end

  local open_with_trouble = require('trouble.sources.telescope').open
  require('telescope').setup {
    path_display = { 'filename_first' },
    defaults = {
      mappings = {
        i = { ['<c-t>'] = open_with_trouble },
        n = { ['<c-t>'] = open_with_trouble },
      },
    },
  }
end

return M
