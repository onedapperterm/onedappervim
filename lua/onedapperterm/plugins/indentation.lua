local loader = require("onedapperterm.utils.loader")

return {
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
        local hooks = loader.load("ibl.hooks")

        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "IBLIndent", { fg = "#1c2330" })
        end)

        local indent_bl = loader.load("ibl")
        indent_bl.setup({

            indent = {
                char = "▏",
                highlight = "IBLIndent"
            },
            scope = {
                show_start = false,
                show_end = false,
                injected_languages = false,
                priority = 1000,
                show_exact_scope = false,
            },
            whitespace = { remove_blankline_trail = true },
        })
    end
}
