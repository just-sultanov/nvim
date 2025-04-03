-- Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "clojure",
        "http",
        "json",
        "lua",
        "vim",
      },
    },
  },
  { "nvim-treesitter/playground", event = "BufRead" },
}
