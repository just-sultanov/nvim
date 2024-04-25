-- Custom snippets

---@type LazySpec
return {
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      -- include the default astronvim config that calls the setup call
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      -- load custom snippets
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "./lua/snippets" },
      }
    end,
  },
}
