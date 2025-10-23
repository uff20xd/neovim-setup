api = vim.api

win = api.nvim_get_current_win()

print(api.nvim_win_get_cursor(win))

catching = {}

catching["sigma"] = "𝚺"
catching["epsilon"] = "ε"
catching["^1"] = "¹"
catching["^2"] = "²"
catching["^3"] = "³"
catching["^4"] = "⁴"
catching["^5"] = "⁵"
catching["^6"] = "⁶"
catching["^7"] = "⁷"
catching["^8"] = "⁸"
catching["^9"] = "⁹"
catching["^n"] = "ⁿ"
catching["^+"] = "⁺"
catching["^-"] = "⁻"
catching["^i"] = "ⁱ"
catching["sub0"] = "₀"
catching["pi"] = "π"
catching["theta"] = "θ"

catcher = function()
  win = api.nvim_get_current_win()
  buf = api.nvim_get_current_buf()
  line = api.nvim_get_current_line()
  pos = api.nvim_win_get_cursor(win)
  pointer = pos[2] + 1
  while(true) do
    if catching[string.sub(line, pointer, pos[2] + 1)] ~= Nil then
      api.nvim_buf_set_text(buf, pos[1] - 1, pointer - 1, pos[1] - 1, pos[2] + 1, {catching[string.sub(line, pointer, pos[2] + 1)]})
      break
    end
    pointer = pointer - 1
    if pointer < 1 then
      break
    end
  end
end

vim.keymap.set('n', '<leader>ms', catcher, { noremap = true, silent = true})
vim.keymap.set('i', '<C-b>', catcher, { noremap = true, silent = true})

