return {
  -- Importa solo la versión de Lua
  { import = "astrocommunity.completion.copilot-lua" },

  -- Configuración para desactivar las predicciones (ghost text)
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = false, -- Desactiva las sugerencias automáticas de texto gris
        auto_trigger = false, -- Evita que se disparen solas
      },
      panel = { enabled = false }, -- Opcional: desactiva el panel lateral
    },
  },
}
