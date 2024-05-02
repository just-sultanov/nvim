-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "tokyonight-storm", -- "astrodark"
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    status = {
      -- define the separators between each section
      separators = {
        none = { "", "" },
        left = { "", "  " },
        right = { "  ", "" },
        center = { "  ", "  " },
        tab = { "", " " },
        breadcrumbs = " > ",
        path = " > ",
      },
      -- add new colors that can be used by heirline
      colors = function(hl)
        local get_hlgroup = require("astroui").get_hlgroup
        -- use helper function to get highlight group properties
        local comment_fg = get_hlgroup("Comment").fg
        hl.git_branch_fg = comment_fg
        hl.git_added = comment_fg
        hl.git_changed = comment_fg
        hl.git_removed = comment_fg
        hl.blank_bg = get_hlgroup("Folded").fg
        hl.file_info_bg = get_hlgroup("Visual").bg
        hl.nav_icon_bg = get_hlgroup("String").fg
        hl.nav_fg = hl.nav_icon_bg
        hl.folder_icon_bg = get_hlgroup("Error").fg
        return hl
      end,
      attributes = {
        mode = { bold = true },
      },
      icon_highlights = {
        file_icon = {
          statusline = false,
        },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      ActiveLSP = "",
      ActiveTS = "",
      ArrowLeft = "",
      ArrowRight = "",
      BufferClose = "󰅖",
      DapBreakpoint = "",
      DapBreakpointCondition = "",
      DapBreakpointRejected = "",
      DapLogPoint = ".>",
      DapStopped = "󰁕",
      DefaultFile = "󰈙",
      Diagnostic = "󰒡",
      DiagnosticError = "",
      DiagnosticHint = "󰌵",
      DiagnosticInfo = "󰋼",
      DiagnosticWarn = "",
      Ellipsis = "…",
      FileModified = "",
      FileReadOnly = "",
      FoldClosed = "",
      FoldOpened = "",
      FoldSeparator = " ",
      FolderClosed = "",
      FolderEmpty = "",
      FolderOpen = "",
      Git = "󰊢",
      GitAdd = "",
      GitBranch = "",
      GitChange = "",
      GitConflict = "",
      GitDelete = "",
      GitIgnored = "◌",
      GitRenamed = "➜",
      GitStaged = "✓",
      GitUnstaged = "✗",
      GitUntracked = "",
      LSPLoaded = "",
      LSPLoading1 = "⠋",
      LSPLoading10 = "⠏",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      MacroRecording = "",
      Paste = "󰅌",
      ScrollText = "",
      Search = "",
      Selected = "❯",
      Spellcheck = "󰓆",
      TabClose = "󰅙",
      VimIcon = "",
    },
  },
}
