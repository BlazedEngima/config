return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {},
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
        settings = {
          ["clangd"] = {
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "always" },
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
          },
        },

        inlay_hints = {
          enabled = true,
        },

        code_lens = {
          enabled = true,
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            inlayHints = {
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = { enable = true },
              closureReturnTypeHints = { enable = "always" },
              lifetimeElisionHints = { enable = "always" },
              parameterHints = { enable = true },
              typeHints = { enable = true },
            },
          },
        },

        inlay_hints = {
          enabled = true,
        },

        code_lens = {
          enabled = true,
        },
      },
    },
  },
}
