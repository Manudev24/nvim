-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- Theme persisted with <Leader>ft (see lua/user/theme.lua). onedark by default.
    colorscheme = require("user.theme").load(),
    icons = {
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
    highlights = {
      init = function()
        local set_hl = vim.api.nvim_set_hl
        -- Editor
        set_hl(0, "Normal", { bg = "none" })
        set_hl(0, "NormalNC", { bg = "none" })
        set_hl(0, "NormalFloat", { bg = "none" })
        set_hl(0, "FloatBorder", { bg = "none" })
        set_hl(0, "SignColumn", { bg = "none" })
        set_hl(0, "VertSplit", { bg = "none" })
        -- File tree (neo-tree): force transparency on every theme
        set_hl(0, "NeoTreeNormal", { bg = "none" })
        set_hl(0, "NeoTreeNormalNC", { bg = "none" })
        set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
        set_hl(0, "NeoTreeWinSeparator", { bg = "none" })
        set_hl(0, "NeoTreeVertSplit", { bg = "none" })
        set_hl(0, "NeoTreeFloatNormal", { bg = "none" })
        set_hl(0, "NeoTreeFloatBorder", { bg = "none" })
        set_hl(0, "NeoTreeTitleBar", { bg = "none" })
      end,
    },
  },
}
