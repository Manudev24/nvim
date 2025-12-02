-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "░█████████  ░██████░██    ░██ ░██████████ ░██         ░████████   ░█████████  ░██████████ ░██       ░██ ",
        "░██     ░██   ░██   ░██  ░██  ░██         ░██         ░██    ░██  ░██     ░██ ░██         ░██       ░██ ",
        "░██     ░██   ░██    ░██░██   ░██         ░██         ░██    ░██  ░██     ░██ ░██         ░██  ░██  ░██ ",
        "░█████████    ░██     ░███    ░█████████  ░██         ░████████   ░█████████  ░█████████  ░██ ░████ ░██ ",
        "░██           ░██    ░██░██   ░██         ░██         ░██     ░██ ░██   ░██   ░██         ░██░██ ░██░██ ",
        "░██           ░██   ░██  ░██  ░██         ░██         ░██     ░██ ░██    ░██  ░██         ░████   ░████ ",
        "░██         ░██████░██    ░██ ░██████████ ░██████████ ░█████████  ░██     ░██ ░██████████ ░███     ░███ ",
        "                                                                                                        ",
        "                                                                                                        ",
        "                                                                                                        ",
      }
      opts.section.header.opts.hl = "Type"
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require "notify"

      notify.setup {
        -- Timeout para las notificaciones (en ms)
        timeout = 3000, -- 3 segundos

        -- Configuración para el color de fondo
        background_colour = "#000000",

        -- Configuración adicional para evitar que se queden abiertas
        stages = "fade_in_slide_out", -- Animación de entrada y salida
        render = "default", -- Estilo de renderizado

        -- Auto-cerrar notificaciones después del timeout
        on_open = function(win) vim.api.nvim_win_set_config(win, { zindex = 100 }) end,

        -- Configuración para cerrar automáticamente
        max_width = 50,
        max_height = 10,
        minimum_width = 50,

        -- Configurar para que las notificaciones no se acumulen
        fps = 30,
        level = 2, -- Solo mostrar mensajes de nivel INFO o superior
      }

      -- Reemplazar vim.notify con nvim-notify
      vim.notify = notify

      -- Mapeo de teclas para cerrar todas las notificaciones manualmente
      vim.keymap.set(
        "n",
        "<leader>nc",
        function() require("notify").dismiss { silent = true, pending = true } end,
        { desc = "Clear all notifications" }
      )
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
