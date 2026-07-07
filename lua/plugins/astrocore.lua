-- ~/.config/nvim/lua/plugins/astrocore.lua
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- 1. FEATURES
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
    -- 2. DIAGNOSTICS
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- 3. OPTIONS
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
    },
    -- 4. KEYMAPS
    mappings = {
      -- NORMAL MODE
      n = {
        -- Buffer navigation (your current mappings)
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>C"] = { "<cmd>bdelete<CR>", desc = "Close Buffer" },
        ["<Leader>c"] = false, -- Disable original
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- ==========================================
        -- CREATE FILE IN CURRENT DIRECTORY (<Leader>cf)
        -- ==========================================
        ["<Leader>cf"] = {
          function()
            -- Get the current buffer's path
            local current_dir = vim.fn.expand "%:p:h" .. "/"

            vim.ui.input({
              prompt = "Create file in: ",
              default = current_dir,
              completion = "file",
            }, function(input)
              if not input or input == "" then return end

              -- Automatically create folders if they don't exist
              local dir = vim.fn.fnamemodify(input, ":h")
              if vim.fn.isdirectory(dir) == 0 then vim.fn.mkdir(dir, "p") end

              vim.cmd("edit " .. input)
              vim.cmd "write"
              print("File created: " .. input)
            end)
          end,
          desc = "Create file in current directory",
        },

        -- ==========================================
        -- DELETE WITHOUT COPY (Black hole register)
        -- ==========================================
        ["d"] = { '"_d', desc = "Delete (no yank)" },
        ["c"] = { '"_c', desc = "Change (no yank)" },
        ["x"] = { '"_x', desc = "Delete char (no yank)" },
        ["D"] = { '"_D', desc = "Delete line (no yank)" },
        ["C"] = { '"_C', desc = "Change line (no yank)" },
      },

      -- VISUAL MODE
      v = {
        ["d"] = { '"_d', desc = "Delete (no yank)" },
        ["c"] = { '"_c', desc = "Change (no yank)" },
        ["x"] = { '"_x', desc = "Delete char (no yank)" },
      },
    },
    -- 5. AUTOCOMMANDS (FOR JQ)
    autocmds = {
      json_formatting = {
        {
          event = "FileType",
          pattern = { "json", "httpResult" },
          callback = function() vim.bo.formatprg = "jq" end,
        },
      },
      -- Persist the theme chosen with <Leader>ft for the next startup
      save_colorscheme = {
        {
          event = "ColorScheme",
          desc = "Save the selected colorscheme",
          callback = function(args) require("user.theme").save(args.match) end,
        },
      },
    },
  },
}
