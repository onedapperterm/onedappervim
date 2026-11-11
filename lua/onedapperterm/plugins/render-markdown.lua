return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        file_types = { "markdown" },
        render_modes = { "n", "c", "t" },
        anti_conceal = { enabled = true },
        completions = { lsp = { enabled = true } },
        heading = {
            sign = false,
            width = "block",
            left_pad = 1,
            right_pad = 2,
        },
        code = {
            sign = false,
            width = "block",
            left_pad = 2,
            right_pad = 4,
        },
        bullet = { icons = { "●", "○", "◆", "◇" } },
        checkbox = { enabled = true },
    },
}
