local Emsym = {}

Emsym.catching = {}

Emsym.catching["Alpha"] = "Α"
Emsym.catching["alpha"] = "α"
Emsym.catching["Beta"] = "Β"
Emsym.catching["beta"] = "β"
Emsym.catching["Gamma"] = "Γ"
Emsym.catching["gamma"] = "γ"
Emsym.catching["Delta"] = "Δ"
Emsym.catching["delta"] = "δ"
Emsym.catching["Epsilon"] = "Ε"
Emsym.catching["epsilon"] = "ε"
Emsym.catching["Zeta"] = "Ζ"
Emsym.catching["zeta"] = "ζ"
Emsym.catching[".Eta"] = "Η"
Emsym.catching[".eta"] = "η"
Emsym.catching["Theta"] = "Θ"
Emsym.catching["theta"] = "θ"
Emsym.catching["Iota"] = "Ι"
Emsym.catching["iota"] = "ι"
Emsym.catching["Kappa"] = "Κ"
Emsym.catching["kappa"] = "κ"
Emsym.catching["Lambda"] = "Λ"
Emsym.catching["lambda"] = "λ"
Emsym.catching["Mu"] = "Μ"
Emsym.catching["mu"] = "μ"
Emsym.catching["Nu"] = "Ν"
Emsym.catching["nu"] = "ν"
Emsym.catching["Xi"] = "Ξ"
Emsym.catching["xi"] = "ξ"
Emsym.catching["Omicrom"] = "Ο"
Emsym.catching["omicron"] = "ο"
Emsym.catching["Pi"] = "Π"
Emsym.catching["pi"] = "π"
Emsym.catching["Rho"] = "Ρ"
Emsym.catching["rho"] = "ρ"
Emsym.catching["Sigma"] = "Σ"
Emsym.catching["sigma"] = "σ"
Emsym.catching["sigma2"] = "ς"
Emsym.catching["Tau"] = "Τ"
Emsym.catching["tau"] = "τ"
Emsym.catching["Upsilon"] = "Υ"
Emsym.catching["upsilon"] = "υ"
Emsym.catching["Phi"] = "Φ"
Emsym.catching["phi"] = "φ"
Emsym.catching["Chi"] = "Χ"
Emsym.catching["chi"] = "χ"
Emsym.catching["Psi"] = "Ψ"
Emsym.catching["psi"] = "ψ"
Emsym.catching["Omega"] = "Ω"
Emsym.catching["omega"] = "ω"

Emsym.catching["integral"]= "∫"
Emsym.catching["subset_of"] = "⊆"
Emsym.catching["superset_of"] = "⊇"
Emsym.catching["not_subset_of"] = "⊈"
Emsym.catching["not_superset_of"] = "⊉"
Emsym.catching["element"] = "∈"
Emsym.catching["union"] = "⋃"
Emsym.catching["intersection"] = "⋃"
Emsym.catching["concat"] = "∘"


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
