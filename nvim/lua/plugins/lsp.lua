return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "jdtls", "bashls", "jsonls", "clangd", "rust_analyzer" },
        -- jdtls is excluded because nvim-jdtls manages it with bemol workspace folders
        automatic_enable = {
            exclude = { "jdtls" },
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function()
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
                vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
            end,
        })
    end,
}
