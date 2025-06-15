local home_dir = vim.env.HOME;

vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/pack/treesitter/start/nvim-treesitter")

--local custom_path = home_dir .. "/.config/nvim/?.lua;" .. home_dir .. "/.config/nvim/?/init.lua;?.lua;?/init.lua" 
--package.path = package.path .. ";" .. custom_path

--local custom_path = home_dir .. "/.config/nvim/plugin/?.lua;" .. home_dir .. "/.config/nvim/plugin/?/init.lua"
--package.path = package.path .. ";" .. custom_path

--local custom_path = home_dir .. "/.config/nvim/plugin/nvim-treesitter/lua/?.lua" 
--package.path = package.path .. ";" .. custom_path

--local custom_path = home_dir .. "/.config/nvim/plugin/?/plugin/?.lua"
--package.path = package.path .. ";" .. custom_path

--local custom_path = home_dir .. "/.config/nvim/?.so"
--package.cpath = package.path .. ";" .. custom_path


require("after.config")
require("after.keymap")
