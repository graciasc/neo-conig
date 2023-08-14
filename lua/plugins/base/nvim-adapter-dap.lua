return {
  "mfussenegger/nvim-dap",

  dependencies = {
    {
      "jbyuki/one-small-step-for-vimkind",
    -- stylua: ignore
    keys = {
      { "<leader>daL", function() require("osv").launch({ port = 8086 }) end, desc = "Adapter Lua Server" },
      { "<leader>dar", function() require("osv").launch({ port = 8080 }) end, desc = "Adapter React Server" },
      { "<leader>dal", function() require("osv").run_this() end, desc = "Adapter Lua" },
    },
      config = function()
        local dap = require("dap")
        dap.adapters.nlua = function(callback, config)
          callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
        end
        dap.configurations.lua = {
          {
            type = "nlua",
            request = "attach",
            name = "Attach to running Neovim instance",
          },
        }
        dap.configurations.javascriptreact = {
          {
            type = "pwa-chrome",
            name = "Launch Chrome",
            request = "launch",
            url = "http://localhost:19006",
          },
          {
            type = "pwa-chrome",
            name = "Attach - Remote Debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
          },
        }
      end,
    },
  },
}
