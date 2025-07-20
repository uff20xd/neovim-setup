vim.lsp.enable("nixd")
vim.lsp.config("nixd", {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', 'git' },
})
vim.lsp.enable("lua_ls")
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

vim.lsp.enable("phpactor");
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

--vim.lsp.enable("rust-analyzer")
--vim.lsp.config("rust-analyzer", {
--  cmd = { "rust-analyzer" },
--  filetypes = {"rust"},
--  single_file_support = true,
--})
