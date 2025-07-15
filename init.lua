local home_dir = vim.env.HOME

local fn  = vim.fn
local api = vim.api

local config_root = fn.stdpath("config")
local lua_paths = {
  config_root .. "/lua/?.lua",
  config_root .. "/lua/?/init.lua",
}

-- 2) Scan & prepend every `lua/` folder under 'runtimepath'
local rp = api.nvim_list_runtime_paths()
for _, path in ipairs(rp) do
  -- if there's a lua/ subfolder, add it
  local lua_dir = path .. "/lua"
  if fn.isdirectory(lua_dir) == 1 then
    table.insert(lua_paths, 1, lua_dir .. "/?.lua")
    table.insert(lua_paths, 1, lua_dir .. "/?/init.lua")
  end
end

-- 3) Build the new package.path
package.path = table.concat(lua_paths, ";") .. ";" .. package.path

require("config.keymap")
require("config.config")
require("config.autopairs")
require("config.treesitter")
require("config.color")
require("config.telescope")
require("config.rustaceanvim")
require("config.netrw")
require("config.lsp")
