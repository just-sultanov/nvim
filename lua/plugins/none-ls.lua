-- None-ls

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    { "AstroNvim/astrolsp", opts = {} },
  },
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.diagnostics.clj_kondo,
      null_ls.builtins.diagnostics.ltrs,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.cljstyle,
      -- null_ls.builtins.formatting.pg_format,
      -- A high-speed SQL linter written in Rust.
      null_ls.builtins.diagnostics.sqruff,
    }

    config.on_attach = require("astrolsp").on_attach

    return config
  end,
}
