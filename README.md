# nvim-config-mini

A minimal, plugin-free Neovim configuration — pure Lua, no package manager, no
external dependencies. Just sane defaults, keymaps, autocommands, and a couple of
small utilities.

## Layout

```
.
├── init.lua            # entry point — loads the modules below
├── lua/
│   ├── option.lua      # editor options (number, indent, search, undo, ...)
│   ├── keymap.lua      # key mappings (leader = <Space>)
│   ├── autocmd.lua     # autocommands + per-filetype indent rules
│   └── utils.lua       # helpers (e.g. toggle_comment)
└── .stylua.toml        # StyLua formatter config
```

## Highlights

- **No plugins** — works on a fresh Neovim install with zero setup.
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

Then launch `nvim`. Requires Neovim 0.9+.
