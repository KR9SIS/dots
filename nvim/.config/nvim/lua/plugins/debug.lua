-- if true then
--     return {}
-- end

return {
    -- NOTE: Yes, you can install new plugins here!
    "mfussenegger/nvim-dap",
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        "rcarriga/nvim-dap-ui",

        -- Required dependency for nvim-dap-ui
        "nvim-neotest/nvim-nio",

        -- Installs the debug adapters for you
        "mason-org/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",

        -- Add your own debuggers here
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("mason-nvim-dap").setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                "debugpy",
                "dap-python",
                "dap-go",
                "codelldb",
            },
        })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = "",
                },
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = {},
                mappings = {},
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = "",
            },
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 0.65,
                        },
                        {
                            id = "watches",
                            size = 0.15,
                        },
                        {
                            id = "stacks",
                            size = 0.10,
                        },
                        {
                            id = "breakpoints",
                            size = 0.10,
                        },
                    },
                    position = "left",
                    size = 40,
                },
                {
                    elements = {
                        {
                            id = "repl",
                            size = 0.3,
                        },
                        {
                            id = "console",
                            size = 0.7,
                        },
                    },
                    position = "bottom",
                    size = 10,
                },
            },
            mappings = {},
            render = {
                indent = 1,
            },
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            local set = vim.keymap.set
            set("n", "<Right>", dap.step_into)
            set("n", "<Down>", dap.step_over)
            set("n", "<Left>", dap.step_out)
            set("n", "<Up>", dap.terminate)
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            local del = vim.keymap.del
            del("n", "<Right>")
            del("n", "<Down>")
            del("n", "<Left>")
            del("n", "<Up>")
            dapui.close()
        end

        -- Install golang specific config
        require("dap-go").setup({})
        require("dap-python").setup("/home/kr9sis/.virtualenv/debugpy/bin/python")
    end,

    keys = {
        -- Basic debugging keymaps, feel free to change to your liking!
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Debug: Start/Continue",
        },
        {
            "<leader>dr",
            function()
                require("dap").restart()
            end,
            desc = "Debug: Restart",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Debug: Toggle Breakpoint",
        },
        {
            "<leader>dB",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Debug: Set Breakpoint",
        },
        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        {
            "<leader>du",
            function()
                require("dapui").toggle()
            end,
            desc = "Debug: Toggle Dap UI",
        },
    },
}
