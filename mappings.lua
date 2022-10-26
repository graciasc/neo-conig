local M = {}

--
-- M.disabled = {
--    "<C-n>",
-- }

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
  }
}

return M
