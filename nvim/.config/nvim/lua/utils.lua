require 'types'
local M = {}

---@param plugin LazyPluginSpec
M.lazy_plugin = function(plugin)
  return plugin
end

---@class Keymap
---@field [1] 'n' | 'i' | 'v'
---@field [2] string
---@field [3] string | fun()
---@param keymaps Keymap[]
M.set_keymaps = function(keymaps)
  for _, keymap in ipairs(keymaps) do
    vim.keymap.set(keymap[1], keymap[2], keymap[3], {
      silent = true,
      remap = true,
    })
  end
end

M.get_macos_appearance = function()
  local handle = io.popen 'defaults read -g AppleInterfaceStyle 2>/dev/null'
  if handle then
    local result = handle:read '*a'
    handle:close()
    return result:match 'Dark' and 'dark' or 'light'
  else
    return 'light' -- Default to light if we can't determine
  end
end

---@class ThemeConfig
---@field dark_theme string The name of the dark theme for Neovim
---@field light_theme string The name of the light theme for Neovim

---@param config ThemeConfig
M.set_theme_from_system = function(config)
  local appearance = M.get_macos_appearance()
  if appearance == 'dark' then
    vim.cmd 'set background=dark'
    vim.cmd('colorscheme ' .. config.dark_theme)
  else
    vim.cmd 'set background=light'
    vim.cmd('colorscheme ' .. config.light_theme)
  end
end

return M
