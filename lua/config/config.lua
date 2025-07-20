vim.opt.encoding = 'utf-8'

-- Basic
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 11

-- Indent
vim.opt.breakindent = true
vim.opt.autoindent = true
--vim.opt.smarttab = true            
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.linebreak = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2


-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wildmode = "full"
vim.opt.wildmenu = true

-- Miscelaneas (too lazy to google the spelling)
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.conceallevel = 0
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.cmdheight = 1
vim.opt.showmatch = true
vim.opt.splitright = true

-- File Things
vim.opt.swapfile = false
vim.opt.path:append("**")
vim.opt.modifiable = true
vim.opt.autoread = true
vim.opt.autowrite = false

-- Optimizations
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Compilation
vim.opt.makeprg = "rustc build.rs && ./build"

-- Clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Custom Commands
vim.api.nvim_create_user_command("HH",
  function(opts)
    vim.cmd("noautocmd vnew | terminal " .. opts.fargs[1])
  end
  ,{nargs = 1})

vim.api.nvim_create_user_command("RR",
  function()
    vim.cmd("noautocmd vnew | terminal ./build")
  end
  ,{})
