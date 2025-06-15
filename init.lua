local home_dir = vim.env.HOME;
print(home_dir)
local custom_path = home_dir .. "/.config/nvim/?.lua;" .. home_dir .. "/.config/nvim/?/init.lua;./?.lua;./?/init.lua"
package.path = package.path .. ";" .. custom_path

local custom_path = home_dir .. "/.config/nvim/?.so"
package.cpath = package.path .. ";" .. custom_path


require("after.config")
require("after.keymap")
