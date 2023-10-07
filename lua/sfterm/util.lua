local O = require "sforg"
local U = {}
local fn = vim.fn

function U.get_target_org()
  if O == nil or O.get_target_org() == nil then
    return ''
  end

  return '-o ' .. O.get_target_org()
end

function U.expand_cmd(cmd)
  return fn.expandcmd(cmd)
end

---@alias Command string|string[]

---@class Dimensions - Every field inside the dimensions should be b/w `0` to `1`
---@field height number: Height of the floating window (default: `0.8`)
---@field width number: Width of the floating window (default: `0.8`)
---@field x number: X-Axis of the floating window (default: `0.5`)
---@field y number: Y-Axis of the floating window (default: `0.5`)

---@class Config
---@field ft string: Filetype of the terminal buffer (default: `SFTerm`)
---@field cmd Command: Command to run inside the terminal (default: `os.getenv('SHELL'`))
---@field border string: Border type for the floating window. See `:h nvim_open_win` (default: `single`)
---@field auto_close boolean: Close the terminal as soon as command exits (default: `true`)
---@field hl string: Highlight group for the terminal buffer (default: `true`)
---@field blend number: Transparency of the floating window (default: `true`)
---@field clear_env boolean: Replace instead of extend the current environment with `env` (default: `false`)
---@field env table: Map of environment variables extending the current environment (default: `nil`)
---@field on_exit function: Callback invoked when the terminal exits (default: `nil`)
---@field on_stdout function: Callback invoked when the terminal emits stdout data (default: `nil`)
---@field on_stderr function: Callback invoked when the terminal emits stderr data (default: `nil`)
---@field dimensions Dimensions: Dimensions of the floating window

---@type Config
U.defaults = {
  ft = 'SFTerm',
  cmd = function()
    return assert(
      os.getenv('SHELL') | 'ls -la',
      '[SFTerm] $SHELL is not present! Please provide a shell (`config.cmd`) to use.'
    )
  end,
  border = 'single',
  auto_close = true,
  hl = 'Normal',
  blend = 0,
  clear_env = false,
  dimensions = {
    height = 0.4,
    width = 0.8,
    x = 0.5,
    y = 0.9,
  },
}

---Create terminal dimension relative to the viewport
---@param opts Dimensions
---@return table
function U.get_dimension(opts)
  -- get lines and columns
  local cl = vim.o.columns
  local ln = vim.o.lines

  -- calculate our floating window size
  local width = math.ceil(cl * opts.width)
  local height = math.ceil(ln * opts.height - 4)

  -- and its starting position
  local col = math.ceil((cl - width) * opts.x)
  local row = math.ceil((ln - height) * opts.y - 1)

  return {
    width = width,
    height = height,
    col = col,
    row = row,
  }
end

---Check whether the window is valid
---@param win number Window ID
---@return boolean
function U.is_win_valid(win)
  return win and vim.api.nvim_win_is_valid(win)
end

---Check whether the buffer is valid
---@param buf number Buffer ID
---@return boolean
function U.is_buf_valid(buf)
  return buf and vim.api.nvim_buf_is_loaded(buf)
end

---Creates a valid command from user's input
---@param cmd Command
---@return Command
function U.is_cmd(cmd)
  return type(cmd) == 'function' and cmd() or cmd
end

return U
