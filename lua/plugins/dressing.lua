return {
  "stevearc/dressing.nvim",
  lazy = false, -- Load immediately so it intercepts the UI
  opts = {
    input = {
      -- This forces the box to be relative to the whole editor
      relative = "editor",
      -- Positioning
      anchor = "NW", -- Anchor point (North-West)
      prefer_width = 60, -- Preferred box width
      max_width = { 140, 0.9 },
      min_width = { 20, 0.2 },

      -- Window aesthetics
      win_options = {
        winblend = 0, -- Transparency (0 is solid)
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
}
