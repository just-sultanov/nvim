-- Zen mode

---@type LazySpec
return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1,
        width = function() return math.min(130, vim.o.columns * 0.75) end,
        height = 0.9,
        options = {
          showbreak = "NONE",
          signcolumn = "no",
          number = true,
          relativenumber = false,
          cursorline = true,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          cmdheight = 1,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        wezterm = {
          enabled = false,
          font = "+4",
        },
      },
    },
  },
}
