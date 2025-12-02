return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "BufRead",
  config = function()
    local rainbow_delimiters = require "rainbow-delimiters"

    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rainbow_delimiters.strategy["global"], -- Estrategia global por defecto
        vim = rainbow_delimiters.strategy["local"], -- Estrategia local para archivos vim
      },
      query = {
        [""] = "rainbow-delimiters", -- Query por defecto
        lua = "rainbow-blocks", -- Query específico para Lua
        javascript = "rainbow-delimiters", -- Query para JavaScript
        typescript = "rainbow-delimiters", -- Query para TypeScript
        python = "rainbow-delimiters", -- Query para Python
        dart = "rainbow-delimiters", -- Query para Dart/Flutter
      },
      priority = {
        [""] = 110, -- Prioridad por defecto
        lua = 210, -- Prioridad alta para Lua
      },
      highlight = {
        -- 🎨 Colores personalizados para cada nivel de anidación
        "RainbowDelimiterRed", -- Nivel 1: Rojo
        "RainbowDelimiterYellow", -- Nivel 2: Amarillo
        "RainbowDelimiterBlue", -- Nivel 3: Azul
        "RainbowDelimiterOrange", -- Nivel 4: Naranja
        "RainbowDelimiterGreen", -- Nivel 5: Verde
        "RainbowDelimiterViolet", -- Nivel 6: Violeta
        "RainbowDelimiterCyan", -- Nivel 7: Cian
      },
    }

    -- 🎨 Configuración de colores más vibrantes para el tema OneDark
    vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD", bold = true })
    vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2", bold = true })
  end,
}
