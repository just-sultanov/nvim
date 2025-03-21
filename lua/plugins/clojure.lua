-- Clojure

local function clerk_show()
  local form = '(nextjournal.clerk/show! "' .. vim.fn.expand "%" .. '")'
  vim.cmd("ConjureEval" .. form)
end

local function set_clj_test_runner() vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure" end
local function set_cljs_test_runner() vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojurescript" end
local function set_kaocha_test_runner() vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha" end

---@type LazySpec
return {
  {
    "Olical/conjure",
    branch = "main",
    ft = { "clojure" },
    keys = {
      { "<localleader>cs", clerk_show, desc = "Clerk Show" },
      { "<localleader>trC", set_clj_test_runner, desc = "Set `clojure.test` as test runner" },
      { "<localleader>trS", set_cljs_test_runner, desc = "Set `clojurescript.test` as test runner" },
      { "<localleader>trK", set_kaocha_test_runner, desc = "Set `kaocha` as test runner" },
    },
    init = function()
      vim.g["conjure#log#hud#width"] = 1
      vim.g["conjure#log#hud#enabled"] = false
      vim.g["conjure#log#hud#anchor"] = "SE"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#extract#context_header_lines"] = 130
      vim.g["conjure#eval#comment_prefix"] = ";; "
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
      vim.g["conjure#mapping#doc_word"] = { "gk" }
      vim.g["conjure#eval#result_register"] = "*"

      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function() vim.diagnostic.enable(false) end,
        desc = "Conjure Log disable LSP diagnostics",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
        pattern = { "clojure" },
        callback = function() vim.bo.commentstring = ";; %s" end,
        desc = "Lisp style line comment",
      })

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("clojure_filetype", { clear = true }),
        pattern = { ".cljstyle", ".cljfmt", "*.jank" },
        callback = function() vim.cmd [[set ft=clojure]] end,
        desc = "Read configs as clojure",
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
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure" },
    config = function()
      local paredit = require "nvim-paredit"
      paredit.setup {
        -- should plugin use default keybindings? (default = true)
        use_default_keys = true,
        -- sometimes user wants to restrict plugin to certain file types only
        -- defaults to all supported file types including custom lang
        -- extensions (see next section)
        filetypes = { "clojure" },

        -- This controls where the cursor is placed when performing slurp/barf operations
        --
        -- - "remain" - It will never change the cursor position, keeping it in the same place
        -- - "follow" - It will always place the cursor on the form edge that was moved
        -- - "auto"   - A combination of remain and follow, it will try keep the cursor in the original position
        --              unless doing so would result in the cursor no longer being within the original form. In
        --              this case it will place the cursor on the moved edge
        cursor_behaviour = "auto", -- remain, follow, auto

        indent = {
          -- This controls how nvim-paredit handles indentation when performing operations which
          -- should change the indentation of the form (such as when slurping or barfing).
          --
          -- When set to true then it will attempt to fix the indentation of nodes operated on.
          enabled = false,
          -- A function that will be called after a slurp/barf if you want to provide a custom indentation
          -- implementation.
          indentor = require("nvim-paredit.indentation.native").indentor,
        },

        -- list of default keybindings
        keys = {
          ["<localleader>@"] = { paredit.unwrap.unwrap_form_under_cursor, "Splice sexp" },
          [">)"] = { paredit.api.slurp_forwards, "Slurp forwards" },
          [">("] = { paredit.api.barf_backwards, "Barf backwards" },

          ["<)"] = { paredit.api.barf_forwards, "Barf forwards" },
          ["<("] = { paredit.api.slurp_backwards, "Slurp backwards" },

          [">e"] = { paredit.api.drag_element_forwards, "Drag element right" },
          ["<e"] = { paredit.api.drag_element_backwards, "Drag element left" },

          [">f"] = { paredit.api.drag_form_forwards, "Drag form right" },
          ["<f"] = { paredit.api.drag_form_backwards, "Drag form left" },

          ["<localleader>o"] = { paredit.api.raise_form, "Raise form" },
          ["<localleader>O"] = { paredit.api.raise_element, "Raise element" },

          ["E"] = {
            paredit.api.move_to_next_element_tail,
            "Jump to next element tail",
            -- by default all keybindings are dot repeatable
            repeatable = false,
            mode = { "n", "x", "o", "v" },
          },
          ["W"] = {
            paredit.api.move_to_next_element_head,
            "Jump to next element head",
            repeatable = false,
            mode = { "n", "x", "o", "v" },
          },

          ["B"] = {
            paredit.api.move_to_prev_element_head,
            "Jump to previous element head",
            repeatable = false,
            mode = { "n", "x", "o", "v" },
          },
          ["gE"] = {
            paredit.api.move_to_prev_element_tail,
            "Jump to previous element tail",
            repeatable = false,
            mode = { "n", "x", "o", "v" },
          },

          ["("] = {
            paredit.api.move_to_parent_form_start,
            "Jump to parent form's head",
            repeatable = false,
            mode = { "n", "x", "v" },
          },
          [")"] = {
            paredit.api.move_to_parent_form_end,
            "Jump to parent form's tail",
            repeatable = false,
            mode = { "n", "x", "v" },
          },

          -- These are text object selection keybindings which can used with standard `d, y, c`, `v`
          ["af"] = {
            paredit.api.select_around_form,
            "Around form",
            repeatable = false,
            mode = { "o", "v" },
          },
          ["if"] = {
            paredit.api.select_in_form,
            "In form",
            repeatable = false,
            mode = { "o", "v" },
          },
          ["aF"] = {
            paredit.api.select_around_top_level_form,
            "Around top level form",
            repeatable = false,
            mode = { "o", "v" },
          },
          ["iF"] = {
            paredit.api.select_in_top_level_form,
            "In top level form",
            repeatable = false,
            mode = { "o", "v" },
          },
          ["ae"] = {
            paredit.api.select_element,
            "Around element",
            repeatable = false,
            mode = { "o", "v" },
          },
          ["ie"] = {
            paredit.api.select_element,
            "Element",
            repeatable = false,
            mode = { "o", "v" },
          },
        },
      }
    end,
  },
}
