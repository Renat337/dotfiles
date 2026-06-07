return {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.lib" },
    build = function()
        require("blink.cmp").build():pwait()
    end,
    opts = {
        enabled = function()
            local enabled_filetypes = {
                lua = true,
                java = true,
                python = true,
                typescript = true,
                javascript = true,
                sh = true,
                bash = true,
                json = true,
                cpp = true,
                c = true,
                rust = true,
            }
            return enabled_filetypes[vim.bo.filetype] or false
        end,
        keymap = { preset = "default" },
        sources = { default = { "lsp", "path", "buffer" } },
        fuzzy = { implementation = "rust" },
    },
}
