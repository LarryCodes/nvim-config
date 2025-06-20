# 🚀 NeoVim IDE: A Modern Development Environment

<div align="center">

![Neovim Logo](https://neovim.io/logos/neovim-logo-300x87.png)

*A powerful, Lua-configured Neovim setup that transforms Vim into a full-featured IDE*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg?logo=neovim)](https://neovim.io/)

</div>

## Table of Contents

- [Introduction](#introduction)
- [Screenshots](#screenshots)
- [Requirements](#requirements)
- [Installation](#installation)
- [Basic Setup](#basic-setup)
- [Project Structure](#project-structure)
- [Plugin Management](#plugin-management)
- [Plugins](#plugins)
  - [User Interface](#user-interface)
  - [Color Schemes](#color-schemes)
  - [Code Editing and Navigation](#code-editing-and-navigation)
  - [Git Integration](#git-integration)
  - [Language Support and Completion](#language-support-and-completion)
  - [Autocompletion](#autocompletion)
- [Key Mappings](#key-mappings)
- [LSP Servers](#lsp-servers)
- [Performance Optimization](#performance-optimization)
- [Troubleshooting](#troubleshooting)
- [Future Plans](#future-plans)
- [License](#license)

## Introduction

This repository showcases the Neovim configuration I currently use for my day-to-day work—and, quite honestly, serves as a backup in case I need to start from scratch.

*Setting up Neovim is like trying to build a spaceship out of Lego pieces while blindfolded: the endless sea of plugins is equal parts thrilling and overwhelming. Arriving at a configuration that doesn't make you want to toss your keyboard out the window? That's a journey of trial, error, and a pinch of masochism.*

**Fair warning**: I'm still fairly new to Neovim (less than six months in), so this configuration is basic—covering just the essentials I need for now. As I get more comfortable and explore Neovim's vast capabilities, this setup will likely evolve, growing alongside my understanding and workflow.

## Screenshots

<!-- Replace these placeholders with actual screenshots of your setup -->

<details>
<summary>Click to see screenshots</summary>

### Main Editor View
*Coming soon*

### LSP in Action
*Coming soon*

### Telescope File Finder
*Coming soon*

</details>

## Requirements

- Neovim >= 0.8.0 (0.9+ recommended)
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for proper icon display
- Node.js and npm (for certain LSP servers)
- Ripgrep (for Telescope live grep functionality)
- A terminal with true color support

## Installation

1. **Backup your existing Neovim configuration** (if you have one):

```bash
# Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.bak

# Also backup Neovim data directory if it exists
[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

2. **Clone this repository:**

```bash
git clone https://github.com/LarryCodes/nvim-config.git
```

3. **Move the cloned folder to your Neovim config directory and rename it:**

```bash
mv nvim-config ~/.config/nvim
```

> **Notes:**
> - The folder must be named `nvim` and located at `~/.config/nvim` for Neovim to recognize it.
> - If you cloned into a different directory, adjust the paths in the commands accordingly.
> - If you want to make changes to this configuration, please fork the repository first and clone your fork instead.

5. **Start Neovim:**

```bash
nvim
```

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will automatically install all the configured plugins.

## Basic Setup

This configuration uses:
- Space as the leader key (`vim.g.mapleader = " "`)
- Line numbers enabled (`set number`)
- Smart indentation settings:
  - Tabs expanded to spaces (`set expandtab`)
  - Tab width of 2 spaces (`set tabstop=2`)
  - Soft tabstop of 2 spaces (`set softtabstop=2`)
  - Auto-indent of 2 spaces (`set shiftwidth=2`)

## Project Structure

```
.
├── init.lua                 # Main entry point that loads lazy.nvim and plugins
├── lazy-lock.json           # Plugin version lockfile
├── .luarc.json              # Lua Language Server configuration
└── lua/
    ├── vim-options.lua     # Basic Vim settings
    └── plugins/            # Plugin configurations
        ├── auto-session.lua # Session management
        ├── barbar.lua      # Buffer management
        ├── color-schemes.lua # Theme configurations
        ├── comment.lua     # Code commenting
        ├── completions.lua # Autocompletion setup
        ├── fugitive.lua    # Git integration
        ├── gitsigns.lua    # Git signs in the gutter
        ├── indent-blankline.lua # Indentation guides
        ├── lsp-config.lua  # LSP configuration
        ├── lualine.lua     # Status line
        ├── neotree.lua     # File explorer
        ├── none-ls.lua     # Null-ls configuration
        ├── nvim-autopairs.lua # Auto-pairing
        ├── telescope.lua   # Fuzzy finder
        ├── treesitter.lua  # Syntax highlighting
        └── which-key.lua   # Keybindings helper
```

Each plugin's configuration is modularized in its own file for better organization and maintainability.

## Plugin Management

- [lazy.nvim](https://github.com/folke/lazy.nvim): Modern plugin manager for Neovim that uses Lua and provides lazy-loading capabilities to improve startup time.

## Plugins

### User Interface

- [barbar.nvim](https://github.com/romgrk/barbar.nvim): A tabline plugin that provides a clean interface for managing buffers with keyboard shortcuts for navigation (`<S-n>`, `<S-p>`), buffer selection (`<leader>1-9`), and closing buffers (`<leader>c`).

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): A fast and customizable statusline plugin written in Lua that displays useful information about the current file, mode, git status, and more.

- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): A file explorer that provides a tree view of your project files and directories. Opens automatically on startup (when no file is specified) and can be toggled with `<C-n>`. Configured to show hidden and gitignored files.

- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Adds file type icons to Neovim plugins such as Neo-tree and Barbar.

- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): Adds indentation guides to all lines, making code structure more visible.

### Color Schemes

- [catppuccin](https://github.com/catppuccin/nvim): A soothing pastel theme for Neovim with support for multiple plugins. Currently using the "mocha" flavor with a black background.

- [synthweave.nvim](https://github.com/samharju/synthweave.nvim): A synthwave-inspired color scheme (currently not active).

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim): A clean, dark theme for Neovim (available but not currently active).

### Code Editing and Navigation

- [Comment.nvim](https://github.com/numToStr/Comment.nvim): Provides smart commenting functionality for multiple languages.

- [nvim-autopairs](https://github.com/windwp/nvim-autopairs): Automatically inserts matching pairs of brackets, quotes, and parentheses as you type. Configured to load on InsertEnter for better performance.

- [which-key.nvim](https://github.com/folke/which-key.nvim): Displays a popup with possible keybindings when you pause after typing a prefix key. Access buffer-local keymaps with `<leader>?`. Helps discover and remember complex key combinations.

- [auto-session](https://github.com/rmagatti/auto-session): Automatically saves and restores sessions when entering and exiting Neovim. Keybindings include:
  - `<leader>ls`: Search sessions with Telescope
  - `<leader>sd`: Delete session
  - `<leader>sr`: Restore session
  - `<leader>ss`: Save session

- [session-lens](https://github.com/rmagatti/session-lens): Telescope extension for auto-session, providing a beautiful UI for searching and managing sessions.

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Provides advanced syntax highlighting and code parsing for better code understanding and navigation. Configured to auto-install parsers for opened file types.

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): A highly extendable fuzzy finder that helps you search for files (`<C-p>`), grep through content (`<leader>fg`), and search for the word under cursor (`<leader>ff`).

- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim): Integrates Telescope with Neovim's UI select to provide a consistent interface for selection menus.

### Git Integration

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): Shows git changes in the sign column and provides commands for git operations.

- [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper that provides Git commands within Neovim.

### Language Support and Completion

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Configurations for Neovim's built-in LSP client, providing IDE-like features such as code completion, go-to-definition, and hover documentation. Keybindings include:
  - `K`: Hover documentation
  - `gd`: Go to definition
  - `<leader>ca`: Code actions

- [mason.nvim](https://github.com/williamboman/mason.nvim): Package manager for Neovim that simplifies the installation of LSP servers, DAP servers, linters, and formatters.

- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim): Bridge between Mason and LSP config, ensuring LSP servers are automatically installed and configured.

- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim): A framework for injecting LSP diagnostics, code actions, and more from arbitrary sources.

- [none-ls-extras.nvim](https://github.com/nvimtools/none-ls-extras.nvim): Additional sources for none-ls.

- [vim-blade](https://github.com/jwalton512/vim-blade): Provides syntax highlighting for Laravel Blade templates.

### Autocompletion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion engine plugin for Neovim that provides an intelligent and customizable completion experience.

- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp): LSP source for nvim-cmp, enabling completions from language servers.

- [LuaSnip](https://github.com/L3MON4D3/LuaSnip): Snippet engine for Neovim, written in Lua.

- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip): Luasnip completion source for nvim-cmp.

- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): A collection of preconfigured snippets for various languages.

## Key Mappings

- `<Space>`: Leader key
- `<C-n>`: Open Neo-tree file explorer
- `<C-p>`: Telescope find files
- `<leader>fg`: Telescope live grep
- `<leader>ff`: Telescope grep string (search for word under cursor)
- `<S-n>`: Next buffer
- `<S-p>`: Previous buffer
- `<leader>1-9`: Go to buffer by index
- `<leader>c`: Close buffer
- `K`: Show hover documentation
- `gd`: Go to definition
- `<leader>ca`: Code actions
- `<leader>ls`: Search sessions with Telescope
- `<leader>sd`: Delete session
- `<leader>sr`: Restore session
- `<leader>ss`: Save session

## LSP Servers

This configuration automatically installs and configures the following language servers:

- `lua_ls`: Lua
- `html`: HTML
- `cssls`, `cssmodules_ls`, `css_variables`: CSS
- `tailwindcss`: Tailwind CSS
- `ts_ls`: TypeScript
- `volar`: Vue
- `intelephense`: PHP (with Blade support)
- `rust_analyzer`: Rust
- `clangd`: C/C++
- `stimulus_ls`: Stimulus JS

## Performance Optimization

I've focused on optimizing performance in my configuration through several strategies:

1. **Lazy Loading**: Most plugins are configured to load only when needed using lazy.nvim's event system
   - Example: nvim-autopairs loads only on `InsertEnter`
   - Example: which-key loads on `VeryLazy` event

2. **Minimal Core**: The base configuration avoids unnecessary settings and keeps the core lightweight

3. **Modular Structure**: Each plugin is configured in its own file, making it easier to disable or modify specific components

## Troubleshooting

### Issues I've Encountered

#### Plugin Installation Failures

If plugins fail to install properly:

```bash
# Remove the plugin cache and reinstall
rm -rf ~/.local/share/nvim/lazy
nvim
```

#### LSP Server Issues

If an LSP server isn't working correctly:

1. Check if it's installed via `:Mason`
2. Reinstall the server if needed
3. Check the logs with `:LspInfo` and `:LspLog`

#### Treesitter Parser Problems

For syntax highlighting issues:

```
:TSInstallInfo    # See installed parsers
:TSInstall <lang> # Install a specific parser
:TSUpdate         # Update parsers
```

## Future Plans

Features I'm planning to add to my configuration:

- [ ] Add debugging support with nvim-dap
- [ ] Improve my git workflow integration
- [ ] Create custom keymaps for my project-specific tasks
- [ ] Add support for more LSP servers and languages that I work with
- [x] Implement session management for quick project resuming
- [ ] Create a custom dashboard for a nicer startup experience



## License

My configuration is available under the [MIT License](LICENSE), so feel free to use it as inspiration for your own setup.

---

<div align="center">
<p>Happy coding with Neovim! 🚀</p>
<p><i>Last updated: June 2025</i></p>
</div>
