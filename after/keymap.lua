vim.g.mapleader = " "

--normal mode keybinds
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })  -- Save file
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })  -- Quit Neovim
vim.keymap.set('n', '<leader>e', ':e .<CR>', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', '<leader>t', ':terminal <CR>', { noremap = true, silent = true })  -- Open file explorer
vim.keymap.set('n', '<leader>bf', ':b ', { noremap = true, silent = false})  -- Open file explorer
vim.keymap.set('n', '<leader>bd', ':bdelete <CR>', { noremap = true, silent = false})  -- Open file explorer
vim.keymap.set('n', '<leader>ba', ':badd ', { noremap = true, silent = false})  -- Open file explorer
vim.keymap.set('n', '<M-h>', ':wincmd h<CR> ', { noremap = true, silent = true})  -- Open file explorer
vim.keymap.set('n', '<M-j>', ':wincmd j<CR> ', { noremap = true, silent = true})  -- Open file explorer
vim.keymap.set('n', '<M-k>', ':wincmd k<CR> ', { noremap = true, silent = true})  -- Open file explorer
vim.keymap.set('n', '<M-l>', ':wincmd l<CR> ', { noremap = true, silent = true})  -- Open file explorer

--insert mode keybinds
vim.keymap.set("i", "<C-h>", "<", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", ">", { noremap = true, silent = true })

--terminal mode keybinds
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
