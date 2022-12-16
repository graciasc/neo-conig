local dap = require "dap"
local dapui = require "dapui"
dapui.setup()

require("dap-vscode-js").setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
}

for _, language in ipairs { "typescript", "javascript" } do
  -- Example custom DAP configurations for JS:
  -- https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      env = {
        NODE_OPTIONS = "--inspect",
      },
      profileStartup = false, --if true, will start profiling as soon as the process launches
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug build script",
      -- trace = true, -- include debugger info
      runtimeExecutable = "yarn",
      runtimeArgs = { "build" },
      env = {
        NODE_OPTIONS = "--inspect",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
  }
end

for _, language in ipairs { "typescriptreact", "javascriptreact" } do
    require("dap").configurations[language] = {
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
      {
        type = "pwa-chrome",
        name = "Launch Chrome",
        request = "launch",
        url = "http://localhost:19006",
      },
    }
  end

  local debug_win = nil
  local debug_tab = nil
  local debug_tabnr = nil

  local function open_in_tab()
    if debug_win and vim.api.nvim_win_is_valid(debug_win) then
      vim.api.nvim_set_current_win(debug_win)
      return
    end

    vim.cmd "tabedit %"
    debug_win = vim.fn.win_getid()
    debug_tab = vim.api.nvim_win_get_tabpage(debug_win)
    debug_tabnr = vim.api.nvim_tabpage_get_number(debug_tab)

    dapui.open()
  end

  local function close_tab()
    dapui.close()

    if debug_tab and vim.api.nvim_tabpage_is_valid(debug_tab) then
      vim.api.nvim_exec("tabclose " .. debug_tabnr, false)
    end

    debug_win = nil
    debug_tab = nil
    debug_tabnr = nil
  end

  -- Attach DAP UI to DAP events
  dap.listeners.after.event_initialized["dapui_config"] = function()
    open_in_tab()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    close_tab()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    close_tab()
  end

