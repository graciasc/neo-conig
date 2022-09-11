local M = {}

local override = require "custom.configs.override"
--
M.plugins = {
  status = {
    dashboard = true,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.configs.lspconfig",
    },

    statusline = {
      separator_style = "round",
    },
  },

  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
  },

  user = require "custom.plugins",

  remove = {
    "folke/which-key.nvim",
  },
}

M.ui = {
  theme = "ayu-dark",
  hl_override = require "custom.highlights",
}

M.mappings = require "custom.mappings"

return M
