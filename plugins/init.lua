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
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev
      "tsserver",
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "deno",
      "emmet-ls",
      "json-lsp",
      "eslint-lsp",

      -- shell
      "shfmt",
      "shellcheck",
    },
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
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
  ["echasnovski/mini.nvim"] = {
    branch = "stable",
    config = "require('custom.configs.mini')",
  },
  ["ThePrimeagen/harpoon"] = {
    config = function()
      require "custom.configs.harpoon"
    end,
  },
  ["talbergs/context.nvim"] = {
    config = function()
      require "custom.configs.context"
    end,
  },
  -- ["ggandor/lightspeed.nvim"] = {
  --   requires = { "tpope/vim-repeat" },
  --   config = function()
  --     require "lightspeed"
  --   end,
  -- },
  --
["mfussenegger/nvim-dap"] = {
    config = function()
      require("custom.configs.nvim-dap-js")
    end,
  },
	["rcarriga/nvim-dap-ui"] = {
		requires = "mfussenegger/nvim-dap",
    config = function()
      require("dapui").setup()
    end
	},
	["theHamsta/nvim-dap-virtual-text"] = {
	   config = function()
      require("nvim-dap-virtual-text").setup()
     end,
    after = "nvim-dap",	requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	},
	["nvim-telescope/telescope-dap.nvim"] = {
    -- after = 'nvim-telescope/telescope.nvim',
		requires = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
		before = { "telescope.nvim" },
    -- config = function()
    -- require('telescope').load_extension('dap')
    -- end,
	},
  ["mxsdev/nvim-dap-vscode-js"] = {
    requires = {"mfussenegger/nvim-dap"}
  },
  ["microsoft/vscode-js-debug"] = {
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
  },
   ["luukvbaal/stabilize.nvim"] = {
    config = function()
      require("stabilize").setup()
    end,
    event = { "WinNew", "WinLeave" },
  },
  ["catppuccin/nvim"] = {
    config = function()
      require "catppuccin"
    end,
  },
}
