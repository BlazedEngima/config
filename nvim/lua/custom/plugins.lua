local plugins = {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require("telescope").load_extension("lazygit")
    end,
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    "garymjr/nvim-snippets",
    event = "VeryLazy",
    opts = { friendly_snippets = true },
    keys = require "custom.keys.nvim-snippets"
  },
  {
    "stevearc/quicker.nvim",
    event = "FileType qf",
    config = function ()
      require "custom.configs.quicker"
    end,
    opts = {},
  },
  {
    "junegunn/fzf.vim",
    event = "VeryLazy",
    dir = "~/.fzf",
    build = "./install --all"
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    event = "VeryLazy",
    dependencies = {
      "junegunn/fzf",
    },
    config = function ()
      require "custom.configs.bqf"
    end
  },
  {
    "theprimeagen/harpoon",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "nvim-neotest/nvim-nio",
    event = "VeryLazy",
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "lua-language-server",
        "clang-format",
        "cmake-language-server",
        "codelldb",
        "pyright",
        "mypy",
        "ruff",
        "rust-analyzer",
      }
    }
  }
}

return plugins
