local loader = require("onedapperterm.utils.loader")

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = loader.load("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { 
                "javascript",
                "typescript",
                "python",
                "html",
                "scss",
                "json",
                "gitcommit",
                "dockerfile",
                "yaml",
                "xml",
                "css",
                "bash",
                "angular",
                "astro",
                "vue",
                "lua",
                "c", 
                "vim",
                "vimdoc",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            autopairs = { enable = true },
            indent = { 
                enable = true,
                disable = { "python", "css" }
            },  
        })
    end
}
