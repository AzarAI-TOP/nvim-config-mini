# nvim-config-mini

A minimal, pure-Lua Neovim configuration — no third-party package manager, no
external dependencies. All plugins are managed by Neovim's built-in `vim.pack`
(requires Neovim 0.12+).

## Layout

```
.
├── init.lua                # entry point — loads config modules, then plugins
├── lua/
│   ├── config/
│   │   ├── options.lua      # editor options (number, indent, search, undo, ...)
│   │   ├── keymaps.lua      # key mappings (leader = <Space>)
│   │   └── autocmds.lua     # autocommands + per-filetype indent rules
│   └── plugins/
│       ├── init.lua         # auto-loader — requires every other file in this dir
│       ├── bento.lua        # bento.nvim — buffer manager
│       ├── conform.lua      # conform.nvim — code formatting
│       ├── fzf.lua          # fzf-lua — fuzzy finding
│       ├── mini-ai.lua      # mini.ai — textobjects (a/i)
│       ├── mini-bracketed.lua  # mini.bracketed — bracket navigation
│       ├── mini-comment.lua # mini.comment — comment toggling
│       ├── mini-files.lua   # mini.files — file explorer
│       ├── mini-icons.lua   # mini.icons — icon provider
│       ├── mini-indentscope.lua  # mini.indentscope — indent guides
│       ├── mini-move.lua    # mini.move — move lines/selections
│       ├── mini-notify.lua  # mini.notify — notification system
│       ├── mini-trailspace.lua  # mini.trailspace — trailing whitespace
│       ├── todo-comments.lua    # todo-comments.nvim — TODO highlighting
│       ├── tokyonight.lua   # tokyonight (moon) colorscheme
│       └── treesitter.lua   # nvim-treesitter — syntax highlighting
└── .stylua.toml            # StyLua formatter config
```

Each file under `lua/plugins/` is self-contained — it carries its own
`vim.pack.add` alongside its setup — and `lua/plugins/init.lua` loads them all
automatically. Adding or removing a plugin is just adding or removing one file.

## Highlights

- **No third-party package manager** — all 15 plugins are installed via
  Neovim's built-in `vim.pack`; update with `:Pack update`.
- **Buffer manager** — `bento.nvim` (`;`) provides a floating buffer switcher
  with actions (open, delete, split, lock).
- **File explorer** — `mini.files` uses Miller columns for navigating and
  manipulating the file system. Replaces netrw by default.
- **Fuzzy finding** — `fzf-lua` for files (`<leader>ff`), config (`<leader>fc`),
  registers (`<leader>fr`), help (`<leader>fh`).
- **Code formatting** — `conform.nvim` formats on demand (`<leader>lf`).
  Formatters must be installed separately on `PATH`.
- **Tree-sitter syntax highlighting** — 22 parsers installed, enabled
  automatically on matching filetypes; falls back to regex otherwise.
- **Textobjects** — `mini.ai` extends `a`/`i` with function calls, arguments,
  tags, and more. Supports consecutive expansion (`in` → `in` → ...).
- **Bracket navigation** — `mini.bracketed` provides `]`/`[` mappings for
  diagnostics, indentation, comments, quickfix, buffers, windows, and more.
- **Comment toggling** — `mini.comment` via `gc` / `gcc` / `<C-/>`.
- **Leader = `<Space>`**, with mappings grouped by mnemonic prefix:
  `<leader>b` buffer, `<leader>c` config, `<leader>l` language (format),
  `<leader>e` explorer, `<leader>f` find/search, `<leader>t` toggle.
  Direct window navigation via `<M-h/j/k/l>`.
- **Per-filetype indentation** — 2 spaces for web/scripting/markup languages,
  4 spaces for systems languages, tabs for Go/Make.
- **Quality-of-life autocmds** — highlight on yank, restore last cursor
  position.
- **TODO highlighting** — `todo-comments.nvim` highlights and searches for
  TODO/FIX/HACK/WARN/NOTE comments.
- **Notifications** — `mini.notify` replaces `vim.notify` with a cleaner UI.
- **Visual aides** — `mini.indentscope` shows indent guides,
  `mini.trailspace` highlights trailing whitespace,
  `mini.move` moves lines/selections with `Alt+↑/↓`.
- Persistent undo, system clipboard integration, `termguicolors`.

## Plugins

| Plugin | Purpose |
|--------|---------|
| [bento.nvim](https://github.com/serhez/bento.nvim) | Buffer manager |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |
| [fzf-lua](https://github.com/ibhagwan/fzf-lua) | Fuzzy finding |
| [mini.ai](https://github.com/nvim-mini/mini.ai) | Textobjects |
| [mini.bracketed](https://github.com/nvim-mini/mini.bracketed) | Bracket navigation |
| [mini.comment](https://github.com/nvim-mini/mini.comment) | Comment toggling |
| [mini.files](https://github.com/nvim-mini/mini.files) | File explorer |
| [mini.icons](https://github.com/nvim-mini/mini.icons) | Icon provider |
| [mini.indentscope](https://github.com/nvim-mini/mini.indentscope) | Indent guides |
| [mini.move](https://github.com/nvim-mini/mini.move) | Move lines/selections |
| [mini.notify](https://github.com/nvim-mini/mini.notify) | Notification system |
| [mini.trailspace](https://github.com/nvim-mini/mini.trailspace) | Trailing whitespace |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | TODO highlighting |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme (moon) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |

## Install

```sh
git clone https://github.com/AzarAI-TOP/nvim-config-mini ~/.config/nvim
```

Then launch `nvim`. On first start, `vim.pack` clones all plugins (needs
network access once), and nvim-treesitter compiles its parsers in the
background — this needs a C compiler (`cc`/`gcc`/`clang`) on your `PATH`.
Requires Neovim 0.12+.
