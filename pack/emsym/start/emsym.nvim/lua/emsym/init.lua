local Emsym = {}

Emsym.catching = {}

Emsym.catching["sigma"] = "𝚺"
Emsym.catching["epsilon"] = "ε"
Emsym.catching["^1"] = "¹"
Emsym.catching["^2"] = "²"
Emsym.catching["^3"] = "³"
Emsym.catching["^4"] = "⁴"
Emsym.catching["^5"] = "⁵"
Emsym.catching["^6"] = "⁶"
Emsym.catching["^7"] = "⁷"
Emsym.catching["^8"] = "⁸"
Emsym.catching["^9"] = "⁹"
Emsym.catching["^n"] = "ⁿ"
Emsym.catching["^+"] = "⁺"
Emsym.catching["^-"] = "⁻"
Emsym.catching["^i"] = "ⁱ"
Emsym.catching["sub0"] = "₀"
Emsym.catching["pi"] = "π"
Emsym.catching["theta"] = "θ"

Emsym.catcher = function()
  local api = vim.api
  local win = api.nvim_get_current_win()
  local buf = api.nvim_get_current_buf()
  local line = api.nvim_get_current_line()
  local pos = api.nvim_win_get_cursor(win)
  local pointer = pos[2] + 1
  while(true) do
    if Emsym.catching[string.sub(line, pointer, pos[2] + 1)] ~= Nil then
      api.nvim_buf_set_text(buf, pos[1] - 1, pointer - 1, pos[1] - 1, pos[2] + 1, {Emsym.catching[string.sub(line, pointer, pos[2] + 1)]})
      break
    end
    pointer = pointer - 1
    if pointer < 1 then
      break
    end
  end
end

Emsym.setup = function()
  vim.keymap.set('n', '<leader>ms', Emsym.catcher, { noremap = true, silent = true})
end
--vim.keymap.set('i', '<C-b>', Emsym.catcher, { noremap = true, silent = true})

return Emsym
