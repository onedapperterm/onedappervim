return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")

            require("dapui").setup({})
            require("nvim-dap-virtual-text").setup({
                commented = true, -- Show virtual text alongside comment
            })

            dap_python.setup("python3")

            vim.fn.sign_define("DapBreakpoint", {
                text = "",
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapBreakpointRejected", {
                text = "", -- or "❌"
                texthl = "DiagnosticSignError",
                linehl = "",
                numhl = "",
            })

            vim.fn.sign_define("DapStopped", {
                text = "", -- or "→"
                texthl = "DiagnosticSignWarn",
                linehl = "Visual",
                numhl = "DiagnosticSignWarn",
            })

            -- Automatically open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            local Remap = require("onedapperterm.utils.remap")
            local nnoremap = Remap.nnoremap

            -- Toggle breakpoint
            nnoremap("<leader>b", function()
                dap.toggle_breakpoint()
            end)

            -- Continue / Start
            nnoremap("<leader>c", function()
                dap.continue()
            end)

            -- Step Over
            nnoremap("<leader>l", function()
                dap.step_over()
            end)

            -- Step Into
            nnoremap("<leader>di", function()
                dap.step_into()
            end)

            -- Step Out
            nnoremap("<leader>do", function()
                dap.step_out()
            end)

            -- Keymap to terminate debugging
            nnoremap("<leader>dq", function()
                dap.terminate()
                dapui.toggle()
            end)

            -- Toggle DAP UI
            nnoremap("<leader>de", function()
                dapui.toggle()
            end)
        end,
    },
}
