vim.lsp.enable("nixd")
vim.lsp.config("nixd", {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', 'git' },
  
})

--vim.lsp.enable("rust-analyzer")
--vim.lsp.config("rust-analyzer", {
--  cmd = { "rust-analyzer" },
--  filetypes = {"rust"},
--  single_file_support = true,
--})
