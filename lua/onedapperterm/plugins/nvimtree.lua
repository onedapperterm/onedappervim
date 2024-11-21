local loader = require("onedapperterm.utils.loader")

local function my_on_attach(bufnr)
    local api = loader.load("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open: New Tab"))
    vim.keymap.set("n", "h", api.node.open.edit, opts("Close Directory"))

    --some color fixes
    vim.api.nvim_command("hi NvimTreeWinSeparator guifg=#232d38 gui=bold")
    vim.api.nvim_command("hi NvimTreeEndOfBuffer guifg=#161c23")
    vim.api.nvim_command("hi NvimTreeIndentMarker guifg=#232d38")
end

return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local nvim_tree = loader.load("nvim-tree")
        nvim_tree.setup({
            on_attach = my_on_attach,
            hijack_netrw = true,
            sort_by = "case_sensitive",
            view = {
                adaptive_size = true,
                side = "left",
            },
            renderer = {
                root_folder_modifier = ":t",
                indent_markers = {
                    enable = true,
                    inline_arrows = true,
                    icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        bottom = "─",
                        none = " ",
                    },
                },
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
            },
        })
    end,
}
