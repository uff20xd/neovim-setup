vim.keymap.set('n', '<leader>ff', ":Telescope find_files <CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', ":Telescope git_files<CR>", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', ":Telescope current_buffer_fuzzy_find<CR>", { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', ":Telescope buffers<CR>", { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', ":Telescope grep_string<CR>", { desc = 'Telescope help tags' })

