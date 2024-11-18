local M = {}

function M.load(module_name)
    local status_ok, module = pcall(require, module_name)
    if not status_ok then
        print(module_name .. " require failed")
        return nil
    end
    return module
end

return M
