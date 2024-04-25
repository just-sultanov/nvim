-- Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "clojure",
        "http",
        "json",
        "lua",
        "vim",
      })
    end,
  },
  { "nvim-treesitter/playground", event = "BufRead" },
}
