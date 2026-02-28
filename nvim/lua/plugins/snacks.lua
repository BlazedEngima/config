return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>/", false },
    { "<leader>fT", false },
    { "<leader>ft", false },
    -- Floating terminal
    {
      "<A-i>",
      function()
        Snacks.terminal(nil, { win = { border = "rounded", position = "float" }, cwd = LazyVim.root() })
      end,
      desc = "Floating Terminal (Root Dir)",
    },

    -- Live grep
    {
      "<leader>fw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live grep",
    },

    -- Live grep
    {
      "<leader>fq",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },

    -- Grep lines
    {
      "<leader>fz",
      function()
        Snacks.picker.lines()
      end,
      desc = "Grep current file",
    },

    -- File explorer
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "File explorer",
    },

    -- Old files
    {
      "<leader>fo",
      function()
        Snacks.picker.recent()
      end,
      desc = "File explorer",
    },

    -- Registers
    {
      '<leader>f"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Search registers",
    },

    -- Jumps
    {
      "<leader>fj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Search jumps",
    },

    -- Jumps
    {
      "<leader>fk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Search keymaps",
    },
  },
}
