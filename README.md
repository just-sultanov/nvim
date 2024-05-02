# nvim

My configuration for NeoVim based on [AstroNvim v4+](https://astronvim.com/)

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Neovim v0.9+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)
- A clipboard tool is necessary for the integration with the system clipboard
  [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool)
- Terminal with true color support (for the default theme, otherwise it is
  dependent on the theme you are using)
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope
    search (`<leader>fw`)
  - [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal
    (`<leader>tu`)
  - [bottom](https://github.com/ClementTsang/bottom) - process viewer toggle
    terminal (`<leader>tt`)
  - [Python](https://www.python.org/) - python repl toggle terminal
    (`<leader>tp`)
  - [Node](https://nodejs.org/en/) - Node is needed for a lot of the LSPs, and
    for the node repl toggle terminal (`<leader>tn`)

## 🛠️ Installation

```shell
# backup old configuration
mv ~/.config/nvim ~/.config/nvim.bak

# backup cache, state, etc
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# install neovim config
git clone git@github.com:just-sultanov/nvim.git ~/.config/nvim

# first run, install default plugins, etc
nvim
```

## License

[Copyright © 2024 Ilshat Sultanov](./license)
