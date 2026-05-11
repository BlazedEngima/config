return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- disable LazyVim default
      { "<leader>e", false },

      -- New neo tree mapping
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "NeoTree (cwd)",
      },
    },
    opts = {
      window = {
        mappings = {
          ["<C-v>"] = "open_vsplit",
          ["<C-h>"] = "open_split",
          ["e"] = function()
            vim.cmd("Neotree focus filesystem left", true)
          end,
          ["b"] = function()
            vim.cmd("Neotree focus buffers left", true)
          end,
          ["g"] = function()
            vim.cmd("Neotree focus git_status left", true)
          end,
        },
      },
    },
  },
}
