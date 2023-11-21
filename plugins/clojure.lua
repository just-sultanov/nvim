local utils = require "astronvim.utils"
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clojure_lsp") end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "clojure")
      end
    end,
  },
  {
    "Olical/conjure",
    ft = { "clojure" },
    init = function()
      vim.g["conjure#log#hud#width"] = 1
      vim.g["conjure#log#hud#enabled"] = false
      vim.g["conjure#log#hud#anchor"] = "SE"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#extract#context_header_lines"] = 130
      vim.g["conjure#eval#comment_prefix"] = ";; "
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
      vim.g["conjure#mapping#doc_word"] = "gk"
      vim.g["conjure#eval#result_register"] = "*"

      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function() vim.diagnostic.disable(0) end,
        desc = "Conjure Log disable LSP diagnostics",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
        pattern = { "clojure" },
        callback = function() vim.bo.commentstring = ";; %s" end,
        desc = "Lisp style line comment",
      })
    end,
  },
  {
    "Olical/AnsiEsc",
  },
  {
    "clojure-vim/vim-jack-in",
    ft = { "clojure" },
    cmd = "Clj",
  },
}
