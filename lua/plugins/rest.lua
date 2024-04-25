-- REST Http Client

local prefix = "<leader>r"

---@type LazySpec
return {
  {
    "rest-nvim/rest.nvim",
    ft = { "http", "json" },
    cmd = {
      "RestNvim",
      "RestNvimPreview",
      "RestNvimLast",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { prefix, desc = "RestNvim" },
      { prefix .. "r", "<Plug>RestNvim", desc = "Run request" },
    },
    config = function()
      require("rest-nvim").setup {
        skip_ssl_verification = true,
      }
    end,
  },
}
