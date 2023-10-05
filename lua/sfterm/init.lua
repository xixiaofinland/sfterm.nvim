local Term = require "sfterm.terminal"
local t = Term:new()
local U = require "sfterm.util"

local M = {}

function M.toggle()
  t:toggle()
end

function M.push()
  local cmd = U.expand_cmd('sf project deploy start  --source-dir % ') .. U.get_target_org()
  t:run(cmd)
end

function M.retrieve()
  local cmd = U.expand_cmd('sf project retrieve start  --source-dir % ') .. U.get_target_org()
  t:run(cmd)
end

return M
