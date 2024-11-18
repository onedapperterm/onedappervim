local loader = require("onedapperterm.utils.loader")

return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = loader.load("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>af", function() 
        harpoon:list():add() 
        print("File added to Harpoon list")
    end, { desc = "Harpoon: Mark File" })
    vim.keymap.set("n", "<leader>rf", function() 
        harpoon:list():remove() 
        print("File removed from Harpoon list")
    end, { desc = "Harpoon: Remove File" })
    vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  end,
}
