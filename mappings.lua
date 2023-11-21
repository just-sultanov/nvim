return {
  n = {
    -- navigation
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- zen mode
    ["<leader>z"] = { ":ZenMode<cr>", desc = "Toggle ZenMode" },

    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
    ["<C-q>"] = { ":q<cr>", desc = "Quit" },

    ["<leader>gg"] = { "<cmd>Neogit cwd=%:p:h<cr>", desc = "NeoGit" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
