local custom_path = "~/.config/nvim/?.lua;~/.config/nvim/?/init.lua"
package.path = package.path .. ";" .. custom_path

local custom_path = "~/.config/nvim/?.so"
package.cpath = package.path .. ";" .. custom_path
test = function() 
	print("works")
end
require("after.config")
