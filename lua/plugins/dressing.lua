return {
  "stevearc/dressing.nvim",
  lazy = false, -- Cargarlo de inmediato para que intercepte el UI
  opts = {
    input = {
      -- Esto fuerza a que el cuadro sea relativo a todo el editor
      relative = "editor",
      -- Posicionamiento
      anchor = "NW", -- Punto de anclaje (North-West)
      prefer_width = 60, -- Ancho preferido del cuadro
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },

      -- Estética de la ventana
      win_options = {
        winblend = 0, -- Transparencia (0 es sólido)
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
}
