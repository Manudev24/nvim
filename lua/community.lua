-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.typescript-all-in-one" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.scrolling.mini-animate" },
  -- { import = "astrocommunity.completion.supermaven-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.media.image-nvim" },
}
