local loader = require("onedapperterm.utils.loader")

local M = {}

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = false, -- disable virtual text
        signs = { active = signs, },-- show signs
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 60,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        width = 60,
    })
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><Up>", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><Down>", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

M.on_attach = function(client, bufnr)
    -- TODO: refactor this into a method that checks if string in list
    -- since this shit is to avoid the f*cking change of colors of the theme that are handled from treesitter.
    if client.name == "ts_ls" or client.name == "astro" then
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.semanticTokensProvider = nil
    end

    -- document documentHighlightProvider disabled on json to avoid weird cursor move error 
    -- have to fix this shit as well when have time for it :P 
    if client and client.name == "jsonls" then
        client.server_capabilities.documentHighlightProvider = false
    end

    if client.name == 'angularls' then
        vim.api.nvim_buf_set_option(bufnr, 'expandtab', true)   -- use spaces, not tabs
        vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 4)     -- indent size for >>, <<, etc.
        vim.api.nvim_buf_set_option(bufnr, 'tabstop', 4)        -- a literal tab == 4 spaces
        vim.api.nvim_buf_set_option(bufnr, 'softtabstop', 4)    -- editing <Tab> behavior
    end

    -- Enable folding capabilities for nvim-ufo
    if client.server_capabilities and client.name ~= "pyright" then
        client.server_capabilities.foldingRangeProvider = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        --check this poetry thing 
        local root_dir = client.config.root_dir or vim.fn.getcwd()
        local env_path = vim.trim(vim.fn.system(
            'cd "' .. root_dir .. '" && poetry env info -p 2>/dev/null'
        ))
        if env_path ~= "" then
            client.config.settings = client.config.settings or {}
            client.config.settings.python = client.config.settings.python or {}
            client.config.settings.python.pythonPath = env_path .. "/bin/python"
        end
    end

    lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = loader.load("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
