-- Famous themes available in the `<Leader>ft` picker.
-- `lazy = false` + `priority = 1000` so they are loaded and previewable in the
-- picker. The ACTIVE theme is decided by astroui (reading the persisted choice),
-- not by these specs — here they are only installed/registered, never applied.
---@type LazySpec
return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },
  { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 },
  { "sainnhe/everforest", lazy = false, priority = 1000 },
  { "Mofiqul/dracula.nvim", lazy = false, priority = 1000 },
  { "shaunsingh/nord.nvim", lazy = false, priority = 1000 },
}
