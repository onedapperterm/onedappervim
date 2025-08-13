local Loader = require("onedapperterm.utils.loader")
local Remap = require("onedapperterm.utils.remap")

return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'LspAttach',
    config = function ()
        local ufo = Loader.load('ufo')
        ufo.setup()

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        Remap.nnoremap('zR', require('ufo').openAllFolds)
        Remap.nnoremap('zM', require('ufo').closeAllFolds)
    end
}
