# nvim-config-mini

A minimal, pure-Lua Neovim configuration — no third-party package manager, no
external dependencies. Just sane defaults, keymaps, autocommands, and a couple of
small utilities. The only plugin is the **tokyonight** colorscheme, managed by
Neovim's built-in `vim.pack` (requires Neovim 0.12+).

## Layout

```
.
├── init.lua            # entry point — loads the modules below
├── lua/
│   ├── option.lua      # editor options (number, indent, search, undo, ...)
│   ├── colorscheme.lua # tokyonight (moon) via built-in vim.pack
│   ├── keymap.lua      # key mappings (leader = <Space>)
│   ├── autocmd.lua     # autocommands + per-filetype indent rules
│   └── utils.lua       # helpers (e.g. toggle_comment)
└── .stylua.toml        # StyLua formatter config
```

## Highlights

- **No third-party package manager** — the lone plugin (tokyonight) is
  installed via Neovim's built-in `vim.pack`; update it with `:Pack update`.
- **Leader = `<Space>`**, with mnemonic mappings for save/quit, window
  navigation (`<M-h/j/k/l>`), buffers, and config reload.
- **Per-filetype indentation** — 2 spaces for web/scripting/markup languages,
  4 spaces for systems languages, tabs for Go/Make.
- **Quality-of-life autocmds** — highlight on yank, restore last cursor
  position.
- **`toggle_comment`** — language-aware comment toggling in normal and visual
  mode (`<C-/>`).
- Persistent undo, system clipboard integration, `termguicolors`.

## Install

```sh
git clone https://github.com/AzarAI-TOP/nvim-config-mini ~/.config/nvim
```

Then launch `nvim`. On first start, `vim.pack` clones the tokyonight
colorscheme (needs network access once). Requires Neovim 0.12+.
