return {
  "nvim-telescope/telescope-media-files.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },
  event = "VeryLazy", -- load when Telescope is used
  config = function()
    local telescope = require "telescope"

    telescope.setup {
      extensions = {
        media_files = {
          -- Supported filetypes
          filetypes = { "png", "webp", "jpg", "jpeg" },
          -- Command used to search (you can use "fd" instead)
          find_cmd = "rg",
        },
      },
    }

    -- Load the extension after configuring Telescope
    pcall(telescope.load_extension, "media_files")
  end,
  keys = {
    {
      "<leader>fm",
      function() require("telescope").extensions.media_files.media_files() end,
      desc = "Open Telescope media files (images, pdfs, videos, fonts)",
    },
  },
}
