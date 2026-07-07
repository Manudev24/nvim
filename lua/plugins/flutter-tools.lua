return {
  "nvim-flutter/flutter-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
  opts = {
    lsp = {
      color = {
        enabled = true,
        background = false, -- Change this to true to try it out
        background_color = { r = 19, g = 17, b = 24 }, -- Set your terminal's background color (RGB)
        foreground = false,
        virtual_text = true,
        virtual_text_str = "■",
      },
    },
  },
}
