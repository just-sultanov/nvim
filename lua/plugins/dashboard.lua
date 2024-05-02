-- Dashboard

---@type LazySpec
return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts) -- override the options using lazy.nvim
      opts.section.header.val = {
        "  ██▓     ▄▄▄      ▒███████▒▓██   ██▓ ▄████▄   ▄▄▄      ▄▄▄█████▓ ",
        " ▓██▒    ▒████▄    ▒ ▒ ▒ ▄▀░ ▒██  ██▒▒██▀ ▀█  ▒████▄    ▓  ██▒ ▓▒ ",
        " ▒██░    ▒██  ▀█▄  ░ ▒ ▄▀▒░   ▒██ ██░▒▓█    ▄ ▒██  ▀█▄  ▒ ▓██░ ▒░ ",
        " ▒██░    ░██▄▄▄▄██   ▄▀▒   ░  ░ ▐██▓░▒▓▓▄ ▄██▒░██▄▄▄▄██ ░ ▓██▓ ░  ",
        " ░██████▒ ▓█   ▓██▒▒███████▒  ░ ██▒▓░▒ ▓███▀ ░ ▓█   ▓██▒  ▒██▒ ░  ",
        " ░ ▒░▓  ░ ▒▒   ▓▒█░░▒▒ ▓░▒░▒   ██▒▒▒ ░ ░▒ ▒  ░ ▒▒   ▓▒█░  ▒ ░░    ",
        " ░ ░ ▒  ░  ▒   ▒▒ ░░░▒ ▒ ░ ▒ ▓██ ░▒░   ░  ▒     ▒   ▒▒ ░    ░     ",
        "   ░ ░     ░   ▒   ░ ░ ░ ░ ░ ▒ ▒ ░░  ░          ░   ▒     ░       ",
        "     ░  ░      ░  ░  ░ ░     ░ ░     ░ ░            ░  ░          ",
        "                   ░         ░ ░     ░                            ",
      }
      opts.section.footer.val = {
        "2024 © Ilshat Sultanov",
      }
    end,
  },
}