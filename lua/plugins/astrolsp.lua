---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Per-server config (merged into `vim.lsp.config`).
    config = {
      -- systemd unit files (.service/.socket/.timer/...). Uses the Rust
      -- `systemd-lsp` (JFryy) installed via Mason. lspconfig's built-in
      -- `systemd_ls` expects the Python `systemd-language-server`, so we point
      -- the cmd at the installed binary instead.
      systemd_ls = {
        cmd = { "systemd-lsp" },
        filetypes = { "systemd" },
        root_markers = { ".git" },
      },
    },
    -- Force-enable servers that mason-lspconfig won't auto-attach (no registry
    -- mapping for the Mason `systemd-lsp` package).
    servers = { "systemd_ls" },
  },
}
