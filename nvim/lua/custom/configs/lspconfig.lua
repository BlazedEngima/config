-- if not vim.lsp.config then
--   vim.lsp.config = require("plugins.configs.lspconfig")
--   on_attach = vim.lsp.config.on_attach
--   capabilites = vim.lsp.config.capabilities
-- end

local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local util = require "lspconfig/util"

-- clangd setup
vim.lsp.config["clangd"] = {
  on_attach = function(client, bufnr)

    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    if client.server_capabilities.inlayHintProvider then
      vim.g.inlay_hints_visible = true

      local toggle_inlay_hints = function ()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end

      vim.keymap.set('n', '<leader>ih', toggle_inlay_hints, bufopts)

      vim.lsp.inlay_hint.enable()
    else
      print("No inlay hints available")
    end

    on_attach(client, bufnr)
  end,

  capabilities = capabilities,

  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "--inlay-hints",
    "--background-index",
    "--clang-tidy",
    "--enable-config",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "-j=4",
    "--fallback-style=llvm",
  },

  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
}

vim.lsp.config["rust_analyzer"] = {
  on_attach = function(client, bufnr)

    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    if client.server_capabilities.inlayHintProvider then
      vim.g.inlay_hints_visible = true

      local toggle_inlay_hints = function ()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end

      vim.keymap.set('n', '<leader>ih', toggle_inlay_hints, bufopts)

      vim.lsp.inlay_hint.enable()
    else
      print("No inlay hints available")
    end

    on_attach(client, bufnr)
  end,

  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    }
  }
}

-- Python setup
vim.lsp.config["pyright"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
}

-- cmake setup
vim.lsp.config["cmake"] = {
    on_attach = on_attach,
    capabilities = capabilities,
}
