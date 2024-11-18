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

-- -- TODO: ensure installed linter for mason 
-- local formatters = {
--     "stylua",
--     "prettier",
--     "black",
-- }

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- "hrsh7th/nvim-cmp",
			-- 'hrsh7th/cmp-nvim-lsp'
			-- 'hrsh7th/cmp-nvim-lua'
			-- "hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			-- "j-hui/fidget.nvim",
		},
		config = function()
			local mason = loader.load("mason")
			local mason_lsp_config = loader.load("mason-lspconfig")
			local lspconfig = loader.load("lspconfig")

			mason.setup()
			mason_lsp_config.setup({
				ensure_installed = servers,
			})

			lspconfig.ts_ls.setup({})
			lspconfig.html.setup({})
			--the others ...
		end,
	},
}
