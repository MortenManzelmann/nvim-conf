local M = {}
local remap = vim.api.nvim_set_keymap

---@param packageName string
---@return nil
function M.saveRequire(packageName)
  local status_ok, package = pcall(require, packageName)
  if not status_ok then
    return nil
  end
  return package
end

local Mode = {
    normal = "n",
    insert = "i",
    visual = "v",
}

---comment
---@param mode string
---@param key string
---@param result any
function M.keyMapper(mode, key, result)
  remap(mode, key, result, { noremap = true, silent = true })
end

---@param key string
---@param result any
function M.insertModeRemap(key, result)
  M.keyMapper(Mode.insert, key, result)
end

---@param kky string
---@param result any
function M.normalModeRemap(key, result)
  M.keyMapper(Mode.normal, key, result)
end

---@param key string
---@param result any
function M.visualModeRemap(key, result)
  M.keyMapper(Mode.visual, key, result)
end

return M
