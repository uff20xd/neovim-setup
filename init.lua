local use_optional_plugins = false;

---------------------------------------------------------------------------
-- Setup Plugin Paths
---------------------------------------------------------------------------
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

---------------------------------------------------------------------------
-- Config
---------------------------------------------------------------------------
vim.opt.encoding = 'utf-8'

-- Basic
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 11
vim.opt.winborder = "single"

-- Indent
vim.opt.breakindent = true
vim.opt.autoindent = true
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
vim.opt.hlsearch = false
vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true
vim.cmd("set completeopt+=noselect")

-- Miscelaneas (too lazy to google the spelling)
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.conceallevel = 0
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.showmode = true
vim.opt.lazyredraw = true
vim.opt.cmdheight = 1
vim.opt.showmatch = true
vim.opt.splitright = true
vim.o.background = "dark"
vim.cmd.colorscheme("yugener")

-- File Things
vim.opt.swapfile = false
vim.opt.path:append("**")
vim.opt.modifiable = true
vim.opt.autoread = true
vim.opt.autowrite = false

-- Optimizations
vim.opt.updatetime = 200
vim.opt.timeoutlen = 500


-- Clipboard
vim.cmd("set clipboard+=unnamedplus")

-- Custom Commands
vim.api.nvim_create_user_command("Make",
  function(opts)
    vim.cmd("!make" .. opts.fargs[1])
  end
  ,{nargs = 1})

-- vim.api.nvim_create_user_command("RR",
--   function()
--     vim.cmd("noautocmd vnew | terminal ./build")
--   end
--   ,{})


---------------------------------------------------------------------------
-- Keymaps
---------------------------------------------------------------------------
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })  -- Save file
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })  -- Quit Neovim
vim.keymap.set('n', '<leader>e', ':e .<CR>', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', '<leader>t', ':terminal <CR>', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', '<leader>bd', ':bdelete! <CR>', { noremap = true, silent = true})  -- Closes a buffer
-- vim.keymap.set('n', '<Tab>', ':bnext<CR> ', { noremap = true, silent = true})  -- Moving between buffer
-- vim.keymap.set('n', '<S-Tab>', ':bprevious<CR> ', { noremap = true, silent = true})  -- Moving between buffer
vim.keymap.set('n', '<leader>sv', ':vsplit<CR> ', { noremap = true, silent = true})  -- Splits vertically
vim.keymap.set('n', '<leader>sh', ':split<CR> ', { noremap = true, silent = true})  -- Splits horizontally
vim.keymap.set('n', '<leader>sd', ':wincmd q<CR> ', { noremap = true, silent = true})  -- closes split
vim.keymap.set('n', '<leader>st', 'noautocmd vnew | terminal ', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', 'Y', 'yy', { noremap = true, silent = true})  -- Yanks rest of the line

vim.keymap.set("i", "<C-j>", "<", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", ">", { noremap = true, silent = true })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

---------------------------------------------------------------------------
-- Netwr Config
---------------------------------------------------------------------------

local function Path()
  -- local path = vim.fn.expand('%:~:.') -- Relative
  local path = vim.fn.expand('%:~') -- Absolute
  return '%#StatusLine# ' .. path
end

WinBarNetRW = function()
  return table.concat {
  Path(),
  "%=",
  "%<",
  }
end

vim.api.nvim_create_augroup('netrw', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'netrw',
  pattern = 'netrw',
  callback = function()
    vim.api.nvim_command('setlocal buftype=nofile')
    vim.api.nvim_command('setlocal bufhidden=wipe')
    vim.opt_local.winbar = '%!v:lua.WinBarNetRW()'
    vim.keymap.set('n', '<C-C>', '<CMD>ToggleNetRW<CR>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('n', '<leader>e', '<CMD>ToggleNetRW<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'e', '<CMD>Ex ~<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'w', '<CMD>Ex ' .. vim.fn.getcwd() .. '<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'h', '-', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'l', '<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'r', 'R', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'c', ':cd %<CR>', { remap = true, silent = true, buffer = true })
    local unbinds = {
      'a', '<F1>', '<del>', '<c-h>', '<c-r>', '<c-tab>', 'C', 'gb', 'gd', 'gf', 'gn', 'gp','i','I', 'mb', 'md',
      'me', 'mg', 'mh', 'mr', 'mt', 'mT', 'mu', 'mv', 'mX', 'mz', 'o', 'O', 'p', 'P', 'qb', 'qf', 'qF',
      'qL', 'S', 't', 'u', 'U',  'X'
    }
    for _, value in pairs(unbinds) do
      vim.keymap.set('n', value, '<CMD>lua print("Keybind \'' .. value .. '\' has been removed")<CR>', { noremap = true, silent = true, buffer = true })
    end
  end
})

vim.g.netrw_banner = 2
vim.g.netrw_liststyle = 1
vim.g.netrw_bufsettings = 'nonu nornu noma ro nobl'
vim.g.netrw_browse_split = 0 -- (4 to open in other window)
vim.g.netrw_altfile = 0 -- (4 to open in other window)
vim.g.netrw_special_syntax = 3
vim.g.netrw_sort_by = 'exten'

---------------------------------------------------------------------------
-- LSP
--------------------------------------------------------------------------
vim.lsp.enable({"lua_ls", "nixd", "pylsp", "phpactor"})
vim.lsp.config("nixd", {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', 'git' },
})
vim.lsp.config("lua_ls", {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
})

vim.lsp.config("pylsp", {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_dir = function(fname)
      local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
      }
      return util.root_pattern(unpack(root_files))(fname)
        or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
    end,
    single_file_support = true,
})

vim.lsp.enable("phpactor")
vim.lsp.config("phpactor", {
  cmd = { 'phpactor' },
  filetypes = { 'php' },
  root_markers = {
    'composer.json',
    '.phpactor.json',
    '.phpactor.yml',
    '.git',
  },
});
api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
    end
  end
})

---------------------------------------------------------------------------
-- Plugin Imports
---------------------------------------------------------------------------
if use_optional_plugins then
  vim.pack.add({
    {src = "https://github.com/nvim-lua/plenary.nvim"},
    {src = "https://github.com/Massolari/neoment"},
  })
  require "config.neoment"
end
require "config.treesitter"
require "config.mini"
require "config.vimtex"
require "emsym".setup()
