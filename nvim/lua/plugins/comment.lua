return {
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<leader>/",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Toggle Comment",
      },
      {
        "<leader>/",
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        mode = "v",
        desc = "Toggle Comment (Visual)",
      },
    },
  },
}
