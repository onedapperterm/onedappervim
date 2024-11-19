local loader = require("onedapperterm.utils.loader")

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
    config = function ()
        local bufferline = loader.load("bufferline")
        bufferline.setup({})
    end
}
