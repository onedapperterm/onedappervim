return {
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
    },
    {
        "vv9k/bogster",
        name = "bogster",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("bogster")
        end
    }
}
