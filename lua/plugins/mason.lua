return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "eslint", "lua_ls", "ts_ls" },
                opts = { inlay_hints = { enabled = true } }
            })
        end,
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({})
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufnewFile" },
        config = function()
            require("neodev").setup({})
            local lspconfig = require("lspconfig")

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities,
                require("cmp_nvim_lsp").default_capabilities())

            -- LUA LSP
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "require", },
                        },
                        telemetry = { enable = false, },
                        hint = { enable = true }
                    },
                },
            })

            -- VUE LSP
            lspconfig.volar.setup({
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                init_options = {
                    typescript = {
                        tsdk =
                        '/Users/augustolopez/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib'
                    },
                    vue = {
                        hybridMode = false,
                    },
                },
            })

            -- PHP LSP
            lspconfig.intelephense.setup {}

            local RangeFormatting = function()
                local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, "<"))
                local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, ">"))
                vim.lsp.buf.format({
                    range = {
                        ["start"] = { start_row, 0 },
                        ["end"] = { end_row, 0 },
                    },
                    async = true,
                })
            end

            -- Inlay parameter hints
            if vim.lsp.inlay_hint then
                vim.keymap.set(
                    "n",
                    "<leader>H",
                    function()
                        local change = not vim.lsp.inlay_hint.is_enabled(vim.lsp.inlay_hint
                            .enable.Filter)
                        vim.lsp.inlay_hint.enable(change)
                    end,
                    { desc = "Toggle inlay hints" }
                )
            end

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local keymap = function(mode, key, action, desc)
                        vim.keymap.set(mode, key, action,
                            { buffer = ev.buf, remap = false, desc = desc })
                    end

                    keymap("n", "gd", vim.lsp.buf.definition, "go to definition (LSP)")
                    keymap("n", "gD", vim.lsp.buf.declaration, "go to declaration (LSP)")
                    keymap("n", "gr", vim.lsp.buf.references, "go to [r]eferences (LSP)")
                    keymap("n", "gi", vim.lsp.buf.implementation, "goto implementation (LSP)")
                    keymap("n", "gK", vim.lsp.buf.hover, "show info (LSP)")     -- K is now default for show_info
                    keymap("n", "R", vim.lsp.buf.rename, "rename symbol (LSP)") -- default is <F2>
                    keymap("n", "g=", vim.lsp.buf.format, "reformat (LSP)")
                    keymap("v", "g=", RangeFormatting, "reformat (LSP)")
                    keymap("n", "gl", vim.lsp.diagnostic.get_line_diagnostics,
                        "line diagnostic (LSP)")
                    keymap("n", "<C-k>", vim.lsp.buf.signature_help, "signature help (LSP)")
                    keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder,
                        "add workspace folder (LSP)")
                    keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder,
                        "remove workspace folder (LSP)")
                    keymap("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, "(LSP) list workspace folders")
                    keymap("n", "<space>D", vim.lsp.buf.type_definition, "type definition (LSP)")
                    keymap({ "n", "v" }, "<space>ca", function()
                        vim.lsp.buf.code_action({ apply = true })
                    end, "code action (LSP)")
                end,
            })
        end,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>xw",
                function() require("trouble").toggle("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>xd",
                function() require("trouble").toggle("document_diagnostics") end)
            vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
            vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
            vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
        end
    },
    {
        -- Autoformat on save,
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    vue = { "prettier", "prettierd", stop_after_first = true },
                    php = { "php-cs-fixer" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 1000,
                    lsp_fallback = true,
                },
                notify_on_error = true,
                formatters = {
                    ["php-cs-fixer"] = {
                        command = "php-cs-fixer",
                        args = {
                            "fix",
                            "--rules=@PSR2",
                            "$FILENAME",
                        },
                        stdin = false,
                    },
                }
            })
        end,
    },
    {
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        config = function()
            require("toggle_lsp_diagnostics").init()
            vim.keymap.set("n", "<leader>x", ":ToggleDiag<cr>",
                { desc = "Toggle LSP diagnostics (warnings)" })
        end,
    },
}
