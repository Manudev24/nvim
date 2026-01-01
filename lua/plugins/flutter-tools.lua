return {
  "nvim-flutter/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
  opts = {
    lsp = {
      color = {
        enabled = true,
        background = false, -- Cambia esto a true para probar
        background_color = { r = 19, g = 17, b = 24 }, -- Pon el color de fondo de tu terminal (RGB)
        foreground = false,
        virtual_text = true,
        virtual_text_str = "■",
      },
    },
  },
}
