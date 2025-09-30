local loader = require("onedapperterm.utils.loader")

local servers = {
	"ts_ls",
	"html",
	"pyright",
	"jsonls",
	"angularls",
	"lua_ls",
	"cssls",
	"tailwindcss",
	"eslint",
	"astro",
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			'hrsh7th/cmp-nvim-lsp',
			"j-hui/fidget.nvim",
		},
		config = function()
            local fidget = loader.load("fidget")
			local mason = loader.load("mason")
			local mason_lsp_config = loader.load("mason-lspconfig")

            fidget.setup({})
			mason.setup()
			mason_lsp_config.setup({
				ensure_installed = servers,
                automatic_enable = false
                -- TODO: ensure installed linters and formatters as well (black, prettier...)
			})

            local lsp_handlers_config = require("onedapperterm.config.lsp-handlers-config")
            lsp_handlers_config.setup()

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    print("LSP attached: " .. client.name)
                    lsp_handlers_config.on_attach(client, bufnr)
                end,
            })

			for _, server in ipairs(servers) do
                vim.lsp.config(server, {
					capabilities = lsp_handlers_config.capabilities,
                })
                vim.lsp.enable(server)
			end
		end,
	},
}
