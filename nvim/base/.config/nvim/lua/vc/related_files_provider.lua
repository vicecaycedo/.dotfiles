---@class vc.RelatedFilesProvider
---@field match fun(): boolean
---@field run fun()

local M = {}

---@type vc.RelatedFilesProvider[]
local providers = {}

---@param provider vc.RelatedFilesProvider
M.register = function(provider)
  table.insert(providers, provider)
end

---@return vc.RelatedFilesProvider|nil
M.pick = function()
  for _, provider in ipairs(providers) do
    local ok, matched = pcall(provider.match)
    if ok and matched then
      return provider
    end
  end
end

return M
