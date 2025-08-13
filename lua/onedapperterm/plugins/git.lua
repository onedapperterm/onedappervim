return{
    "tpope/vim-fugitive",
    dependencies = {
        "kristijanhusak/defx-git" -- just for nice Icons
    },
    config = function ()
        vim.keymap.set("n", "<leader>gs", ":Git <CR>" )
        vim.keymap.set("n", "<leader>ga", ":Git add . <CR>" )
        vim.keymap.set("n", "<leader>gc", ":tab Git commit <CR>" )
        vim.keymap.set("n", "<leader>gb", ":tab Git blame <CR><C-w>l <C-o>")
        vim.keymap.set("n", "<leader>gd", ":Git diff --cached<CR><C-w>H <C-w>l")
        vim.keymap.set("n", "<leader>di", ":Telescope git_status<CR>")

        --Allow spelling on git commits
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "gitcommit",
            callback = function()
                vim.opt_local.spell = true
                vim.opt_local.spelllang = { "en_us" }
            end,
        })
    end
}
