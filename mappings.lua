local M = {}

--
-- M.disabled = {
--    "<C-n>",
-- }
M.formatting = {
  n = {
    ["<leader>fl"] = {
      "<cmd> :%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F",
      " Autofix entire buffer with eslint_d",
    },
  },
  v = {
    -- Currently not doing range formatting
    ["<leader>fl"] = {
      "<cmd> :%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>gv",
      " Autofix visual selection with eslint_d",
    },
  },
}
M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
    ["<leader>dd"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "diagnostic" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "   toggle shade.nvim",
    },
  },
}

M.disabled = {
  n = {
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<leader>tk"] = "",
  },
}

M.harpoon = {
  n = {
    ["<leader>ha"] = { "<cmd>lua require('harpoon.mark').add_file()<CR>", " add file" },
    ["<leader>he"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "toggle menu" },
    ["<leader>hm"] = { "<cmd>lua require('harpoon.ui').nav_file(vim.v.count1)<CR>", "go to file last file" },
    ["<leader>1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "file 1" },
    ["<leader>2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "file 2" },
    ["<leader>3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "file 3" },
    ["<leader>4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "file 4" },
  },
}

M.telescope = {
  n = {

    ["<leader>ch"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
  },
}

M.dap = {
  n = {
    ["<F5>"] = { "<cmd>lua require'dap'.continue()<CR>", "continue" },
    ["<F10>"] = { "<cmd>lua require'dap'.step_over()<CR>", "step over" },
    ["<F11>"] = { "<cmd>lua require'dap'.step_into()<CR>", "step into" },
    ["<F12>"] = { "<cmd>lua require'dap'.step_out()<CR", "step out" },
    ["<leader> b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "toggle breakpoint" },
    ["<leader> B"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "break point condition",
    },
    ["<leader>lp"] = {
      "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      "log point message",
    },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.open()<CR>", "repl open" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<CR>", "run last" },
  },
}

return M
