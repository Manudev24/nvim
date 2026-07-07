-- AstroNvim pins nui.nvim to `^0.3`, whose latest tag (0.3.0) still calls the
-- deprecated `vim.tbl_islist` and spams a warning on Nvim 0.11+. 0.4.0 drops it.
---@type LazySpec
return {
  "MunifTanjim/nui.nvim",
  version = "^0.4",
}
