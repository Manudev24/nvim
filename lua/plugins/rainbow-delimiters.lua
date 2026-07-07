return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufRead",
  config = function()
    local rainbow_delimiters = require "rainbow-delimiters"

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"], -- Default global strategy
        vim = rainbow_delimiters.strategy["local"], -- Local strategy for vim files
      },
      query = {
        [""] = "rainbow-delimiters", -- Default query
        lua = "rainbow-blocks", -- Lua-specific query
        javascript = "rainbow-delimiters", -- Query for JavaScript
        typescript = "rainbow-delimiters", -- Query for TypeScript
        python = "rainbow-delimiters", -- Query for Python
        dart = "rainbow-delimiters", -- Query for Dart/Flutter
      },
      priority = {
        [""] = 110, -- Default priority
        lua = 210, -- High priority for Lua
      },
      highlight = {
        -- 🎨 Custom colors for each nesting level
        "RainbowDelimiterRed", -- Level 1: Red
        "RainbowDelimiterYellow", -- Level 2: Yellow
        "RainbowDelimiterBlue", -- Level 3: Blue
        "RainbowDelimiterOrange", -- Level 4: Orange
        "RainbowDelimiterGreen", -- Level 5: Green
        "RainbowDelimiterViolet", -- Level 6: Violet
        "RainbowDelimiterCyan", -- Level 7: Cyan
      },
    }

    -- 🎨 More vibrant color setup for the OneDark theme
    vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2", bold = true })
  end,
}
