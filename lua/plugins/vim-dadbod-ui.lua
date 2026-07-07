return {
  -- 1. Core engine (connection core)
  {
    "tpope/vim-dadbod",
    lazy = true,
  },

  -- 2. Graphical interface (side panel)
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function() vim.g.db_ui_use_nerd_fonts = 1 end,
  },

  -- 3. Completion engine
  {
    "kristijanhusak/vim-dadbod-completion",
    -- KEY POINT: force-load the core engine to avoid the crash
    dependencies = { "tpope/vim-dadbod" },
    ft = { "sql", "mysql", "plsql" },
  },

  -- 4. Inject the suggestions into your nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"

      cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },
}
