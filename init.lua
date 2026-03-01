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

vim.opt.encoding = 'utf-8'

---------------------------------------------------------------------------
-- Config
---------------------------------------------------------------------------

-- Basic
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 11
vim.opt.winborder = "single"
vim.cmd("filetype plugin on")

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
vim.opt.wildmode = "noselect:full"
vim.opt.wildmenu = true
vim.cmd("set completeopt+=noselect")

-- Miscelaneas (too lazy to google the spelling)
vim.g.markdown_minlines = 500
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'rust', 'c', 'cpp', 'nix'}
vim.g.markdown_recommended_style = 1
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.conceallevel = 0
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.showmode = true
vim.opt.lazyredraw = false
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

local km = function(mode, trigger, action, config)
  vim.keymap.set(mode, trigger, action, config)
end

km('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })  -- Save file
km('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })  -- Quit Neovim
km('n', '<leader>e', ':e .<CR>', { noremap = true, silent = true })  -- Open file explorer
km('n', '<leader>t', ':terminal <CR>', { noremap = false, silent = true })  -- Open file explorer
km('n', '<leader>bd', ':bdelete! <CR>', { noremap = true, silent = true})  -- Closes a buffer
km('n', 'Y', 'y$', { noremap = true, silent = true})  -- Yanks rest of the line
km('n', '<leader>xt', vim.treesitter.start, { noremap = true, silent = true})  -- Yanks rest of the line
km({"i", "n"}, "<C-j>", "<", { noremap = true, silent = true })
km({"i", "n"}, "<C-k>", ">", { noremap = true, silent = true })
km("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

---------------------------------------------------------------------------
-- Autocommands
---------------------------------------------------------------------------
-- local au = function(event, pattern, callback, desc)
--   vim.api.nvim_create_autocmd(event, { group = gr, pattern = pattern, callback = callback, desc = desc })
-- end
-- au("BufEnter", "*.rs", vim.treesitter.start, "Activete treesitter for Rust files")

-- local trigger_wild = function()
--   -- Not triggerring when wildmenu is shown helps avoiding trigger after
--   -- manually pressing wildchar (as text is also changes).
--   if vim.fn.wildmenumode() == 1 then return end
--   -- Type `<C-z>` which is "Trigger 'wildmode', but always available."
--   vim.api.nvim_feedkeys('\26', 'nt', false)
-- end
-- au('CmdlineEnter', '*', trigger_wild, 'Act on command line enter')
-- au('CmdlineChanged', '*', trigger_wild, 'Act on command line change')
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
    vim.keymap.set('n', 'e', '<CMD>Ex ~<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'w', '<CMD>Ex ' .. vim.fn.getcwd() .. '<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'h', '-', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'l', '<CR>', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'r', 'R', { remap = true, silent = true, buffer = true })
    vim.keymap.set('n', 'c', ':cd %<CR>', { remap = true, silent = true, buffer = true })
    local _none = {
      '<c-h>', 'a', 'C', 'gp', 'mf', 'mb', 'mB', 'mz', 'gb', 'qb', 'gn', 'mt', 'mT', 'md', 'me', 'cb', 'mr',
    }

    local unbinds = {
      '<F1>', '<del>', '<c-r>', '<c-tab>', 'gd', 'gf', 'I', 'mx',
      'mg', 'mh', 'mu', 'mv', 'mX', 'o', 'O', 'p', 'P',  'qf', 'qF',
      'qL', 'S', 't', 'u', 'U',  'X', 's',
    }
    for _, value in pairs(unbinds) do
      vim.keymap.set('n', value, '<CMD>lua print("Keybind \'' .. value .. '\' has been removed")<CR>', { noremap = true, silent = true, buffer = true })
    end
  end
})

vim.g.netrw_banner = 2
vim.g.netrw_liststyle = 1
-- vim.g.netrw_preview = 1
vim.g.netrw_bufsettings = 'nonu nornu noma ro nobl'
vim.g.netrw_browse_split = 0 -- (4 to open in other window)
vim.g.netrw_altfile = 0 -- (4 to open in other window)
vim.g.netrw_special_syntax = 3
vim.g.netrw_sort_by = 'exten'

---------------------------------------------------------------------------
-- LSP
---------------------------------------------------------------------------
vim.lsp.enable({"lua_ls", "nixd", "pylsp", "phpactor", "marksman", "haskell-language-server"})
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

-- api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
--     end
--   end
-- })

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
-- autocmd for cmd
-- vim.schedule
-- vim.fn.wildtrigger()
require "config.vimtex"
require "plugins.emsym"
require "postcmd".with_keymaps()
require "plugins.icons"
require "plugins.pairs".setup({})
require "plugins.git".setup({})
require "plugins.cmdline".setup({autocorrect = {enable = false}})
require "plugins.completion".setup({})
local treesitter = require "nvim-treesitter"
local mini_pick = require "plugins.pick"
if treesitter then
  treesitter.setup()
  treesitter.install { "rust", "zig", "markdown", "asm", "python", "haskell" }
end
if mini_pick then
  mini_pick.setup()
  vim.keymap.set('n', '<leader>bf', ':Pick buffers<CR>', { noremap = true, silent = true})
  vim.keymap.set('n', '<leader>f', ':Pick files<CR>', { noremap = true, silent = true})
  vim.keymap.set('n', '<leader>h', ':Pick help<CR>', { noremap = true, silent = true})
end
