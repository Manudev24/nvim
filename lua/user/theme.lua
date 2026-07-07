-- Persistence for the colorscheme chosen with <Leader>ft.
-- Stores the name in the state directory (not committed) and reloads it on every
-- startup. Saving is triggered by the `ColorScheme` autocmd in astrocore.
local M = {}

local file = vim.fn.stdpath "state" .. "/last_colorscheme"
local fallback = "onedark"

--- Return the persisted colorscheme, or the default one if none is stored.
function M.load()
  local ok, lines = pcall(vim.fn.readfile, file)
  if ok and lines[1] and lines[1] ~= "" then return lines[1] end
  return fallback
end

--- Save the active colorscheme for the next startup.
function M.save(name)
  if name and name ~= "" and name ~= "none" then pcall(vim.fn.writefile, { name }, file) end
end

return M
