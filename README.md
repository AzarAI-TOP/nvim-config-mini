# nvim-config-mini

A minimal, pure-Lua Neovim configuration — no third-party package manager, no
external dependencies. Just sane defaults, keymaps, autocommands, and a couple of
small utilities. The three plugins — the **tokyonight** colorscheme,
**nvim-treesitter**, and **conform.nvim** (formatting) — are managed by Neovim's
built-in `vim.pack` (requires Neovim 0.12+).

## Layout

```
.
├── init.lua                # entry point — loads config modules, then plugins
├── lua/
│   ├── config/
│   │   ├── options.lua      # editor options (number, indent, search, undo, ...)
│   │   ├── keymaps.lua      # key mappings (leader = <Space>)
│   │   ├── autocmds.lua     # autocommands + per-filetype indent rules
│   │   └── utils.lua        # helpers (e.g. toggle_comment)
│   └── plugins/
│       ├── init.lua         # auto-loader — requires every other file in this dir
│       ├── tokyonight.lua   # tokyonight (moon) colorscheme via built-in vim.pack
│       ├── treesitter.lua   # nvim-treesitter — parser install + auto-enabled highlighting
│       └── conform.lua      # conform.nvim — code formatting (manual <leader>f)
└── .stylua.toml            # StyLua formatter config
```

Each file under `lua/plugins/` is self-contained — it carries its own
`vim.pack.add` alongside its setup — and `lua/plugins/init.lua` loads them all
automatically, so adding or removing a plugin is just adding or removing one
file.

## Highlights

- **No third-party package manager** — all plugins (tokyonight,
  nvim-treesitter, conform.nvim) are installed via Neovim's built-in `vim.pack`;
  update them with `:Pack update`.
- **Formatting** — `conform.nvim` formats the current buffer on demand with
  `<leader>f` (no format-on-save). conform does **not** install the formatter
  binaries — they must be on your `PATH` (e.g. `stylua`, `prettierd`, `black`,
  `isort`, `clang-format`, `rustfmt`, `goimports`, `taplo`, `shfmt`); any
  filetype whose formatter is missing is silently skipped.
- **Tree-sitter syntax highlighting** — `nvim-treesitter` (main branch) installs
  parsers for the languages in use and auto-enables highlighting on any filetype
  whose parser is present, falling back to the legacy regex syntax otherwise.
- **Leader = `<Space>`**, with mappings grouped by mnemonic prefix:
  `<leader>b` buffer, `<leader>c` config (edit/reload), `<leader>l` language
  (format, room for LSP), `<leader>f` find/file, `<leader>w` window (forwards to
  `<C-w>`), `<leader>t` toggle. High-frequency file ops stay top-level —
  `<C-s>` save, `<leader>q` quit, `<leader>Q` quit-all. Direct window
  navigation via `<M-h/j/k/l>` and resize via `<C-arrows>` remain too.
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

Then launch `nvim`. On first start, `vim.pack` clones tokyonight and
nvim-treesitter (needs network access once), and nvim-treesitter compiles its
parsers in the background — this needs a C compiler (`cc`/`gcc`/`clang`) on
your `PATH`. Requires Neovim 0.12+.
