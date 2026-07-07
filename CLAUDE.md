# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Personal Neovim configuration built on **AstroNvim v4** (from the official AstroNvim template), managed by **lazy.nvim**.

## Layout

- `init.lua` bootstraps lazy → `require "lazy_setup"` → `require "polish"`.
- `lua/lazy_setup.lua` sets `mapleader`/`maplocalleader` and loads specs in order: AstroNvim core → `lua/community.lua` → `lua/plugins/`.
- `lua/community.lua` — AstroCommunity imports (language packs + modules). Add community plugins here.
- `lua/plugins/*.lua` — user specs, **one plugin (or override) per file**, each returning `---@type LazySpec`.
- `lua/polish.lua` is **disabled by design** — first line is `if true then return end`. Remove that line to activate it.

## Conventions

- **Add a plugin:** create a new file in `lua/plugins/` returning a `LazySpec` table. There is no central registry to edit. For AstroCommunity packs, add an `{ import = "astrocommunity..." }` entry to `lua/community.lua`.
- **Where overrides go:** options/keymaps/autocmds → `lua/plugins/astrocore.lua` (under `opts.options` / `opts.mappings` / `opts.autocmds`); UI/theme → `lua/plugins/astroui.lua`; LSP → `lua/plugins/astrolsp.lua`. Misc user tweaks → `lua/plugins/user.lua`.
- **Keymaps:** values are `{ rhs, desc = "..." }`; set a mapping to `false` to disable an AstroNvim default.

## Lua style (`.stylua.toml`)

- 2-space indent, 120 column width, double quotes (`AutoPreferDouble`).
- **No parentheses on single-string calls** — write `require "foo"` and `{ import = "bar" }`, not `require("foo")`.
- Formatting/linting (stylua, selene) run **inside Neovim via Mason/none-ls**, not as standalone CLIs — match the style manually; there is no terminal format command.

## Gotchas

- `.neoconf.json` disables lua_ls formatting (`Lua.format.enable = false`) so stylua stays the source of truth.
- AI completion is **Supermaven** (`astrocommunity.completion.supermaven-nvim`). Copilot and avante were removed — do not re-add Copilot-based tooling.
- Template files guarded by `if true then return {} end` are **inert** (they return `{}` and override nothing). Don't add config to a guarded file expecting it to apply — remove the guard first or the file does nothing.
- No test suite and no CI in this repo.
