return {

   ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         local present, autotag = pcall(require, "nvim-ts-autotag")

         if present then
            autotag.setup()
         end
      end,
   },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.configs.null-ls"
      end,
   },

   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.configs.truezen"
      end,
   },

   ["nvim-neorg/neorg"] = {
      ft = "norg",
      after = "nvim-treesitter",
      config = function()
         require "custom.configs.neorg"
      end,
   },

   ["nvim-treesitter/playground"] = {
      cmd = "TSCaptureUnderCursor",
      config = function()
         require("nvim-treesitter.configs").setup()
      end,
   },

   ["andreadev-it/shade.nvim"] = {
      module = "shade",
      config = function()
         require("shade").setup {
            overlay_opacity = 50,
            opacity_step = 1,
            exclude_filetypes = { "NvimTree" },
         }
      end,
   },
   ["glepnir/dashboard-nvim"] = {
      config = function()
         require "dashboard"
      end,
   },
   ["akinsho/toggleterm.nvim"] = {
      config = function()
         require "toggleterm"
      end,
   },
   ["https://github.com/folke/trouble.nvim"] = {
      config = function()
         require "trouble"
      end,
   },
   ["alexghergh/nvim-tmux-navigation"] = {
      config = function()
         require("nvim-tmux-navigation").setup {
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
               left = "<C-h>",
               down = "<C-j>",
               up = "<C-k>",
               right = "<C-l>",
               last_active = "<C-\\>",
               next = "<C-Space>",
            },
         }
      end,
   },
}
