return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- disable LazyVim default
      { "<leader>e", false },

      -- add your new binding
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "NeoTree (cwd)",
      },
    },
  },
}
