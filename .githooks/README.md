# Git Hooks

This directory contains version-controlled git hooks.

## Current hooks

- **pre-commit** — Formats staged `.lua` files with [StyLua](https://github.com/JohnnyMorganz/StyLua)
  using the project's `.stylua.toml` settings (4-space indent, 120 column width).

## Setup

The hooks directory is configured automatically via:

```sh
git config core.hooksPath .githooks
```

If you clone this repo fresh, run that command (or the hooks won't fire).
To bypass hooks on a specific commit: `git commit --no-verify`.
