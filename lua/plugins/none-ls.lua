return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local none_ls = require "null-ls"
    return {
      sources = {
        -- Code actions
        none_ls.builtins.code_actions.gitsigns,
        -- Formatters
        none_ls.builtins.formatting.dart_format, -- Formatter for Dart
        none_ls.builtins.formatting.xmllint, -- Formatter for XML / Apple .plist
      },
    }
  end,
}
