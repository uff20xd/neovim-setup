require "mini.pick".setup()
require 'mini.icons'.setup()
require 'mini.pairs'.setup()

-- require('mini.ai').setup()

vim.keymap.set('n', '<leader>bf', ':Pick buffers<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<leader>f', ':Pick files<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<leader>h', ':Pick help<CR>', { noremap = true, silent = true})
