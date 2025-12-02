return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local none_ls = require "null-ls"
    return {
      sources = {
        -- Code actions
        none_ls.builtins.code_actions.gitsigns,
        -- Formateadores
        none_ls.builtins.formatting.dart_format, -- Formateador para Dart
      },
    }
  end,
}
