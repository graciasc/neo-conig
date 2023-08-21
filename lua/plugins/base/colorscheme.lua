return {
  "bluz71/vim-nightfly-guicolors",
  "lunarvim/darkplus.nvim",
  "projekt0n/github-nvim-theme",
  "olimorris/onedarkpro.nvim",
  "Mofiqul/vscode.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    -- TODO: Add priority to for lazy loaded
    "NvChad/base46",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
