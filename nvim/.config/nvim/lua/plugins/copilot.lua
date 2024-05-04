---@type LazyPluginSpec
local M = {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
}

local disabled_filetypes = {
  markdown = true,
  help = false,
  gitcommit = false,
  gitrebase = false,
  hgcommit = false,
  svn = false,
  cvs = false,
  ['.'] = false,
}

M.opts = {
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = { accept = '<tab>' },
  },
  filetypes = disabled_filetypes,
  copilot_node_command = 'node',
}

return M
