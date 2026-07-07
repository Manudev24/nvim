---
name: add-plugin
description: Scaffold a new plugin for this AstroNvim config following repo conventions. Use when the user wants to add, install, or configure a Neovim plugin. Handles both regular lazy.nvim specs (lua/plugins/<name>.lua) and AstroCommunity imports (lua/community.lua).
---

Add a Neovim plugin to this AstroNvim v4 config. Pick the right path based on what the user is adding.

## 1. Decide: AstroCommunity pack or a regular spec?

- If the plugin is a **language pack or a known AstroCommunity module** (e.g. `pack.python`, `editor.trouble`, `completion.supermaven`), add it to `lua/community.lua` as an import — do NOT hand-write a spec. Browse names at https://github.com/AstroNvim/astrocommunity.
  ```lua
  { import = "astrocommunity.pack.rust" },
  ```
  Add the line alongside the existing imports, keeping related packs grouped.

- Otherwise, create a **new file** `lua/plugins/<plugin-name>.lua` (one plugin per file).

## 2. Write the spec

New files must return `---@type LazySpec`. Follow the repo's `.stylua.toml` style: 2-space indent, double quotes, and **no parentheses on single-string calls** (`require "x"`).

```lua
---@type LazySpec
return {
  "author/plugin-name.nvim",
  event = "User AstroFile", -- or cmd/keys/ft — lazy-load; avoid loading eagerly
  opts = {
    -- plugin setup options; AstroNvim merges these and calls require("plugin-name").setup(opts)
  },
}
```

Guidance:
- Prefer lazy-loading triggers (`event`, `ft`, `cmd`, `keys`) over eager loading.
- Use `opts = {}` when the plugin's `setup()` takes a table — AstroNvim handles the setup call. Use `config = function() ... end` only when you need custom logic.
- For **overriding an existing AstroNvim plugin's config**, extend the relevant file instead of making a new one: `astrocore.lua` (options/keymaps/autocmds), `astroui.lua` (UI/theme), `astrolsp.lua` (LSP), or `user.lua` (misc).

## 3. Finish

- Do not edit `lazy-lock.json` by hand — it updates when the user runs `:Lazy sync` inside Neovim.
- Tell the user to run `:Lazy sync` (or restart Neovim) to install, and mention any post-install step (`:TSInstall`, `:MasonInstall`, etc.) the plugin needs.
