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
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			'hrsh7th/cmp-nvim-lsp',
			"j-hui/fidget.nvim",
		},
		config = function()
            local fidget = loader.load("fidget")
			local mason = loader.load("mason")
			local mason_lsp_config = loader.load("mason-lspconfig")
			local lspconfig = loader.load("lspconfig")

            fidget.setup({})
			mason.setup()
			mason_lsp_config.setup({
				ensure_installed = servers,
                -- TODO: ensure installed linters and formatters as well (black, prettier...)
			})

            local lsp_handlers_config = require("onedapperterm.config.lsp-handlers-config")
            lsp_handlers_config.setup()

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    on_attach = function(client, bufnr)
                        lsp_handlers_config.on_attach(client, bufnr)
                    end
                })
            end
		end,
	},
}
