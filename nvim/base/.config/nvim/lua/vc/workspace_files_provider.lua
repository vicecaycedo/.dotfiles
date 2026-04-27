---@class vc.WorkspaceFilesProvider
---@field match fun(): boolean
---@field run fun()

local M = {}

---@type vc.WorkspaceFilesProvider[]
local providers = {}

---@param provider vc.WorkspaceFilesProvider
M.register = function(provider)
  table.insert(providers, provider)
end

---@return vc.WorkspaceFilesProvider|nil
M.pick = function()
  for _, provider in ipairs(providers) do
    local ok, matched = pcall(provider.match)
    if ok and matched then
      return provider
    end
  end
end

return M
