vim.opt.encoding = 'utf-8'          
vim.opt.tabstop = 4                 
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.undofile = true            
vim.opt.undolevels = 10000

vim.opt.number = true               
vim.opt.relativenumber = true       
vim.opt.linebreak = true       
vim.opt.expandtab = true            
vim.opt.breakindent = true            
vim.opt.cursorline = true            
vim.opt.scrolloff = 8
vim.opt.smarttab = true            
vim.opt.conceallevel = 1
vim.opt.smarttab = true            
vim.opt.ruler = true            
vim.opt.wrap = true
vim.opt.makeprg = "rustc build.rs && ./build"

vim.cmd("syntax on")
vim.cmd("set clipboard=\"unnamedplus\"")
