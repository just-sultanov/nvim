-- NeoTree

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, config)
    -- disable netrw style
    config.filesystem.hijack_netrw_behavior = "disabled"

    -- show only file tree (disable other tabs)
    config.source_selector.sources = {
      { source = "filesystem" },
    }

    return config
  end,
}
