local Term = require "sfterm.terminal"
local t = Term:new()
local o = require "sforg"

local M = {}

function M.toggle()
  t:toggle()
end

function M.deploy()
  if o.target_org == nil then
    return o.setTargetOrg()
  end

  local cmd = 'sf project deploy start  --source-dir "%" --target-org ' .. o.target_org
  t:run(cmd)
end

function M.retrieve()
  if o.target_org == nil then
    return o.setTargetOrg()
  end

  local cmd = 'sf project retrieve start  --source-dir "%" --target-org ' .. o.target_org
  t:run(cmd)
end
return M
