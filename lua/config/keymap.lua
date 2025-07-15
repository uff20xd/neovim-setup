vim.g.mapleader = " "

--all mode keybinds
vim.keymap.set( "n",'<C-l>', '<CR>', { noremap = false, silent = true })  -- Enter press for netrw
vim.keymap.set( "n", '<C-h>', '-', { noremap = false, silent = true })  -- Minus press for netrw

--normal mode keybinds
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })  -- Save file
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })  -- Quit Neovim
vim.keymap.set('n', '<leader>e', ':e .<CR>', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', '<leader>t', ':terminal <CR>', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', '<leader>bf', ':b ', { noremap = true, silent = false})  -- Maybe finds a buffer
vim.keymap.set('n', '<leader>bd', ':bdelete <CR>', { noremap = true, silent = true})  -- Closes a buffer
vim.keymap.set('n', '<leader>ba', ':bnew ', { noremap = true, silent = false})  -- Adds a new buffer
-- vim.keymap.set('n', '<M-h>', ':wincmd h<CR> ', { noremap = true, silent = true})  -- Moving between windows
-- vim.keymap.set('n', '<M-j>', ':wincmd j<CR> ', { noremap = true, silent = true})  -- Moving between windows
-- vim.keymap.set('n', '<M-k>', ':wincmd k<CR> ', { noremap = true, silent = true})  -- Moving between windows
-- vim.keymap.set('n', '<M-l>', ':wincmd l<CR> ', { noremap = true, silent = true})  -- Moving between windows

vim.keymap.set('n', '<M-k>', ':wincmd k<CR> ', { noremap = true, silent = true})  -- Moving between windows
vim.keymap.set('n', '<M-l>', ':wincmd l<CR> ', { noremap = true, silent = true})  -- Moving between windows

vim.keymap.set('n', '<Tab>', ':bnext<CR> ', { noremap = true, silent = true})  -- Moving between buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR> ', { noremap = true, silent = true})  -- Moving between buffer

vim.keymap.set('n', '<leader>sv', ':vsplit<CR> ', { noremap = true, silent = true})  -- Splits vertically
vim.keymap.set('n', '<leader>sh', ':split<CR> ', { noremap = true, silent = true})  -- Splits horizontally
vim.keymap.set('n', '<leader>sd', ':wincmd q<CR> ', { noremap = true, silent = true})  -- closes split


vim.keymap.set('n', 'Y', 'y$', { noremap = true, silent = true})  -- Yanks rest of the line


--insert mode keybinds
vim.keymap.set("i", "<C-j>", "<", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", ">", { noremap = true, silent = true })
vim.keymap.set("", "Ö", ":", { noremap = true, silent = false })

--terminal mode keybinds
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
