-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- SQL
      null_ls.builtins.diagnostics.sqruff,
      null_ls.builtins.formatting.sqruff,

      -- Clojure
      null_ls.builtins.diagnostics.clj_kondo,
      null_ls.builtins.formatting.cljstyle,

      -- Lua
      null_ls.builtins.formatting.stylua,

      -- JS/Markdown/etc
      null_ls.builtins.formatting.prettier,

      -- Swift
      null_ls.builtins.diagnostics.swiftlint,
      null_ls.builtins.formatting.swiftformat, -- https://github.com/nicklockwood/SwiftFormat
      -- null_ls.builtins.formatting.swift_format, -- https://github.com/apple/swift-format
    })
  end,
}
