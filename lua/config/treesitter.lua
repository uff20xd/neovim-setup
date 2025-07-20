local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter not found!", vim.log.levels.ERROR)
  return
end

ts.setup {
  ensure_installed = {
    "c", "lua", "python",
    "javascript", "html", "css", "rust", "zig",
    "haskell", "nix", "cpp", "markdown", "commonlisp",
    "latex", "php", "asm", "gitcommit", "gitignore", "json", "bash",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  -- add more modules here if you like:
  -- playground = { enable = true },
  autopairs  = { enable = true },
}
