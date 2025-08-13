local loader = require("onedapperterm.utils.loader")

return {
    {
        'm-demare/hlargs.nvim',
        config = function ()
            local hlargs = loader.load("hlargs")
            hlargs.setup()
            hlargs.enable()
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            local illuminate = loader.load("illuminate")
            illuminate.configure({
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                delay = 100,
                large_file_cutoff = 2000,
            })
            vim.api.nvim_command("hi IlluminatedWordText guibg=#1f2730 gui=NONE")
            vim.api.nvim_command("hi IlluminatedWordRead guibg=#1f2730 gui=NONE")
            vim.api.nvim_command("hi IlluminatedWordWrite guibg=#2a3542 gui=NONE")
        end
    }
}

