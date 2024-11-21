local loader = require("onedapperterm.utils.loader")

return {
    {
        'm-demare/hlargs.nvim',
        config =function ()
            local hlargs = loader.load("hlargs")
            hlargs.setup()
            hlargs.enable()
        end
    }
}
