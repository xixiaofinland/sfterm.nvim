local Term = require "sfterm.terminal"
local t = Term:new()
local U = require "sfterm.util"

local M = {}

function M.toggle()
  t:toggle()
end

function M.push()
  local cmd = U.expand_cmd('sf project deploy start  -m % ') .. U.get_target_org()
  t:run(cmd)
end

function M.retrieve()
  local cmd = U.expand_cmd('sf project retrieve start  -m % ') .. U.get_target_org()
  t:run(cmd)
end

function M.run(c)
  local cmd = U.expand_cmd(c)
  t:run(cmd)
end

return M
