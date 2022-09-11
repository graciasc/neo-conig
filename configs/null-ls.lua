local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local eslint_config_files = {
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
}

local prettier_config_files = {
    ".prettierrc",
    ".prettierrc.js",
    ".prettierrc.cjs",
    "prettier.config.js",
    "prettier.config.cjs",
    ".prettierrc.yaml",
    ".prettierrc.yml",
    ".prettierrc.json",
    ".prettierrc.json5",
    ".prettierrc.toml",
}

local sources = {
---- Custom
    b.diagnostics.eslint_d.with {
      extra_filetypes = { "svelte" },
      condition = function(utils)
        return utils.root_has_file(eslint_config_files)
      end,
    },
    b.code_actions.eslint_d.with {
      extra_filetypes = { "svelte" },
      condition = function(utils)
        return utils.root_has_file(eslint_config_files)
      end,
    },
    b.formatting.prettierd.with {
      condition = function(utils)
        return utils.root_has_file(prettier_config_files)
      end,
    },
  -- webdev stuff
  -- b.formatting.deno_fmt,
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  b.diagnostics.stylelint,
  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
