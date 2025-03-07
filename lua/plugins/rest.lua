-- REST Http Client

---@type LazySpec
return {
  {
    "rest-nvim/rest.nvim",
    ft = { "http" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
    keys = {
      { "<localleader>rr", "<cmd>Rest run<cr>", desc = "Run request" },
      { "<localleader>rl", "<cmd>Rest last<cr>", desc = "Run last request" },
      { "<localleader>re", "<cmd>Rest env select<cr>", desc = "Select and register .env file" },
    },
  },
}
