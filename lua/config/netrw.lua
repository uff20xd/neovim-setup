function ToggleNetRW()
  if vim.bo.filetype == 'netrw' then
    vim.api.nvim_command('Rex')
    if vim.bo.filetype == 'netrw' then
      vim.api.nvim_command('bdel')
    end
  else
    vim.api.nvim_command('Ex')
  end
end

vim.api.nvim_command('command! ToggleNetRW lua ToggleNetRW()')

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

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1
vim.g.netrw_bufsettings = 'nonu nornu noma ro nobl'
vim.g.netrw_browse_split = 0 -- (4 to open in other window)
vim.g.netrw_altfile = 0 -- (4 to open in other window)
vim.g.netrw_special_syntax = 3
