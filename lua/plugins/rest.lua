return {
  "rest-nvim/rest.nvim",
  ft = { "http", "rest" },
  cmd = { "Rest" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      if not vim.tbl_contains(opts.ensure_installed, "http") then table.insert(opts.ensure_installed, "http") end
    end,
  },
  keys = {
    { "<leader>rr", "<cmd>Rest run<cr>", desc = "Run REST request" },
    { "<leader>rl", "<cmd>Rest last<cr>", desc = "Run last REST request" },
  },
  init = function()
    vim.g.rest_nvim = {
      env = {
        enable = true,
        pattern = ".*%.env.*",
      },
      highlight = { enable = true, timeout = 750 },
      ui = { winbar = true, keybinds = { prev = "H", next = "L" } },

      -- 👇 AQUÍ ACTIVAS EL FORMATEO AUTOMÁTICO
      response = {
        hooks = {
          decode_url = true,
          format = true, -- usa `gq` para formatear el body
        },
      },
    }
  end,
}
