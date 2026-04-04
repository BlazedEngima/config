return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Add file to harpoon" })

    vim.keymap.set("n", "<A-u>", function()
      harpoon:list():select(1)
    end, { desc = "Go to harpoon file 1" })
    vim.keymap.set("n", "<A-h>", function()
      harpoon:list():select(2)
    end, { desc = "Go to harpoon file 2" })
    vim.keymap.set("n", "<A-e>", function()
      harpoon:list():select(3)
    end, { desc = "Go to harpoon file 3" })
    vim.keymap.set("n", "<A-f>", function()
      harpoon:list():select(4)
    end, { desc = "Go to harpoon file 4" })

    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<A-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Toggle previous harpoon buffer" })
    -- vim.keymap.set("n", "<A-S-N>", function()
    --   harpoon:list():next()
    -- end, { desc = "Toggle next harpoon buffer" })
  end,
}
