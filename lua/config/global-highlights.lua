local M = {}
-- TODO: take in a map
function M.apply_highlights()
  local colors = require("catppuccin.palettes").get_palette("frappe")
  local TelescopeColor = {
    TelescopeMatching = { fg = colors.flamingo },
    TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

    TelescopePromptPrefix = { bg = colors.surface0 },
    TelescopePromptNormal = { bg = colors.surface0 },
    TelescopeResultsNormal = { bg = colors.mantle },
    TelescopePreviewNormal = { bg = colors.mantle },
    TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePromptTitle = { bg = colors.maroon, fg = colors.mantle },
    TelescopeResultsTitle = { fg = colors.mantle },
    TelescopePreviewTitle = { bg = colors.teal, fg = colors.mantle },
  }

  local CustomHighlightGroups = {
    -- Utilizing vibrant, standout colors for different sections
    NvChAsciiHeader = { bg = colors.lavender, fg = colors.text }, -- Headers with a soft yet noticeable background
    NvChSection = { bg = colors.surface0, fg = colors.sapphire }, -- Sections with clear contrast

    -- Custom vibrant highlights
    NvCheatsheetWhite = { bg = colors.white, fg = colors.mauve }, -- Bright background against deep text
    NvCheatsheetGray = { bg = colors.overlay0, fg = colors.text }, -- Soft background for more subdued sections
    NvCheatsheetBlue = { bg = colors.blue, fg = colors.surface0 }, -- Rich blue for standout elements
    NvCheatsheetCyan = { bg = colors.cyan, fg = colors.surface0 }, -- Bright cyan for engaging content
    NvCheatsheetRed = { bg = colors.red, fg = colors.surface0 }, -- Vivid red for important warnings or highlights
    NvCheatsheetGreen = { bg = colors.green, fg = colors.surface0 }, -- Fresh green for positive indicators
    NvCheatsheetYellow = { bg = colors.yellow, fg = colors.surface0 }, -- Sunny yellow for attention-grabbing notices
    NvCheatsheetOrange = { bg = colors.peach, fg = colors.surface0 }, -- Warm peach for friendly, less aggressive alerts
    NvCheatsheetPurple = { bg = colors.purple, fg = colors.surface0 }, -- Deep purple for a touch of mystery and elegance
    NvCheatsheetMagenta = { bg = colors.mauve, fg = colors.surface0 }, -- Mauve for unique and standout features
  }

  for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
  end
  for hl, col in pairs(CustomHighlightGroups) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

return M
