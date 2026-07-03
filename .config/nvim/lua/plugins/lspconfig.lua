-- LSP Plugins for NixOS
-- LSP servers/formatters provided by Nix packages, not mason.
return {
    -- Disable mason — Nix provides all LSP/formatter/debugger binaries
    { "mason-org/mason.nvim", enabled = false },
    { "mason-org/mason-lspconfig.nvim", enabled = false },
    { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "j-hui/fidget.nvim", opts = {} },
            "saghen/blink.cmp",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("cr", vim.lsp.buf.rename, "[R]ename")
                    map("ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

                    local function client_supports_method(client, method, bufnr)
                        return client:supports_method(method, bufnr)
                    end

                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            event.buf
                        )
                    then
                        local highlight_augroup =
                            vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                            end,
                        })
                    end

                    if
                        client
                        and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
                    then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            vim.diagnostic.config({
                severity_sort = true,
                float = { border = "rounded", source = "if_many" },
                underline = { severity = vim.diagnostic.severity.ERROR },
                signs = vim.g.have_nerd_font and {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                    },
                } or {},
                virtual_text = {
                    source = "if_many",
                    spacing = 2,
                    format = function(diagnostic)
                        local diagnostic_message = {
                            [vim.diagnostic.severity.ERROR] = diagnostic.message,
                            [vim.diagnostic.severity.WARN] = diagnostic.message,
                            [vim.diagnostic.severity.INFO] = diagnostic.message,
                            [vim.diagnostic.severity.HINT] = diagnostic.message,
                        }
                        return diagnostic_message[diagnostic.severity]
                    end,
                },
            })

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            local servers = {
                clangd = {},
                gopls = {},
                basedpyright = {},
                omnisharp = {},
                bashls = {},
                cssls = {},
                nil_ls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = {
                                    "hl", -- Hyprland global object
                                },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
            }

            for server_name, server_config in pairs(servers) do
                server_config.capabilities =
                    vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
                require("lspconfig")[server_name].setup(server_config)
            end
        end,
    },
}
-- vim: ts=2 sts=2 sw=2 et
