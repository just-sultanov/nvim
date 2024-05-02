-- Status line

---@type LazySpec
return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = {
        -- default highlight for the entire statusline
        hl = { fg = "fg", bg = "bg" },

        -- Vim mode
        status.component.mode {
          mode_text = { icon = { kind = "VimIcon", padding = { left = 1, right = 1 } } },
          surround = {
            separator = "left",
            color = function()
              local bg = status.hl.mode_bg()
              return {
                main = bg,
                right = bg,
              }
            end,
          },
        },

        -- File name
        status.component.file_info {
          file_icon = { padding = { left = 1 } },
          filename = { fallback = "Empty" },
          filetype = false,
          padding = { right = 1 },
          surround = { separator = "left", condition = false },
        },

        -- Git
        status.component.git_branch { surround = { separator = "none" } },
        status.component.git_diff { padding = { left = 1 }, surround = { separator = "none" } },
        status.component.fill(),

        -- LSP
        status.component.lsp { lsp_client_names = false, surround = { separator = "none", color = "bg" } },
        status.component.fill(),
        status.component.diagnostics { surround = { separator = "right" } },
        status.component.lsp { lsp_progress = false, surround = { separator = "right" } },

        -- Nav
        status.component.nav {
          hl = { fg = "fg" },
          ruler = { padding = { left = 1, right = 1 } },
          percentage = false,
          scrollbar = false,
          surround = { separator = "none", color = "bg" },
        },
      }

      return opts
    end,
  },
}
