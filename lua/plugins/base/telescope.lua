return {
  "nvim-telescope/telescope.nvim",
  priority = 1050,
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
  },
  -- change some options
  config = function()
    require("telescope").setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      --extensions_list = { "themes", "terms", "notify" },
      --TODO: Add themes
      --
    })

    require("config.global-highlights").apply_highlights()

    -- Handles telescope colors
    -- local colors = require("catppuccin.palettes").get_palette(frappe)
    -- local TelescopeColor = {
    --   TelescopeMatching = { fg = colors.flamingo },
    --   TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
    --
    --   TelescopePromptPrefix = { bg = colors.surface0 },
    --   TelescopePromptNormal = { bg = colors.surface0 },
    --   TelescopeResultsNormal = { bg = colors.mantle },
    --   TelescopePreviewNormal = { bg = colors.mantle },
    --   TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    --   TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    --   TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    --   TelescopePromptTitle = { bg = colors.maroon, fg = colors.mantle },
    --   TelescopeResultsTitle = { fg = colors.mantle },
    --   TelescopePreviewTitle = { bg = colors.teal, fg = colors.mantle },
    -- }
    --
    -- for hl, col in pairs(TelescopeColor) do
    --   vim.api.nvim_set_hl(0, hl, col)
    -- end
    local extensions = { "notify", "persisted", "themes" }
    for _, ext in ipairs(extensions) do
      pcall(function()
        require("telescope").load_extension(ext)
      end)
    end
  end,
}