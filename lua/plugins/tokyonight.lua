-- Tokyonight theme
-- see colors: https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_storm.lua

---@type LazySpec
return {
  "folke/tokyonight.nvim",
  name = "tokyonight-storm",
  config = function(_, opts)
    opts.style = "storm"
    opts.transparent = false
    opts.terminal_colors = false
    opts.styles = {
      comments = { italic = false, underline = false, undercurl = false },
      keywords = { italic = false, underline = false, undercurl = false },
      functions = { italic = false, underline = false, undercurl = false },
      variables = { italic = false, underline = false, undercurl = false },
      sidebars = "dark",
      floats = "dark",
    }
    opts.sidebars = { "qf", "help" }
    opts.day_brightness = 1
    opts.hide_inactive_statusline = false
    opts.dim_inactive = false
    opts.lualine_bold = true
    opts.on_colors = function(c)
      local u = require "tokyonight.util"
      -- Git
      c.git.change = c.blue
      c.git.conflict = c.red
      c.git.untrack = u.lighten(c.fg, 0.1)

      -- GitSigns (sync colors)
      c.gitSigns.add = c.git.add
      c.gitSigns.change = c.git.change
      c.gitSigns.delete = c.git.delete
    end

    opts.on_highlights = function(hl, c)
      -- NeoTree
      hl.NeoTreeGitAdded = { fg = c.git.add }
      hl.NeoTreeGitConflict = { fg = c.git.conflict }
      hl.NeoTreeGitDeleted = { fg = c.git.delete }
      hl.NeoTreeGitIgnored = { fg = c.git.ignore }
      hl.NeoTreeGitModified = { fg = c.git.change }
      hl.NeoTreeGitUntracked = { fg = c.git.untrack }

      -- Disable styles (underline, undercurl)
      hl.Comment = { fg = c.comment }
      hl.SpellBad = { sp = c.error }
      hl.SpellCap = { sp = c.warning }
      hl.SpellLocal = { sp = c.info }
      hl.SpellRare = { sp = c.hint }
      hl.DiagnosticUnderlineError = { sp = c.error }
      hl.DiagnosticUnderlineWarn = { sp = c.warning }
      hl.DiagnosticUnderlineInfo = { sp = c.info }
      hl.DiagnosticUnderlineHint = { sp = c.hint }
    end
  end,
}
